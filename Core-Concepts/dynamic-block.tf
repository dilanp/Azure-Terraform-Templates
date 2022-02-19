
# Variable values as a list.
variable "web_vmss_nsg_inbound_ports" {
  description = "Web VMSS NSG Inbound Ports"
  type        = list(string)
  default     = [22, 80, 443]
}

# Creates multiple inner blocks relevant to list values.
resource "azurerm_network_security_group" "web_vmss_nsg" {
  name                = "${local.resource_name_prefix}-web-vmss-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = var.web_vmss_nsg_inbound_ports

    content {
      name                       = "inbound-rule-${security_rule.key}" # Each index of list.
      description                = "Inbound Rule ${security_rule.key}"
      priority                   = sum([100, security_rule.key]) # Yields 100, 101, 102
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value # Each value of list.
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
