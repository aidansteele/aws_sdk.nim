# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_uid* = "sms-2016-10-24"
const awsApiMD_apiVersion* = "2016-10-24"
const awsApiMD_endpointPrefix* = "sms"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceAbbreviation* = "SMS"
const awsApiMD_serviceFullName* = "AWS Server Migration Service"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "AWSServerMigrationService_V2016_10_24"
defineClient(SMS)
proc createReplicationJob*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateReplicationJob", "POST", "/", r)
proc deleteReplicationJob*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteReplicationJob", "POST", "/", r)
proc deleteServerCatalog*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteServerCatalog", "POST", "/", r)
proc disassociateConnector*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DisassociateConnector", "POST", "/", r)
proc getConnectors*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetConnectors", "POST", "/", r)
proc getReplicationJobs*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetReplicationJobs", "POST", "/", r)
proc getReplicationRuns*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetReplicationRuns", "POST", "/", r)
proc getServers*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetServers", "POST", "/", r)
proc importServerCatalog*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ImportServerCatalog", "POST", "/", r)
proc startOnDemandReplicationRun*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StartOnDemandReplicationRun", "POST", "/", r)
proc updateReplicationJob*(cl: SMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateReplicationJob", "POST", "/", r)
