###############################################
# General

variable "subscription_id" {
  description = "Azure Subscription ID."
  type        = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

###############################################
# Resource Group

variable "resource_group_name" {
  type = string
}

###############################################
# Network

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "public_subnet_name" {
  type = string
}

variable "public_subnet_prefix" {
  type = list(string)
}

variable "private_subnet_name" {
  type = string
}

variable "private_subnet_prefix" {
  type = list(string)
}

variable "private_endpoint_subnet_name" {
  type = string
}

variable "private_endpoint_subnet_prefix" {
  type = list(string)
}

###############################################
# NSG

variable "nsg_name" {
  type = string
}

###############################################
# DAtabricks Workspace

variable "workspace_name" {
  type = string
}

variable "managed_resource_group_name" {
  type = string
}

variable "workspace_sku" {
  type    = string
}

###############################################
# DNS Zone

variable "private_dns_zone_name" {
  type    = string
}