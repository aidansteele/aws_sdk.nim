# This file is autogenerated, do not modify
import packedjson, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2015-09-21"
const awsApiMD_endpointPrefix* = "ecr"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceAbbreviation* = "Amazon ECR"
const awsApiMD_serviceFullName* = "Amazon EC2 Container Registry"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "AmazonEC2ContainerRegistry_V20150921"
const awsApiMD_uid* = "ecr-2015-09-21"
defineClient(ECR)
proc batchCheckLayerAvailability*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "BatchCheckLayerAvailability", "POST", "/", r)
proc batchDeleteImage*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "BatchDeleteImage", "POST", "/", r)
proc batchGetImage*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "BatchGetImage", "POST", "/", r)
proc completeLayerUpload*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CompleteLayerUpload", "POST", "/", r)
proc createRepository*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateRepository", "POST", "/", r)
proc deleteLifecyclePolicy*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteLifecyclePolicy", "POST", "/", r)
proc deleteRepository*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteRepository", "POST", "/", r)
proc deleteRepositoryPolicy*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteRepositoryPolicy", "POST", "/", r)
proc describeImages*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeImages", "POST", "/", r)
proc describeRepositories*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeRepositories", "POST", "/", r)
proc getAuthorizationToken*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetAuthorizationToken", "POST", "/", r)
proc getDownloadUrlForLayer*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetDownloadUrlForLayer", "POST", "/", r)
proc getLifecyclePolicy*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetLifecyclePolicy", "POST", "/", r)
proc getLifecyclePolicyPreview*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetLifecyclePolicyPreview", "POST", "/", r)
proc getRepositoryPolicy*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "GetRepositoryPolicy", "POST", "/", r)
proc initiateLayerUpload*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "InitiateLayerUpload", "POST", "/", r)
proc listImages*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListImages", "POST", "/", r)
proc putImage*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PutImage", "POST", "/", r)
proc putLifecyclePolicy*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "PutLifecyclePolicy", "POST", "/", r)
proc setRepositoryPolicy*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "SetRepositoryPolicy", "POST", "/", r)
proc startLifecyclePolicyPreview*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "StartLifecyclePolicyPreview", "POST", "/", r)
proc uploadLayerPart*(cl: ECR, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UploadLayerPart", "POST", "/", r)
