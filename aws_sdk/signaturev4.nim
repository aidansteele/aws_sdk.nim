import strutils
import strtabs
import uri
import times
import sequtils
import algorithm
import pegs
import aws_sdk/strhelpers
import sph
import queryparams
import tablemerge
import aws_sdk/request
import aws_sdk/credentials
import tables

proc asKeyVal*[T](x: T): auto = cast[seq[tuple[key: string, value: string]]](x)

const AwsTimestampFormatv4 = "yyyyMMdd'T'HHmmss'Z'"
const AwsDateFormatv4 = "yyyyMMdd"
const AwsDefaultAlgorithmv4 = "AWS4-HMAC-SHA256"

proc formattedHeaderNamesStr[T](headers: T): string =
  let lowerSignedHeaders = mapIt(toSeq(keys(headers)), toLowerAscii(it))
  result = join(sortedByIt(lowerSignedHeaders, it), ";")

proc canonicalQueryv4(request: AwsRequest): string =
  let signedHeadersStr = formattedHeaderNamesStr(request.headers)
  let payloadHashHex = toLowerAscii(hexify(request.payloadHash))
  let unsortedPairs = asKeyVal(toSeq(pairs(request.headers)))

  let p = peg"\s+"
  let canonicalHeaders = map(unsortedPairs) do (it: auto) -> string:
    let k = toLowerAscii(it.key)
    let v = replace(it.value, p, " ")
    "$1:$2" % [k, v]
  let sortedHeaderPairs = sortedByIt(canonicalHeaders, it)

  let canonicalHeadersStr = join(sortedHeaderPairs, "\l")

  let lines = [
    toUpper(request.httpMethod),
    request.uri.path,
    request.uri.query, # already sorted by now
    canonicalHeadersStr,
    "",
    signedHeadersStr,
    payloadHashHex
  ]
  result = join(lines, "\l")

proc signableStringv4(scope: AwsCredentialScope, request: AwsRequest): string =
  let algorithmDesignation = AwsDefaultAlgorithmv4

  let timestampKey = if hasKey(request.headers, "X-Amz-Date"): "X-Amz-Date" else: "Date"
  let timestamp = request.headers[timestampKey]

  let canonicalHash = sphHash[SHA256](canonicalQueryv4(request))
  let signableLines = [
    algorithmDesignation,
    timestamp,
    $scope,
    hexify(canonicalHash)
  ]
  result = join(signableLines, "\l")

proc signingKeyv4(credentials: AwsCredentials, scope: AwsCredentialScope): string =
  let dateKey = "AWS4$1" % [credentials.secretKey]
  let date = format(getGMTime(scope.time), AwsDateFormatv4)
  let dateHmac = sphHmac[SHA256](dateKey, date)
  let regionHmac = sphHmac[SHA256](dateHmac, scope.region)
  let serviceHmac = sphHmac[SHA256](regionHmac, scope.service)
  result = sphHmac[SHA256](serviceHmac, "aws4_request")

proc signaturev4*(
  credentials: AwsCredentials,
  scope: AwsCredentialScope,
  request: AwsRequest
): string =
  let signableStr = signableStringv4(scope, request)
  let key = signingKeyv4(credentials, scope)
  result = hexify(sphHmac[SHA256](key, signableStr))

proc authorizationHeaderv4*(
  credentials: AwsCredentials,
  scope: AwsCredentialScope,
  request: AwsRequest
): string =
  let signedHeadersStr = formattedHeaderNamesStr(request.headers)
  let signature = signaturev4(credentials, scope, request)

  result = "$1 Credential=$2/$3, SignedHeaders=$4, Signature=$5" % [
    AwsDefaultAlgorithmv4,
    credentials.accessKeyId,
    $scope,
    signedHeadersStr,
    signature
  ]

proc authenticationQueryParamsv4(
  credentials: AwsCredentials,
  scope: AwsCredentialScope,
  request: AwsRequest,
  expiry: int
): StringTableRef =
  result = newStringTable()
  result["X-Amz-Algorithm"] = AwsDefaultAlgorithmv4
  result["X-Amz-Credential"] = "$1/$2" % [credentials.accessKeyId, $scope]
  result["X-Amz-Date"] = format(getGMTime(scope.time), AwsTimestampFormatv4)
  result["X-Amz-Expires"] = $expiry
  result["X-Amz-SignedHeaders"] = formattedHeaderNamesStr(request.headers)

proc authenticatedUriv4*(
  request: AwsRequest,
  credentials: AwsCredentials,
  scope: AwsCredentialScope,
  expiry: int
): Uri =
  let queryP = queryParams(request.uri)
  let authParams = authenticationQueryParamsv4(credentials, scope, request, expiry)
  let mergedParams = mergedTables(queryP, authParams)
  mergedParams["X-Amz-Signature"] = signaturev4(credentials, scope, request)
  if not isNil(credentials.token): mergedParams["X-Amz-Security-Token"] = credentials.token

  var uri = request.uri
  setQueryParams(uri, mergedParams)
  result = uri

when defined(testing):
  import unittest
  # from http://docs.aws.amazon.com/general/latest/gr/sigv4_signing.html
  let credentials = AwsCredentials(accessKeyId: "AKIDEXAMPLE", secretKey: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY")
  let scope = AwsCredentialScope(time: fromSeconds(1440938160), region: "us-east-1", service: "iam")

  let headers = {
    "Host": "iam.amazonaws.com",
    "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
    "X-Amz-Date": "20150830T123600Z"
  }

  let request = AwsRequest[StringTableRef](
    httpMethod: "GET",
    uri: parseUri("https://iam.amazonaws.com/?Action=ListUsers&Version=2010-05-08"),
    headers: newStringTable(headers),
    payloadHash: dehexify("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  )

  let request2 = AwsRequest[Table[string, string]](
    httpMethod: "GET",
    uri: parseUri("https://iam.amazonaws.com/?Action=ListUsers&Version=2010-05-08"),
    headers: toTable(headers),
    payloadHash: dehexify("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  )

  check:
    authorizationHeaderv4(credentials, scope, request2) == "AWS4-HMAC-SHA256 Credential=AKIDEXAMPLE/20150830/us-east-1/iam/aws4_request, SignedHeaders=content-type;host;x-amz-date, Signature=5d672d79c15b13162d9279b0855cfba6789a8edb4c82c400e06b5924a6f2b5d7"

  check:
    signingKeyv4(credentials, scope) == dehexify("c4afb1cc5771d871763a393e44b703571b55cc28424d1a5e86da6ed3c154a4b9")
    signaturev4(credentials, scope, request) == "5d672d79c15b13162d9279b0855cfba6789a8edb4c82c400e06b5924a6f2b5d7"
    signableStringv4(scope, request) == deindent("""AWS4-HMAC-SHA256
      20150830T123600Z
      20150830/us-east-1/iam/aws4_request
      f536975d06c0309214f805bb90ccff089219ecd68b2577efef23edd43b7e1a59""")

    authenticatedUriv4(request, credentials, scope, 60) == parseUri("https://iam.amazonaws.com/?Action=ListUsers&Version=2010-05-08&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIDEXAMPLE%2F20150830%2Fus-east-1%2Fiam%2Faws4_request&X-Amz-Date=20150830T123600Z&X-Amz-Expires=60&X-Amz-Signature=5d672d79c15b13162d9279b0855cfba6789a8edb4c82c400e06b5924a6f2b5d7&X-Amz-SignedHeaders=content-type%3Bhost%3Bx-amz-date")
    authorizationHeaderv4(credentials, scope, request) == "AWS4-HMAC-SHA256 Credential=AKIDEXAMPLE/20150830/us-east-1/iam/aws4_request, SignedHeaders=content-type;host;x-amz-date, Signature=5d672d79c15b13162d9279b0855cfba6789a8edb4c82c400e06b5924a6f2b5d7"

    canonicalQueryv4(request) == deindent("""GET
      /
      Action=ListUsers&Version=2010-05-08
      content-type:application/x-www-form-urlencoded; charset=utf-8
      host:iam.amazonaws.com
      x-amz-date:20150830T123600Z

      content-type;host;x-amz-date
      e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855""")
