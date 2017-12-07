# This file is autogenerated, do not modify
import json, asyncfutures
import utils/client
export client.new
const awsApiMD_apiVersion* = "2015-12-10"
const awsApiMD_endpointPrefix* = "servicecatalog"
const awsApiMD_jsonVersion* = "1.1"
const awsApiMD_protocol* = "json"
const awsApiMD_serviceFullName* = "AWS Service Catalog"
const awsApiMD_signatureVersion* = "v4"
const awsApiMD_targetPrefix* = "AWS242ServiceCatalogService"
const awsApiMD_uid* = "servicecatalog-2015-12-10"
defineClient(ServiceCatalog)
proc acceptPortfolioShare*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AcceptPortfolioShare", "POST", "/", r)
proc associatePrincipalWithPortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AssociatePrincipalWithPortfolio", "POST", "/", r)
proc associateProductWithPortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AssociateProductWithPortfolio", "POST", "/", r)
proc associateTagOptionWithResource*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "AssociateTagOptionWithResource", "POST", "/", r)
proc copyProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CopyProduct", "POST", "/", r)
proc createConstraint*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateConstraint", "POST", "/", r)
proc createPortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreatePortfolio", "POST", "/", r)
proc createPortfolioShare*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreatePortfolioShare", "POST", "/", r)
proc createProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateProduct", "POST", "/", r)
proc createProvisioningArtifact*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateProvisioningArtifact", "POST", "/", r)
proc createTagOption*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "CreateTagOption", "POST", "/", r)
proc deleteConstraint*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteConstraint", "POST", "/", r)
proc deletePortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeletePortfolio", "POST", "/", r)
proc deletePortfolioShare*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeletePortfolioShare", "POST", "/", r)
proc deleteProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteProduct", "POST", "/", r)
proc deleteProvisioningArtifact*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DeleteProvisioningArtifact", "POST", "/", r)
proc describeConstraint*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeConstraint", "POST", "/", r)
proc describeCopyProductStatus*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeCopyProductStatus", "POST", "/", r)
proc describePortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribePortfolio", "POST", "/", r)
proc describeProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeProduct", "POST", "/", r)
proc describeProductAsAdmin*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeProductAsAdmin", "POST", "/", r)
proc describeProductView*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeProductView", "POST", "/", r)
proc describeProvisionedProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeProvisionedProduct", "POST", "/", r)
proc describeProvisioningArtifact*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeProvisioningArtifact", "POST", "/", r)
proc describeProvisioningParameters*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeProvisioningParameters", "POST", "/", r)
proc describeRecord*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeRecord", "POST", "/", r)
proc describeTagOption*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DescribeTagOption", "POST", "/", r)
proc disassociatePrincipalFromPortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DisassociatePrincipalFromPortfolio", "POST", "/", r)
proc disassociateProductFromPortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DisassociateProductFromPortfolio", "POST", "/", r)
proc disassociateTagOptionFromResource*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "DisassociateTagOptionFromResource", "POST", "/", r)
proc listAcceptedPortfolioShares*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListAcceptedPortfolioShares", "POST", "/", r)
proc listConstraintsForPortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListConstraintsForPortfolio", "POST", "/", r)
proc listLaunchPaths*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListLaunchPaths", "POST", "/", r)
proc listPortfolioAccess*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListPortfolioAccess", "POST", "/", r)
proc listPortfolios*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListPortfolios", "POST", "/", r)
proc listPortfoliosForProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListPortfoliosForProduct", "POST", "/", r)
proc listPrincipalsForPortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListPrincipalsForPortfolio", "POST", "/", r)
proc listProvisioningArtifacts*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListProvisioningArtifacts", "POST", "/", r)
proc listRecordHistory*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListRecordHistory", "POST", "/", r)
proc listResourcesForTagOption*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListResourcesForTagOption", "POST", "/", r)
proc listTagOptions*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ListTagOptions", "POST", "/", r)
proc provisionProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ProvisionProduct", "POST", "/", r)
proc rejectPortfolioShare*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "RejectPortfolioShare", "POST", "/", r)
proc scanProvisionedProducts*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "ScanProvisionedProducts", "POST", "/", r)
proc searchProducts*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "SearchProducts", "POST", "/", r)
proc searchProductsAsAdmin*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "SearchProductsAsAdmin", "POST", "/", r)
proc terminateProvisionedProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "TerminateProvisionedProduct", "POST", "/", r)
proc updateConstraint*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateConstraint", "POST", "/", r)
proc updatePortfolio*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdatePortfolio", "POST", "/", r)
proc updateProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateProduct", "POST", "/", r)
proc updateProvisionedProduct*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateProvisionedProduct", "POST", "/", r)
proc updateProvisioningArtifact*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateProvisioningArtifact", "POST", "/", r)
proc updateTagOption*(cl: ServiceCatalog, r: JsonNode): Future[JsonNode] = sendJsonRequest(cl, "UpdateTagOption", "POST", "/", r)
