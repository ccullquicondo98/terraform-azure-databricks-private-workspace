###############################################
# Local Values

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

###############################################
# Resource Group

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags = local.common_tags
}

###############################################
# Network Module

module "network" {
  source = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  tags = local.common_tags
  vnet_name = var.vnet_name
  address_space = var.address_space
  public_subnet_name = var.public_subnet_name
  public_subnet_prefix = var.public_subnet_prefix
  private_subnet_name = var.private_subnet_name
  private_subnet_prefix = var.private_subnet_prefix
  private_endpoint_subnet_name = var.private_endpoint_subnet_name
  private_endpoint_subnet_prefix = var.private_endpoint_subnet_prefix
  nsg_name = var.nsg_name
}

###############################################
# DAtabricks Module

module "databricks" {
  source = "./modules/databricks"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  tags = local.common_tags
  workspace_name = var.workspace_name
  managed_resource_group_name = var.managed_resource_group_name
  workspace_sku = var.workspace_sku
  virtual_network_id = module.network.vnet_id
  public_subnet_name = module.network.public_subnet_name
  private_subnet_name = module.network.private_subnet_name
  public_subnet_nsg_association_id = module.network.public_subnet_nsg_association_id
  private_subnet_nsg_association_id = module.network.private_subnet_nsg_association_id
  private_endpoint_subnet_id = module.network.private_endpoint_subnet_id
  private_dns_zone_name = var.private_dns_zone_name
}