import packedjson, asyncfutures,asyncdispatch
import utils/client
import credentials

export client.new

const awsApiMD_apiVersion* = "2017-10-15"
const awsApiMD_endpointPrefix* = "pricing"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceFullName* = "AWS PriceList Service"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "AWSPriceListService"
const awsApiMD_uid* = "pricing-2017-10-15"
defineClient(Pricing)
proc getProducts*(cl: Pricing, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetProducts", "POST", "/", r)


