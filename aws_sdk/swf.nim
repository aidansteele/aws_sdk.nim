# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2012-01-25"
const awsApiMD_endpointPrefix* = "swf"
const awsApiMD_jsonVersion* = "1.0"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceAbbreviation* = "Amazon SWF"
const awsApiMD_serviceFullName* = "Amazon Simple Workflow Service"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "SimpleWorkflowService"
const awsApiMD_timestampFormat* = "unixTimestamp"
const awsApiMD_uid* = "swf-2012-01-25"
defineClient(SWF)
proc countClosedWorkflowExecutions*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CountClosedWorkflowExecutions", "POST", "/", r)
proc countOpenWorkflowExecutions*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CountOpenWorkflowExecutions", "POST", "/", r)
proc countPendingActivityTasks*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CountPendingActivityTasks", "POST", "/", r)
proc countPendingDecisionTasks*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CountPendingDecisionTasks", "POST", "/", r)
proc deprecateActivityType*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeprecateActivityType", "POST", "/", r)
proc deprecateDomain*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeprecateDomain", "POST", "/", r)
proc deprecateWorkflowType*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeprecateWorkflowType", "POST", "/", r)
proc describeActivityType*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeActivityType", "POST", "/", r)
proc describeDomain*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeDomain", "POST", "/", r)
proc describeWorkflowExecution*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeWorkflowExecution", "POST", "/", r)
proc describeWorkflowType*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeWorkflowType", "POST", "/", r)
proc getWorkflowExecutionHistory*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetWorkflowExecutionHistory", "POST", "/", r)
proc listActivityTypes*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListActivityTypes", "POST", "/", r)
proc listClosedWorkflowExecutions*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListClosedWorkflowExecutions", "POST", "/", r)
proc listDomains*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListDomains", "POST", "/", r)
proc listOpenWorkflowExecutions*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListOpenWorkflowExecutions", "POST", "/", r)
proc listWorkflowTypes*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListWorkflowTypes", "POST", "/", r)
proc pollForActivityTask*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PollForActivityTask", "POST", "/", r)
proc pollForDecisionTask*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PollForDecisionTask", "POST", "/", r)
proc recordActivityTaskHeartbeat*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RecordActivityTaskHeartbeat", "POST", "/", r)
proc registerActivityType*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RegisterActivityType", "POST", "/", r)
proc registerDomain*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RegisterDomain", "POST", "/", r)
proc registerWorkflowType*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RegisterWorkflowType", "POST", "/", r)
proc requestCancelWorkflowExecution*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RequestCancelWorkflowExecution", "POST", "/", r)
proc respondActivityTaskCanceled*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RespondActivityTaskCanceled", "POST", "/", r)
proc respondActivityTaskCompleted*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RespondActivityTaskCompleted", "POST", "/", r)
proc respondActivityTaskFailed*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RespondActivityTaskFailed", "POST", "/", r)
proc respondDecisionTaskCompleted*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RespondDecisionTaskCompleted", "POST", "/", r)
proc signalWorkflowExecution*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "SignalWorkflowExecution", "POST", "/", r)
proc startWorkflowExecution*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StartWorkflowExecution", "POST", "/", r)
proc terminateWorkflowExecution*(cl: SWF, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "TerminateWorkflowExecution", "POST", "/", r)
