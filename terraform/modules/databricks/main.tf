#################################################
# Databricks workspace

resource "azurerm_databricks_workspace" "workspace" {
  name = var.workspace_name
  resource_group_name = var.resource_group_name
  location = var.location
  sku = var.workspace_sku
  managed_resource_group_name = var.managed_resource_group_name
  public_network_access_enabled = var.public_network_access_enabled
  network_security_group_rules_required = var.network_security_group_rules_required

  custom_parameters {
    no_public_ip = true
    virtual_network_id = var.virtual_network_id
    public_subnet_name = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    public_subnet_network_security_group_association_id = var.public_subnet_nsg_association_id
    private_subnet_network_security_group_association_id = var.private_subnet_nsg_association_id
  }
  tags = var.tags
}