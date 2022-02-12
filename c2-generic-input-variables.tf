# Generic Input Variables.

# Business division.
variable "business_division" {
  description = "Business division is used as the first prefix of the resource names."
  type        = string
  default     = "sap"
}

# Environment variable.
variable "environment" {
  description = "Environment is used as the second prefix of the resource names."
  type        = string
  default     = "dev"
}

# Azure resource group name.
variable "resource_group_name" {
  description = "Resource group for the project resources."
  type        = string
  default     = "rg-default"
}

# Azure resource location
variable "resource_group_location" {
  description = "Location for the resources to be created."
  type        = string
  default     = "uksouth"
}
