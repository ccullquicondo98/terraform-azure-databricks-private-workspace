variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

#################################################
# Databricks

variable "workspace_name" {
  type = string
}

variable "managed_resource_group_name" {
  type = string
}

variable "workspace_sku" {
  type    = string
  default = "premium"
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "network_security_group_rules_required" {
  type    = string
  default = "NoAzureDatabricksRules"
}

#################################################
# Network

variable "virtual_network_id" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "public_subnet_nsg_association_id" {
  type = string
}

variable "private_subnet_nsg_association_id" {
  type = string
}

#################################################
# Private Link

variable "private_endpoint_subnet_id" {
  description = "Private Endpoint subnet ID."
  type        = string
}

variable "private_dns_zone_name" {
  description = "Private DNS Zone name."
  type        = string
  default     = "privatelink.azuredatabricks.net"
}
