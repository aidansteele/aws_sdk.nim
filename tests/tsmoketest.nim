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

smoke ACM, listCertificates, "CertificateSummaryList"
smoke AppStream, describeFleets, "Fleets"
smoke Athena, listNamedQueries, "NamedQueryIds"
# smoke Cloud9, listEnvironments, "blabla"
smoke CloudHSM, describeClusters, "Clusters"
smoke CloudTrail, describeTrails, "trailList"
smoke CodeBuild, listProjects, "projects"
smoke CodeCommit, listRepositories, "repositories"
smoke CodeDeploy, listApplications, "applications"
smoke CodePipeline, listPipelines, "pipelines"
smoke CodeStar, listProjects, "projects"
smoke CognitoIdentity, listIdentityPools, "IdentityPools", %*{"MaxResults": 33}
smoke CognitoIDP, listUserPools, "UserPools", %*{"MaxResults": 33}
# smoke Comprehend, listTopicsDetectionJobs, "blabla"
smoke DataPipeline, listPipelines, "pipelineIdList"
# smoke DAX, listTags, "blabla"
smoke DeviceFarm, listProjects, "projects", nil, "us-west-2"
smoke DirectConnect, describeVirtualGateways, "virtualGateways"
# smoke Discovery, describeTags, "Tags", nil, "us-west-2"
smoke DMS, describeEndpoints, "Endpoints"
smoke DS, describeDirectories, "DirectoryDescriptions"
smoke DynamoDB, listTables, "TableNames"
smoke ECR, describeRepositories, "repositories"
smoke ECS, listClusters, "clusterArns"
smoke Events, listRules, "Rules"
smoke Firehose, listDeliveryStreams, "DeliveryStreamNames"
smoke GameLift, describeFleetAttributes, "FleetAttributes"
# smoke Glue, getJobs, "blabla"
# smoke Health, describeEvents, "blabla"
smoke Inspector, listAssessmentTemplates, "assessmentTemplateArns"
smoke Kinesis, listStreams, "StreamNames"
smoke KinesisAnalytics, listApplications, "ApplicationSummaries"
smoke KMS, listKeys, "Keys"
smoke LightSail, getBlueprints, "blueprints"
smoke Logs, describeLogGroups, "logGroups"
smoke MachineLearning, describeDataSources, "Results"
# smoke MediaStore, listContainers, "blabla"
smoke OpsWorks, describeStacks, "Stacks"
# smoke Organizations, listRoots, "blabla"
smoke Rekognition, listCollections, "CollectionIds"
smoke Route53Domains, listDomains, "Domains"
# smoke SageMaker, listModels, "blabla"
smoke ServiceCatalog, listPortfolios, "PortfolioDetails"
# smoke Shield, listProtections, "blabla"
# smoke SMS, getServers, "blabla"
smoke SSM, listDocuments, "DocumentIdentifiers"
smoke StorageGateway, describeTapeArchives, "TapeArchives"
# smoke SWF, listWorkflowTypes, "blabla"
# smoke Translate, translateText, "logGroups", %*{"SourceLanguageCode": "en", "TargetLanguageCode": "ua", "Text": "hello, world!"}
# smoke WAF, listIPSets, "blabla"
smoke WorkSpaces, describeWorkspaces, "Workspaces"

waitFor all(allFutures)
assert(numFailures == 0)
