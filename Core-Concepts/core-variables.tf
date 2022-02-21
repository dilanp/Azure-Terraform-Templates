##=========================== Variables ===========================

# Simple type variable
variable "location" {
  type        = string
  description = "Azure location of terraform server environment"
  default     = "westus2"

}

# Numeric variable.
variable "web_linuxvm_instance_count" {
  description = "Web Linux VM Instance Count"
  type        = number
  default     = 1
}

# List type variable.
variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for Virtual Network"
  default     = ["10.0.0.0/16"]
}

# Map type variable
variable "managed_disk_type" {
  type        = map(string)
  description = "Disk type Premium in Primary location Standard in DR location"

  default = {
    westus2        = "Premium_LRS"
    southcentralus = "Standard_LRS"
    "100" : "8080"
  }
}

# Object type variable.
variable "os" {
  description = "OS image to deploy"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

##============= Usage of variables for resource creation =============

resource "azurerm_storage_account" "sa" {
  name                = var.saname
  resource_group_name = var.rgname
  # Conditional value assignment in case of empty variable value for location.
  location                 = var.location != "" ? var.location : "southcentralus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-dev-${var.location}-001"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = "cal-1263-f8"
}

resource "azurerm_virtual_machine" "vm" {
  name                = "web-server-01"
  location            = var.location
  resource_group_name = "cal-1263-f8"
  vm_size             = "Standard_B1s"

  storage_os_disk {
    name          = "web-server-01-os"
    caching       = "ReadWrite"
    create_option = "FromImage"
    # Map lookup for a value => lookup(map_name, map_key, default_if_not_found).
    managed_disk_type = lookup(var.managed_disk_type, var.location, "Standard_LRS")
  }

  # Refer to the object type values => var.variable_local_name.object_property_name.
  storage_image_reference {
    publisher = var.os.publisher
    offer     = var.os.offer
    sku       = var.os.sku
    version   = var.os.version
  }
}

## ========= Assign variable values in terraform.tfvars file ==========

# Simple type.
location = "southcentralus"
# List type.
vnet_address_space = ["10.0.0.0/16"]
# Map type.
managed_disk_type = {
  uksouth = "Premium_LRS"
}
# Object type.
os = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "16.04.0-LTS"
  version   = "latest"
}
