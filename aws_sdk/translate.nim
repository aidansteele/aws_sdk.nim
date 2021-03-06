# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2017-07-01"
const awsApiMD_endpointPrefix* = "translate"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceFullName* = "Amazon Translate"
const awsApiMD_serviceId* = "Translate"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_signingName* = "translate"
const awsApiMD_targetPrefix* = "AWSShineFrontendService_20170701"
const awsApiMD_uid* = "translate-2017-07-01"
defineClient(Translate)
proc translateText*(cl: Translate, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "TranslateText", "POST", "/", r)
