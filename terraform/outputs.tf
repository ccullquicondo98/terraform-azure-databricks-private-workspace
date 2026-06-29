###############################################
# Resource Group

output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

###############################################
# Network

output "vnet_id" {
  value = module.network.vnet_id
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "private_endpoint_subnet_id" {
  value = module.network.private_endpoint_subnet_id
}

###############################################
# NSG

output "public_subnet_nsg_association_id" {
  value = module.network.public_subnet_nsg_association_id
}

output "private_subnet_nsg_association_id" {
  value = module.network.private_subnet_nsg_association_id
}

output "network_security_group_id" {
  value = module.network.network_security_group_id
}

###############################################
# Databricks Workspace

output "workspace_id" {
  value = module.databricks.workspace_id
}

output "workspace_url" {
  value = module.databricks.workspace_url
}

###############################################
# Private Endpoints

output "workspace_private_endpoint_id" {
  value = module.databricks.workspace_private_endpoint_id
}

output "browser_auth_private_endpoint_id" {
  value = module.databricks.browser_auth_private_endpoint_id
}

output "private_dns_zone_id" {
  value = module.databricks.private_dns_zone_id
}