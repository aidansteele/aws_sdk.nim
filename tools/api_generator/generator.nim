import json, sets, strutils, os, algorithm, tables

type Ctx = ref object
    typesDone: HashSet[string]
    typeDescs: seq[string]
    codeSection: string
    clientClassName: string
    jDesc: JsonNode
    sendProcName: string

proc newCtx(jDesc: JsonNode): Ctx =
    result.new()
    result.typeDescs = @[]
    result.codeSection = ""
    result.jDesc = jDesc
    result.typesDone = initSet[string]()

    let proto = jDesc["metadata"]["protocol"].str
    case proto
    of "json": result.sendProcName = "sendJsonRequest"
    of "ec2": result.sendProcName = "sendEC2Request"
    else:
        raise newException(Exception, "Unknown protocol " & proto)

when false:
    proc genType(c: Ctx, name: string, desc: JsonNode) =
        if name in c.typesDone: return
        c.typesDone.incl(name)

        var res = "  " & name & "* = "
        let jTyp = desc["type"].str
        case jTyp
        of "string":
            res &= "string"
        of "list":
            res &= "seq[" & desc["member"]["shape"].str & "]"
        of "map":
            res &= "Table[" & desc["key"]["shape"].str & ", " & desc["value"]["shape"].str & "]"
        else:
            discard
        res &= "\L"
        c.typeDescs.add(res)

    proc genTypes(c: Ctx) =
        let jShapes = c.jDesc["shapes"]

        for k, v in jShapes:
            c.genType(k, v)

proc decapitalize(s: string): string =
    toLowerAscii(s[0]) & s[1 .. ^1]

proc genProc(c: Ctx, name: string, desc: JsonNode) =
    let htMeth = desc["http"]["method"].str
    let uri = desc["http"]["requestUri"].str
    let p = "proc " & decapitalize(name) & "*(cl: " & c.clientClassName & ", r: JsonNode): Future[JsonNode] = " & c.sendProcName & "(cl, \"" & name & "\", \"" & htMeth & "\", \"" & uri & "\", r)\L"
    c.codeSection &= p

proc genProcs(c: Ctx) =
    let jOps = c.jDesc["operations"]
    for k, v in jOps:
        c.genProc(k, v)

proc writeToFile(c: Ctx, filename: string) =
    var o = "# This file is autogenerated, do not modify\L"
    o &= "import json, asyncfutures\L"
    o &= "import utils/client\L"
    o &= "export client.new\L"

    for k, v in c.jDesc["metadata"]:
        o &= "const awsApiMD_" & k & "* = \"" & v.str & "\"\L"

    o &= "defineClient(" & c.clientClassName & ")\L"
    if c.typeDescs.len != 0:
        o &= "type\L"
        for d in c.typeDescs:
            o &= d
            o &= "\L"
    o &= c.codeSection
    writeFile(filename, o)

when isMainModule:
    if paramCount() != 1:
        echo "Usage: ", getAppFilename().extractFilename, " <PATH_TO_AWS_GO_SDK>"
        quit 1

    proc genFile(apiJsonFile, clientClassName, outputNimFile: string) =
        let c = newCtx(parseFile(apiJsonFile))
        c.clientClassName = clientClassName
        # c.genTypes()
        c.genProcs()
        c.writeToFile(outputNimFile)

    let goSDKRoot = paramStr(1)

    let apis = goSDKRoot / "models/apis"

    iterator allAWSApis(): string =
        for p in walkDir(apis, relative = true):
            yield p.path

    proc jsonFileForApi(apiName: string): string =
        var fs = newSeq[string]()
        let awsPath = apis / apiName
        for ff in walkDir(awsPath, relative = true):
            fs.add(ff.path)
        fs.sort(`cmp`)
        let latestApiDir = awsPath / fs[^1]
        result = latestApiDir / "api-2.json"

    proc genApi(awsName, clientClassName: string) =
        let jsonFile = jsonFileForApi(awsName)
        let nimFile = clientClassName.toLowerAscii() & ".nim"
        let outputNimFile = getAppDir() / "../../aws_sdk" / nimFile
        echo "Generating ", nimFile
        genFile(jsonFile, clientClassName, outputNimFile)

    let apisToGenerate = {
        "dynamodb": "DynamoDB",
        "firehose": "Firehose",
        "codebuild": "CodeBuild",
        "kinesis": "Kinesis",
        "organizations": "Organizations",
        "athena": "Athena",
        "shield": "Shield",
        "cloudhsm": "CloudHSM",
        "translate": "Translate",
        "health": "Health",
        "appstream": "AppStream",
        "codecommit": "CodeCommit",
        "gamelift": "GameLift",
        "budgets": "Budgets",
        "directconnect": "DirectConnect",
        "codestar": "CodeStar",
        "workspaces": "WorkSpaces",
        "machinelearning": "MachineLearning",
        "storagegateway": "StorageGateway",
        "codepipeline": "CodePipeline",
        "Cloud9": "Cloud9",
        "opsworks": "OpsWorks",
        "SageMaker": "SageMaker",
        "devicefarm": "DeviceFarm",
        "cloudhsmv2": "CloudHSM",
        "glue": "Glue",
        "datapipeline": "DataPipeline",
        "codedeploy": "CodeDeploy",
        "cloudtrail": "CloudTrail",
        "logs": "Logs",
        "ecs": "ECS",
        "ecr": "ECR",
        "waf": "WAF",
        "dax": "DAX",
        "comprehend": "Comprehend",
        "rekognition": "Rekognition",
        "swf": "SWF",
        "lightsail": "Lightsail",
        "ssm": "SSM",
        "kinesisanalytics": "KinesisAnalytics",
        "dms": "DMS",
        "events": "Events",
        "acm": "ACM",
        "cognito-identity": "CognitoIdentity",
        "discovery": "Discovery",
        "route53domains": "Route53Domains",
        "kms": "KMS",
        "sms": "SMS",
        "mediastore": "MediaStore",
        "inspector": "Inspector",
        "ds": "DS",
        "servicecatalog": "ServiceCatalog",
        "cognito-idp": "CognitoIDP"
    }

    for a in apisToGenerate:
        genApi a[0], a[1]

    when false:
        let apisToGenerateTable = apisToGenerate.toTable()
        for a in allAWSApis():
            if a notin apisToGenerateTable:
                try:
                    let j = parseFile(jsonFileForApi(a))
                    if j["metadata"]["protocol"].str == "json" and j["metadata"]["signatureVersion"].str == "v4":
                        echo a, "|", j["metadata"]["serviceFullName"].str
                except:
                    echo "Error processing ", jsonFileForApi(a)
                    echo getCurrentException().msg
