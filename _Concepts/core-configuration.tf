# Terraform configuration.
terraform {
  required_version = "= 1.0.0" #EXACT versio
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0" #ANY LATER version
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0.0" #ANY MINOR version
    }
  }
}
