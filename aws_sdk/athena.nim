# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2017-05-18"
const awsApiMD_endpointPrefix* = "athena"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceFullName* = "Amazon Athena"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "AmazonAthena"
const awsApiMD_uid* = "athena-2017-05-18"
defineClient(Athena)
proc batchGetNamedQuery*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "BatchGetNamedQuery", "POST", "/", r)
proc batchGetQueryExecution*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "BatchGetQueryExecution", "POST", "/", r)
proc createNamedQuery*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateNamedQuery", "POST", "/", r)
proc deleteNamedQuery*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteNamedQuery", "POST", "/", r)
proc getNamedQuery*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetNamedQuery", "POST", "/", r)
proc getQueryExecution*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetQueryExecution", "POST", "/", r)
proc getQueryResults*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetQueryResults", "POST", "/", r)
proc listNamedQueries*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListNamedQueries", "POST", "/", r)
proc listQueryExecutions*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListQueryExecutions", "POST", "/", r)
proc startQueryExecution*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StartQueryExecution", "POST", "/", r)
proc stopQueryExecution*(cl: Athena, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StopQueryExecution", "POST", "/", r)
