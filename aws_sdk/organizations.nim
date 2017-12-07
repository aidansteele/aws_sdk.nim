# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2016-11-28"
const awsApiMD_endpointPrefix* = "organizations"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceAbbreviation* = "Organizations"
const awsApiMD_serviceFullName* = "AWS Organizations"
const awsApiMD_serviceId* = "Organizations"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "AWSOrganizationsV20161128"
const awsApiMD_timestampFormat* = "unixTimestamp"
const awsApiMD_uid* = "organizations-2016-11-28"
defineClient(Organizations)
proc acceptHandshake*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AcceptHandshake", "POST", "/", r)
proc attachPolicy*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AttachPolicy", "POST", "/", r)
proc cancelHandshake*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CancelHandshake", "POST", "/", r)
proc createAccount*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateAccount", "POST", "/", r)
proc createOrganization*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateOrganization", "POST", "/", r)
proc createOrganizationalUnit*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateOrganizationalUnit", "POST", "/", r)
proc createPolicy*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreatePolicy", "POST", "/", r)
proc declineHandshake*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeclineHandshake", "POST", "/", r)
proc deleteOrganization*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteOrganization", "POST", "/", r)
proc deleteOrganizationalUnit*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteOrganizationalUnit", "POST", "/", r)
proc deletePolicy*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeletePolicy", "POST", "/", r)
proc describeAccount*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeAccount", "POST", "/", r)
proc describeCreateAccountStatus*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeCreateAccountStatus", "POST", "/", r)
proc describeHandshake*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeHandshake", "POST", "/", r)
proc describeOrganization*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeOrganization", "POST", "/", r)
proc describeOrganizationalUnit*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeOrganizationalUnit", "POST", "/", r)
proc describePolicy*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribePolicy", "POST", "/", r)
proc detachPolicy*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DetachPolicy", "POST", "/", r)
proc disableAWSServiceAccess*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DisableAWSServiceAccess", "POST", "/", r)
proc disablePolicyType*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DisablePolicyType", "POST", "/", r)
proc enableAWSServiceAccess*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "EnableAWSServiceAccess", "POST", "/", r)
proc enableAllFeatures*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "EnableAllFeatures", "POST", "/", r)
proc enablePolicyType*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "EnablePolicyType", "POST", "/", r)
proc inviteAccountToOrganization*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "InviteAccountToOrganization", "POST", "/", r)
proc leaveOrganization*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "LeaveOrganization", "POST", "/", r)
proc listAWSServiceAccessForOrganization*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAWSServiceAccessForOrganization", "POST", "/", r)
proc listAccounts*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAccounts", "POST", "/", r)
proc listAccountsForParent*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAccountsForParent", "POST", "/", r)
proc listChildren*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListChildren", "POST", "/", r)
proc listCreateAccountStatus*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListCreateAccountStatus", "POST", "/", r)
proc listHandshakesForAccount*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListHandshakesForAccount", "POST", "/", r)
proc listHandshakesForOrganization*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListHandshakesForOrganization", "POST", "/", r)
proc listOrganizationalUnitsForParent*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListOrganizationalUnitsForParent", "POST", "/", r)
proc listParents*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListParents", "POST", "/", r)
proc listPolicies*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListPolicies", "POST", "/", r)
proc listPoliciesForTarget*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListPoliciesForTarget", "POST", "/", r)
proc listRoots*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListRoots", "POST", "/", r)
proc listTargetsForPolicy*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListTargetsForPolicy", "POST", "/", r)
proc moveAccount*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "MoveAccount", "POST", "/", r)
proc removeAccountFromOrganization*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RemoveAccountFromOrganization", "POST", "/", r)
proc updateOrganizationalUnit*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateOrganizationalUnit", "POST", "/", r)
proc updatePolicy*(cl: Organizations, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdatePolicy", "POST", "/", r)