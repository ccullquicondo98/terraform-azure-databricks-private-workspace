#################################################
# Virtual Network

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space = var.address_space
  tags = var.tags
}

#################################################
# Public Subnet

resource "azurerm_subnet" "public_subnet" {
  name                 = var.public_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.public_subnet_prefix
  
  delegation {
    name = "${var.public_subnet_name}-delegation"
    
    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }

}

#################################################
# Private Subnet

resource "azurerm_subnet" "private_subnet" {
  name                 = var.private_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.private_subnet_prefix

  delegation {
    name = "${var.private_subnet_name}-delegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }

}

#################################################
# Private Endpoint Subnet

resource "azurerm_subnet" "private_endpoint_subnet" {
  name                 = var.private_endpoint_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.private_endpoint_subnet_prefix
  private_endpoint_network_policies = "Disabled"

}

#################################################
# Network Security Group

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

#################################################
# NSG Association - Public

resource "azurerm_subnet_network_security_group_association" "public_subnet" {
  subnet_id = azurerm_subnet.public_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#################################################
# NSG Association - Private

resource "azurerm_subnet_network_security_group_association" "private_subnet" {
  subnet_id = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}