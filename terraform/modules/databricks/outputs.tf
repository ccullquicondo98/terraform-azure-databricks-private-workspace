#################################################
# Databricks

output "workspace_id" {
  value = azurerm_databricks_workspace.workspace.id
}

output "workspace_name" {
  value = azurerm_databricks_workspace.workspace.name
}

output "workspace_url" {
  value = azurerm_databricks_workspace.workspace.workspace_url
}

output "managed_resource_group_id" {
  value = azurerm_databricks_workspace.workspace.managed_resource_group_id
}

#################################################
# Private Link

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.databricks.id
}

output "workspace_private_endpoint_id" {
  value = azurerm_private_endpoint.workspace_ui.id
}

output "browser_auth_private_endpoint_id" {
  value = azurerm_private_endpoint.workspace_browser_auth.id
}

