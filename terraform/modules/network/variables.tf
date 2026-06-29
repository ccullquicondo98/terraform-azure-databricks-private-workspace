variable "resource_group_name" {
  description = "Resource Group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
}

#################################################
# Virtual Network

variable "vnet_name" {
  description = "Virtual Network name."
  type        = string
}

variable "address_space" {
  description = "Virtual Network address space."
  type        = list(string)
}

#################################################
# Public Subnet

variable "public_subnet_name" {
  description = "Public subnet name."
  type        = string
}

variable "public_subnet_prefix" {
  description = "Public subnet prefix."
  type        = list(string)
}

#################################################
# Private Subnet

variable "private_subnet_name" {
  description = "Private subnet name."
  type        = string
}

variable "private_subnet_prefix" {
  description = "Private subnet prefix."
  type        = list(string)
}

#################################################
# Private Endpoint Subnet

variable "private_endpoint_subnet_name" {
  description = "Private Endpoint subnet name."
  type        = string
}

variable "private_endpoint_subnet_prefix" {
  description = "Private Endpoint subnet prefix."
  type        = list(string)
}

#################################################
# Network Security Group

variable "nsg_name" {
  description = "Network Security Group name."
  type        = string
}