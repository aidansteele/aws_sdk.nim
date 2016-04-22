import strutils
import strtabs
import uri
import base64
import times
import hmac
import urlencode
import queryparams
import tablemerge
import awsrequest
import awscredentials

const AwsTimestampFormatv2 = "yyyy-MM-dd'T'HH:mm:ss"

proc authenticationQueryParamsv2(credentials: AwsCredentials, time: Time): StringTableRef =
  result = newStringTable()
  result["AWSAccessKeyId"] = credentials.accessKeyId
  result["SignatureVersion"] = "2"
  result["SignatureMethod"] = "HmacSHA256"
  result["Timestamp"] = format(getGMTime(time), AwsTimestampFormatv2)
  
proc canonicalQueryv2(request: AwsRequest): string =
  let lines = [
    toUpper(request.httpMethod),
    request.uri.hostname, # TODO: probably need to include port (if nonstandard) as well
    request.uri.path,
    request.uri.query # already sorted by now
  ]
  result = join(lines, "\n")
  
proc authenticatedUriv2*(credentials: AwsCredentials, request: AwsRequest, time: Time): Uri =
  let queryP = queryParams(request.uri)
  let authParams = authenticationQueryParamsv2(credentials, time)
  let mergedParams = mergedTables(queryP, authParams)
  var authReq = request
  setQueryParams(authReq.uri, mergedParams)
  
  let signableStr = canonicalQueryv2(authReq)
  let signature = hmac_sha256(credentials.secretKey, signableStr)
  mergedParams["Signature"] = encode(signature)
  
  if not isNil(credentials.token): mergedParams["SecurityToken"] = credentials.token
  
  setQueryParams(authReq.uri, mergedParams)
  result = authReq.uri  

when defined(testing):
  import unittest
  
  # taken from http://docs.aws.amazon.com/general/latest/gr/signature-version-2.html
  let credentials = AwsCredentials(accessKeyId: "AKIAIOSFODNN7EXAMPLE", secretKey: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY", token: nil)
  let unauthUri = parseUri("https://elasticmapreduce.amazonaws.com/?Version=2009-03-31&Action=DescribeJobFlows")
  let authUri = parseUri("https://elasticmapreduce.amazonaws.com/?AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&Action=DescribeJobFlows&Signature=i91nKc4PWAt0JJIdXwz9HxZCJDdiy6cf%2FMj6vPxyYIs%3D&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2011-10-03T15%3A19%3A30&Version=2009-03-31")
  let time = fromSeconds(1317655170)
  let request = AwsRequest(httpMethod: "GET", uri: unauthUri)
  check(authenticatedUriv2(credentials, request, time) == authUri)
