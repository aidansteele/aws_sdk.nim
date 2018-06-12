# This file is autogenerated, do not modify
import packedjson, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2016-02-16"
const awsApiMD_endpointPrefix* = "inspector"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceFullName* = "Amazon Inspector"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "InspectorService"
const awsApiMD_uid* = "inspector-2016-02-16"
defineClient(Inspector)
proc addAttributesToFindings*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AddAttributesToFindings", "POST", "/", r)
proc createAssessmentTarget*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateAssessmentTarget", "POST", "/", r)
proc createAssessmentTemplate*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateAssessmentTemplate", "POST", "/", r)
proc createResourceGroup*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateResourceGroup", "POST", "/", r)
proc deleteAssessmentRun*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteAssessmentRun", "POST", "/", r)
proc deleteAssessmentTarget*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteAssessmentTarget", "POST", "/", r)
proc deleteAssessmentTemplate*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteAssessmentTemplate", "POST", "/", r)
proc describeAssessmentRuns*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeAssessmentRuns", "POST", "/", r)
proc describeAssessmentTargets*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeAssessmentTargets", "POST", "/", r)
proc describeAssessmentTemplates*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeAssessmentTemplates", "POST", "/", r)
proc describeCrossAccountAccessRole*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeCrossAccountAccessRole", "POST", "/", r)
proc describeFindings*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeFindings", "POST", "/", r)
proc describeResourceGroups*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeResourceGroups", "POST", "/", r)
proc describeRulesPackages*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeRulesPackages", "POST", "/", r)
proc getAssessmentReport*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetAssessmentReport", "POST", "/", r)
proc getTelemetryMetadata*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetTelemetryMetadata", "POST", "/", r)
proc listAssessmentRunAgents*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAssessmentRunAgents", "POST", "/", r)
proc listAssessmentRuns*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAssessmentRuns", "POST", "/", r)
proc listAssessmentTargets*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAssessmentTargets", "POST", "/", r)
proc listAssessmentTemplates*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAssessmentTemplates", "POST", "/", r)
proc listEventSubscriptions*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListEventSubscriptions", "POST", "/", r)
proc listFindings*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListFindings", "POST", "/", r)
proc listRulesPackages*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListRulesPackages", "POST", "/", r)
proc listTagsForResource*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListTagsForResource", "POST", "/", r)
proc previewAgents*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PreviewAgents", "POST", "/", r)
proc registerCrossAccountAccessRole*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RegisterCrossAccountAccessRole", "POST", "/", r)
proc removeAttributesFromFindings*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RemoveAttributesFromFindings", "POST", "/", r)
proc setTagsForResource*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "SetTagsForResource", "POST", "/", r)
proc startAssessmentRun*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StartAssessmentRun", "POST", "/", r)
proc stopAssessmentRun*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StopAssessmentRun", "POST", "/", r)
proc subscribeToEvent*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "SubscribeToEvent", "POST", "/", r)
proc unsubscribeFromEvent*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UnsubscribeFromEvent", "POST", "/", r)
proc updateAssessmentTarget*(cl: Inspector, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateAssessmentTarget", "POST", "/", r)
