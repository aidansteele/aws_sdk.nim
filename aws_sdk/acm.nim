# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2015-12-08"
const awsApiMD_endpointPrefix* = "acm"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceAbbreviation* = "ACM"
const awsApiMD_serviceFullName* = "AWS Certificate Manager"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "CertificateManager"
const awsApiMD_uid* = "acm-2015-12-08"
defineClient(ACM)
proc addTagsToCertificate*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AddTagsToCertificate", "POST", "/", r)
proc deleteCertificate*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteCertificate", "POST", "/", r)
proc describeCertificate*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeCertificate", "POST", "/", r)
proc getCertificate*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetCertificate", "POST", "/", r)
proc importCertificate*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ImportCertificate", "POST", "/", r)
proc listCertificates*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListCertificates", "POST", "/", r)
proc listTagsForCertificate*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListTagsForCertificate", "POST", "/", r)
proc removeTagsFromCertificate*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RemoveTagsFromCertificate", "POST", "/", r)
proc requestCertificate*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RequestCertificate", "POST", "/", r)
proc resendValidationEmail*(cl: ACM, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ResendValidationEmail", "POST", "/", r)
