# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2015-06-23"
const awsApiMD_endpointPrefix* = "devicefarm"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceFullName* = "AWS Device Farm"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "DeviceFarm_20150623"
const awsApiMD_uid* = "devicefarm-2015-06-23"
defineClient(DeviceFarm)
proc createDevicePool*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateDevicePool", "POST", "/", r)
proc createNetworkProfile*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateNetworkProfile", "POST", "/", r)
proc createProject*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateProject", "POST", "/", r)
proc createRemoteAccessSession*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateRemoteAccessSession", "POST", "/", r)
proc createUpload*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateUpload", "POST", "/", r)
proc deleteDevicePool*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteDevicePool", "POST", "/", r)
proc deleteNetworkProfile*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteNetworkProfile", "POST", "/", r)
proc deleteProject*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteProject", "POST", "/", r)
proc deleteRemoteAccessSession*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteRemoteAccessSession", "POST", "/", r)
proc deleteRun*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteRun", "POST", "/", r)
proc deleteUpload*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteUpload", "POST", "/", r)
proc getAccountSettings*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetAccountSettings", "POST", "/", r)
proc getDevice*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDevice", "POST", "/", r)
proc getDevicePool*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDevicePool", "POST", "/", r)
proc getDevicePoolCompatibility*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDevicePoolCompatibility", "POST", "/", r)
proc getJob*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetJob", "POST", "/", r)
proc getNetworkProfile*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetNetworkProfile", "POST", "/", r)
proc getOfferingStatus*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetOfferingStatus", "POST", "/", r)
proc getProject*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetProject", "POST", "/", r)
proc getRemoteAccessSession*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetRemoteAccessSession", "POST", "/", r)
proc getRun*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetRun", "POST", "/", r)
proc getSuite*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetSuite", "POST", "/", r)
proc getTest*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetTest", "POST", "/", r)
proc getUpload*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetUpload", "POST", "/", r)
proc installToRemoteAccessSession*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "InstallToRemoteAccessSession", "POST", "/", r)
proc listArtifacts*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListArtifacts", "POST", "/", r)
proc listDevicePools*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListDevicePools", "POST", "/", r)
proc listDevices*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListDevices", "POST", "/", r)
proc listJobs*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListJobs", "POST", "/", r)
proc listNetworkProfiles*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListNetworkProfiles", "POST", "/", r)
proc listOfferingPromotions*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListOfferingPromotions", "POST", "/", r)
proc listOfferingTransactions*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListOfferingTransactions", "POST", "/", r)
proc listOfferings*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListOfferings", "POST", "/", r)
proc listProjects*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListProjects", "POST", "/", r)
proc listRemoteAccessSessions*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListRemoteAccessSessions", "POST", "/", r)
proc listRuns*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListRuns", "POST", "/", r)
proc listSamples*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListSamples", "POST", "/", r)
proc listSuites*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListSuites", "POST", "/", r)
proc listTests*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListTests", "POST", "/", r)
proc listUniqueProblems*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListUniqueProblems", "POST", "/", r)
proc listUploads*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListUploads", "POST", "/", r)
proc purchaseOffering*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PurchaseOffering", "POST", "/", r)
proc renewOffering*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RenewOffering", "POST", "/", r)
proc scheduleRun*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ScheduleRun", "POST", "/", r)
proc stopRemoteAccessSession*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StopRemoteAccessSession", "POST", "/", r)
proc stopRun*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StopRun", "POST", "/", r)
proc updateDevicePool*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateDevicePool", "POST", "/", r)
proc updateNetworkProfile*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateNetworkProfile", "POST", "/", r)
proc updateProject*(cl: DeviceFarm, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateProject", "POST", "/", r)