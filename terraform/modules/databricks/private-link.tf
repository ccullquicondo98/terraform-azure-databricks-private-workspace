#################################################
# Private DNS Zone

resource "azurerm_private_dns_zone" "databricks" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
  tags = var.tags
}

#################################################
# Private DNS Zone Link

resource "azurerm_private_dns_zone_virtual_network_link" "databricks" {
  name                  = "dnslink-databricks"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.databricks.name
  virtual_network_id = var.virtual_network_id
  registration_enabled = false
  tags = var.tags
}

#################################################
# Databricks databricks_ui_api Private Endpoint

resource "azurerm_private_endpoint" "workspace_ui" {
  depends_on = [
    azurerm_databricks_workspace.workspace
  ]
  name                = "pep-databricks-ui"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id = var.private_endpoint_subnet_id

  private_service_connection {
    name = "psc-databricks-ui"
    is_manual_connection = false
    private_connection_resource_id = azurerm_databricks_workspace.workspace.id
    subresource_names = ["databricks_ui_api"]

  }

  private_dns_zone_group {
    name = "private-dns-zone-uiapi"
    private_dns_zone_ids = [azurerm_private_dns_zone.databricks.id]
  }
  tags = var.tags

}

#################################################
# Databricks browser_authentication Private Endpoint

resource "azurerm_private_endpoint" "workspace_browser_auth" {
  depends_on = [
    azurerm_databricks_workspace.workspace
  ]
  name                = "pep-databricks-browser_auth"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id = var.private_endpoint_subnet_id

  private_service_connection {
    name = "psc-databricks-browser_auth"
    is_manual_connection = false
    private_connection_resource_id = azurerm_databricks_workspace.workspace.id
    subresource_names = ["browser_authentication"]
  }

  private_dns_zone_group {
    name = "private-dns-zone-browser_auth"
    private_dns_zone_ids = [azurerm_private_dns_zone.databricks.id]
  }
  tags = var.tags

}