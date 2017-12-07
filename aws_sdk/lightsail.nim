# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2016-11-28"
const awsApiMD_endpointPrefix* = "lightsail"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceFullName* = "Amazon Lightsail"
const awsApiMD_serviceId* = "Lightsail"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "Lightsail_20161128"
const awsApiMD_uid* = "lightsail-2016-11-28"
defineClient(Lightsail)
proc allocateStaticIp*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AllocateStaticIp", "POST", "/", r)
proc attachDisk*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AttachDisk", "POST", "/", r)
proc attachInstancesToLoadBalancer*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AttachInstancesToLoadBalancer", "POST", "/", r)
proc attachLoadBalancerTlsCertificate*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AttachLoadBalancerTlsCertificate", "POST", "/", r)
proc attachStaticIp*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AttachStaticIp", "POST", "/", r)
proc closeInstancePublicPorts*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CloseInstancePublicPorts", "POST", "/", r)
proc createDisk*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateDisk", "POST", "/", r)
proc createDiskFromSnapshot*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateDiskFromSnapshot", "POST", "/", r)
proc createDiskSnapshot*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateDiskSnapshot", "POST", "/", r)
proc createDomain*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateDomain", "POST", "/", r)
proc createDomainEntry*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateDomainEntry", "POST", "/", r)
proc createInstanceSnapshot*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateInstanceSnapshot", "POST", "/", r)
proc createInstances*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateInstances", "POST", "/", r)
proc createInstancesFromSnapshot*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateInstancesFromSnapshot", "POST", "/", r)
proc createKeyPair*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateKeyPair", "POST", "/", r)
proc createLoadBalancer*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateLoadBalancer", "POST", "/", r)
proc createLoadBalancerTlsCertificate*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateLoadBalancerTlsCertificate", "POST", "/", r)
proc deleteDisk*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteDisk", "POST", "/", r)
proc deleteDiskSnapshot*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteDiskSnapshot", "POST", "/", r)
proc deleteDomain*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteDomain", "POST", "/", r)
proc deleteDomainEntry*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteDomainEntry", "POST", "/", r)
proc deleteInstance*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteInstance", "POST", "/", r)
proc deleteInstanceSnapshot*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteInstanceSnapshot", "POST", "/", r)
proc deleteKeyPair*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteKeyPair", "POST", "/", r)
proc deleteLoadBalancer*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteLoadBalancer", "POST", "/", r)
proc deleteLoadBalancerTlsCertificate*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteLoadBalancerTlsCertificate", "POST", "/", r)
proc detachDisk*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DetachDisk", "POST", "/", r)
proc detachInstancesFromLoadBalancer*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DetachInstancesFromLoadBalancer", "POST", "/", r)
proc detachStaticIp*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DetachStaticIp", "POST", "/", r)
proc downloadDefaultKeyPair*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DownloadDefaultKeyPair", "POST", "/", r)
proc getActiveNames*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetActiveNames", "POST", "/", r)
proc getBlueprints*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetBlueprints", "POST", "/", r)
proc getBundles*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetBundles", "POST", "/", r)
proc getDisk*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDisk", "POST", "/", r)
proc getDiskSnapshot*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDiskSnapshot", "POST", "/", r)
proc getDiskSnapshots*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDiskSnapshots", "POST", "/", r)
proc getDisks*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDisks", "POST", "/", r)
proc getDomain*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDomain", "POST", "/", r)
proc getDomains*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDomains", "POST", "/", r)
proc getInstance*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetInstance", "POST", "/", r)
proc getInstanceAccessDetails*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetInstanceAccessDetails", "POST", "/", r)
proc getInstanceMetricData*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetInstanceMetricData", "POST", "/", r)
proc getInstancePortStates*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetInstancePortStates", "POST", "/", r)
proc getInstanceSnapshot*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetInstanceSnapshot", "POST", "/", r)
proc getInstanceSnapshots*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetInstanceSnapshots", "POST", "/", r)
proc getInstanceState*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetInstanceState", "POST", "/", r)
proc getInstances*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetInstances", "POST", "/", r)
proc getKeyPair*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetKeyPair", "POST", "/", r)
proc getKeyPairs*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetKeyPairs", "POST", "/", r)
proc getLoadBalancer*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetLoadBalancer", "POST", "/", r)
proc getLoadBalancerMetricData*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetLoadBalancerMetricData", "POST", "/", r)
proc getLoadBalancerTlsCertificates*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetLoadBalancerTlsCertificates", "POST", "/", r)
proc getLoadBalancers*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetLoadBalancers", "POST", "/", r)
proc getOperation*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetOperation", "POST", "/", r)
proc getOperations*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetOperations", "POST", "/", r)
proc getOperationsForResource*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetOperationsForResource", "POST", "/", r)
proc getRegions*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetRegions", "POST", "/", r)
proc getStaticIp*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetStaticIp", "POST", "/", r)
proc getStaticIps*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetStaticIps", "POST", "/", r)
proc importKeyPair*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ImportKeyPair", "POST", "/", r)
proc isVpcPeered*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "IsVpcPeered", "POST", "/", r)
proc openInstancePublicPorts*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "OpenInstancePublicPorts", "POST", "/", r)
proc peerVpc*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PeerVpc", "POST", "/", r)
proc putInstancePublicPorts*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PutInstancePublicPorts", "POST", "/", r)
proc rebootInstance*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RebootInstance", "POST", "/", r)
proc releaseStaticIp*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ReleaseStaticIp", "POST", "/", r)
proc startInstance*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StartInstance", "POST", "/", r)
proc stopInstance*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StopInstance", "POST", "/", r)
proc unpeerVpc*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UnpeerVpc", "POST", "/", r)
proc updateDomainEntry*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateDomainEntry", "POST", "/", r)
proc updateLoadBalancerAttribute*(cl: Lightsail, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateLoadBalancerAttribute", "POST", "/", r)
