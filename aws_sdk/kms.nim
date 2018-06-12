# This file is autogenerated, do not modify
import packedjson, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2014-11-01"
const awsApiMD_endpointPrefix* = "kms"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceAbbreviation* = "KMS"
const awsApiMD_serviceFullName* = "AWS Key Management Service"
const awsApiMD_serviceId* = "KMS"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "TrentService"
const awsApiMD_uid* = "kms-2014-11-01"
defineClient(KMS)
proc cancelKeyDeletion*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CancelKeyDeletion", "POST", "/", r)
proc createAlias*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateAlias", "POST", "/", r)
proc createGrant*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateGrant", "POST", "/", r)
proc createKey*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateKey", "POST", "/", r)
proc decrypt*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "Decrypt", "POST", "/", r)
proc deleteAlias*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteAlias", "POST", "/", r)
proc deleteImportedKeyMaterial*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteImportedKeyMaterial", "POST", "/", r)
proc describeKey*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeKey", "POST", "/", r)
proc disableKey*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DisableKey", "POST", "/", r)
proc disableKeyRotation*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DisableKeyRotation", "POST", "/", r)
proc enableKey*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "EnableKey", "POST", "/", r)
proc enableKeyRotation*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "EnableKeyRotation", "POST", "/", r)
proc encrypt*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "Encrypt", "POST", "/", r)
proc generateDataKey*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GenerateDataKey", "POST", "/", r)
proc generateDataKeyWithoutPlaintext*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GenerateDataKeyWithoutPlaintext", "POST", "/", r)
proc generateRandom*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GenerateRandom", "POST", "/", r)
proc getKeyPolicy*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetKeyPolicy", "POST", "/", r)
proc getKeyRotationStatus*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetKeyRotationStatus", "POST", "/", r)
proc getParametersForImport*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetParametersForImport", "POST", "/", r)
proc importKeyMaterial*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ImportKeyMaterial", "POST", "/", r)
proc listAliases*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAliases", "POST", "/", r)
proc listGrants*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListGrants", "POST", "/", r)
proc listKeyPolicies*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListKeyPolicies", "POST", "/", r)
proc listKeys*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListKeys", "POST", "/", r)
proc listResourceTags*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListResourceTags", "POST", "/", r)
proc listRetirableGrants*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListRetirableGrants", "POST", "/", r)
proc putKeyPolicy*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PutKeyPolicy", "POST", "/", r)
proc reEncrypt*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ReEncrypt", "POST", "/", r)
proc retireGrant*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RetireGrant", "POST", "/", r)
proc revokeGrant*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RevokeGrant", "POST", "/", r)
proc scheduleKeyDeletion*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ScheduleKeyDeletion", "POST", "/", r)
proc tagResource*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "TagResource", "POST", "/", r)
proc untagResource*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UntagResource", "POST", "/", r)
proc updateAlias*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateAlias", "POST", "/", r)
proc updateKeyDescription*(cl: KMS, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateKeyDescription", "POST", "/", r)
