import httpclient, asyncdispatch, json, strutils

type EC2MetaData* = ref object

const metadataUrl = "http://169.254.169.254/latest/meta-data/"

proc metadataAvailable(): Future[bool] =
    result = newFuture[bool]()
    let f = result
    let client = newAsyncHttpClient()
    var complete = false
    let c = client.getContent(metadataUrl)
    let t = sleepAsync(200)
    c.callback = proc() =
        if not complete:
            complete = true
            f.complete(true)

    t.callback = proc() =
        if not complete:
            complete = true
            f.complete(false)

proc newEC2MetaData*(): Future[EC2MetaData] {.async.} =
    let available = await metadataAvailable()
    if available:
        result.new()

proc request*(md: EC2MetaData, path: string): Future[string] {.async.} =
    let client = newAsyncHttpClient()
    result = await client.getContent(metadataUrl & path)
    client.close()

proc requestJson*(md: EC2MetaData, path: string): Future[JsonNode] {.async.} =
    let r = await md.request(path)
    result = parseJson(r)

proc instanceId*(md: EC2MetaData): Future[string] {.async.} =
    result = await md.request("instance-id")

proc iamInfo*(md: EC2MetaData): Future[JsonNode] {.async.} =
    result = await md.requestJson("iam/info")

proc securityCredentialsForRole*(md: EC2MetaData, roleName: string): Future[JsonNode] {.async.} =
    result = await md.requestJson("iam/security-credentials/" & roleName)

proc currentInstanceSecurityCredentials*(md: EC2MetaData): Future[JsonNode] {.async.} =
    let i = await md.iamInfo()
    let arn = i["InstanceProfileArn"].str
    let roleName = arn.split('/')[^1]
    result = await md.securityCredentialsForRole(roleName)
