import packedjson, asyncdispatch, httpclient, times, uri, strtabs,xmlparser,xmltree,strutils,streams,strformat

import ../credentials
import request
import signaturev4
import sph

type
    Client* = ref object of RootObj
        cl: AsyncHttpClient
        credentials*: AwsCredentials
        region*: string
        endpoint*: string
        endpointPrefix*: string
        targetPrefix*: string # Target prefix for json protocol
        jsonVersion*: string
        apiVersion*: string
        signingName*: string

template defineClient*(name: untyped) =
    type name* = ref object of Client
    proc fillMetadata*(c: name) =
        c.endpointPrefix = awsApiMD_endpointPrefix
        c.apiVersion = awsApiMD_apiVersion
        when declared(awsApiMD_targetPrefix):
            c.targetPrefix = awsApiMD_targetPrefix
        when declared(awsApiMD_jsonVersion):
            c.jsonVersion = awsApiMD_jsonVersion
        when declared(awsApiMD_signingName):
            c.signingName = awsApiMD_signingName

proc init(c: Client, credentials: AwsCredentials, region: string) =
    c.credentials = credentials
    c.region = region
    c.endpoint = "https://" & c.endpointPrefix & "." & region & ".amazonaws.com/"

proc new*(T: typedesc[Client], credentials: AwsCredentials, region: string = "us-east-1"): T =
    result.new()
    result.fillMetadata()
    result.init(credentials, region)

proc close*(c: Client) =
    if not c.cl.isNil:
        c.cl.close()
        c.cl = nil

proc request*(c: Client, req: AwsRequest, content: string = ""): Future[string] {.async.} =
    var req = req

    const HttpDateFormat = "ddd, dd MMM yyyy HH:mm:ss 'UTC'"
    let time = getTime()

    if "Host" notin req.headers: req.headers["Host"] = req.uri.hostname
    if "Date" notin req.headers and "X-Amz-Date" notin req.headers:
        req.headers["Date"] = format(getGMTime(time), HttpDateFormat)

    var scope = initCredentialScope(req.uri, time)
    if not c.signingName.isNil:
        scope.service = c.signingName
    req.headers["Authorization"] = authorizationHeaderv4(c.credentials, scope, req)

    if c.cl.isNil:
        c.cl = newAsyncHttpClient()
    for k, v in req.headers:
        if k != "Host":
            c.cl.headers[k] = v

    let resp = await c.cl.request($req.uri, req.httpMethod, body = content)
    result = await resp.body

proc sendJsonRequest*(c: Client, name, httpMethod, uri: string, r: JsonNode): Future[JsonNode] {.async.} =
    const HttpDateFormat = "yyyyMMdd'T'HHmmss'Z'"
    #const HttpDateFormat = "ddd, dd MMM yyyy HH:mm:ss 'UTC'"
    let time = getTime()
    let timeStr = format(getGMTime(time), HttpDateFormat)

    let payload = $r
    let payloadHash = sphHash[SHA256](payload)

    # special header required by S3
    let headers = newStringTable({
        # "Accept-Encoding": "identity",
        "content-type": "application/x-amz-json-" & c.jsonVersion,
        "x-amz-target": c.targetPrefix & "." & name,
        "x-amz-date": timeStr,
        # "x-amz-content-sha256": hexify(payloadHash),
        # "date": timeStr
        }, modeCaseInsensitive)

    let req = AwsRequest[StringTableRef](
        httpMethod: httpMethod,
        uri: parseUri(c.endpoint),
        headers: headers,
        payloadHash: payloadHash
    )

    let resp = await c.request(req, payload)
    result = parseJson(resp)

proc transf(x: XmlNode; parent: var JsonTree) =
    proc atomToJson(x: string): JsonNode =
      if x == "true": %true
      elif x == "false": %false
      elif x.allCharsInSet({'0'..'9'}) and x.len < 7: %parseInt(x)
      else: %x
  
    var isArray = 0
    if x.kind == xnElement:
      for c in items(x):
        if c.kind == xnElement and c.tag == "item":
          inc isArray
      if isArray == x.len and isArray > 0:
        var arr = newJArray()
        for c in items(x):
          assert c.kind == xnElement and c.tag == "item"
          transf(c, arr)
        if parent.kind == JArray: parent.add arr
        else: parent[x.tag] = arr
        return
      var txt = ""
      var hasTxt = false
      var isAtom = true
      var obj = newJObject()
      for c in items(x):
        if c.kind in {xnText, xnCData, xnEntity}:
          txt.add c.text
          hasTxt = true
        else:
          transf(c, obj)
          isAtom = false
      if hasTxt:
        obj[x.tag] = atomToJson txt
      if parent.kind == JArray:
        parent.add obj
      elif obj.len == 1 and isAtom:
        # embed it into parent:
        for k, v in obj:
          parent[k] = v
      else:
        parent[x.tag] = obj
  
proc transform*(x: XmlNode): JsonNode =
    var node = newJObject()
    transf(x, node)
    result = JsonNode node
  
proc conv*(x: XmlNode): Future[JsonNode] =
    let res = newFuture[JsonNode]("stuff")
    res.complete(transform(x))
    result = res

template appendParamsToQuery() = 
    for k,v in r:
        uri &= fmt"&{k}={v}"

proc sendEC2Request*(c: Client, name:string, body:JsonNode, uri="/", httpMethod="POST"): Future[JsonNode] {.async.} =
    const HttpDateFormat = "yyyyMMdd'T'HHmmss'Z'"
    let time = getTime()
    let timeStr = format(getGMTime(time), HttpDateFormat)

    let payload = ""
    let payloadHash = sphHash[SHA256](payload)

    # special header required by S3
    let headers = newStringTable({
        "content-type": "application/x-www-form-urlencoded",
        "x-amz-date": timeStr,
        }, modeCaseInsensitive)

    var uri = c.endpoint & "?Action=" & name & "&Version=" & c.apiVersion

    for k,v in body:
        uri &= fmt"&{k}={v}"
        
    echo uri
    let req = AwsRequest[StringTableRef](
        httpMethod: httpMethod,
        uri: parseUri(uri),
        headers: headers,
        payloadHash: payloadHash
    )

    let resp = await c.request(req, payload)
    # echo "RESP: ", resp
    result = transform(parseXml(newStringStream resp))
    # result = parseJson(resp)
