import packedjson, asyncfutures,asyncdispatch
import utils/client
import credentials

export client.new

const awsApiMD_apiVersion* = "2017-10-25"
const awsApiMD_endpointPrefix* = "ce"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceFullName* = "AWS Cost And Usage Service"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "AWSInsightsIndexService"
const awsApiMD_uid* = "ce-2017-10-25"
defineClient(CostExplorer)
proc getCostAndUsage*(cl: CostExplorer, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetCostAndUsage", "POST", "/", r)

