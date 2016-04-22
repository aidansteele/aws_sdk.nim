import aws_sdk/request
import aws_sdk/credentials
import aws_sdk/signaturev4
import httpclient
import times
import sequtils
import strutils
import strtabs
import uri
import tables

proc request*(req: AwsRequest, credentials: AwsCredentials): string =
  var varreq = req
  
  const HttpDateFormat = "ddd, dd MMM yyyy HH:mm:ss ZZZ"
  let time = getTime()
  
  if not hasKey(varreq.headers, "Host"): varreq.headers["Host"] = varreq.uri.hostname
  if not hasKey(varreq.headers, "Date") and not hasKey(varreq.headers, "X-Amz-Date"):
    varreq.headers["Date"] = format(getLocalTime(time), HttpDateFormat)

  let scope = initCredentialScope(varreq.uri, time)
  varreq.headers["Authorization"] = authorizationHeaderv4(credentials, scope, varreq)
  
  var headerPairs = asKeyVal(toSeq(pairs(varreq.headers)))
  # headerPairs = filterIt(headerPairs, it.key != "Host")
  headerPairs = filter(headerPairs, proc(it: auto): bool = it.key != "Host") # TODO: remove massive hack
  let headerLines = map(headerPairs) do (it: auto) -> string:
    "$1: $2" % [it.key, it.value]
  let headers = join(headerLines, "\n") & "\n"
  
  let prefixedMethod = "http" & varreq.httpMethod
  let resp = request($varreq.uri, prefixedMethod, extraHeaders = headers)
  result = resp.body
