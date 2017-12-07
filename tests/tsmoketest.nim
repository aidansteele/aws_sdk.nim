import json, asyncdispatch, strutils, macros
import ../aws_sdk/[ credentials ]

macro mkImport(name: static[string]): untyped =
    result = newNimNode(nnkImportStmt).add(newIdentNode(name))

var numFailures = 0

var allFutures = newSeq[Future[void]]()

template smoke(clientName: untyped, procName: untyped, key: string, arg: JsonNode = nil, region = "us-east-1") =
    ## Given verify that response to clientName.procName({}) contains `key`
    const name = astToStr(clientName)
    const modName = "../aws_sdk/" & name.toLowerAscii()
    mkImport modName

    block:
        proc runTest() {.async.} =
            echo "Running smoke test for ", name
            let c = clientName.new(initAwsCredentialsFromEnv(), region)
            var a: JsonNode = arg
            if a.isNil: a = newJObject()
            let j = await c.procName(a)
            if key notin j:
                echo "Key ", key, ", not found in ", name, ".", astToStr(procName), " response: ", j
                inc numFailures

        allFutures.add(runTest())


smoke DynamoDB, listTables, "TableNames"
smoke Firehose, listDeliveryStreams, "DeliveryStreamNames"
smoke Logs, describeLogGroups, "logGroups"
# smoke Translate, translateText, "logGroups", %*{"SourceLanguageCode": "en", "TargetLanguageCode": "ua", "Text": "hello, world!"}
smoke DeviceFarm, listProjects, "projects", nil, "us-west-2"
smoke AppStream, describeFleets, "Fleets"

waitFor all(allFutures)
assert(numFailures == 0)
