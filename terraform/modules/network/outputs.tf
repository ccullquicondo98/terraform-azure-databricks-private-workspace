#################################################
# Virtual Network

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

#################################################
# Subnets

output "public_subnet_id" {
  value = azurerm_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = azurerm_subnet.private_subnet.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint_subnet.id
}

output "public_subnet_name" {
  value = azurerm_subnet.public_subnet.name
}

output "private_subnet_name" {
  value = azurerm_subnet.private_subnet.name
}

#################################################
# NSG Associations

output "public_subnet_nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.public_subnet.id
}

output "private_subnet_nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.private_subnet.id
}

#################################################
# NSG

output "network_security_group_id" {
  value = azurerm_network_security_group.nsg.id
}