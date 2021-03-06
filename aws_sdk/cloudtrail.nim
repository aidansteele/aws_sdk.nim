# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2013-11-01"
const awsApiMD_endpointPrefix* = "cloudtrail"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceAbbreviation* = "CloudTrail"
const awsApiMD_serviceFullName* = "AWS CloudTrail"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101"
const awsApiMD_uid* = "cloudtrail-2013-11-01"
defineClient(CloudTrail)
proc addTags*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AddTags", "POST", "/", r)
proc createTrail*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateTrail", "POST", "/", r)
proc deleteTrail*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteTrail", "POST", "/", r)
proc describeTrails*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeTrails", "POST", "/", r)
proc getEventSelectors*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetEventSelectors", "POST", "/", r)
proc getTrailStatus*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetTrailStatus", "POST", "/", r)
proc listPublicKeys*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListPublicKeys", "POST", "/", r)
proc listTags*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListTags", "POST", "/", r)
proc lookupEvents*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "LookupEvents", "POST", "/", r)
proc putEventSelectors*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PutEventSelectors", "POST", "/", r)
proc removeTags*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RemoveTags", "POST", "/", r)
proc startLogging*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StartLogging", "POST", "/", r)
proc stopLogging*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StopLogging", "POST", "/", r)
proc updateTrail*(cl: CloudTrail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateTrail", "POST", "/", r)
