
# OPTIONAL!!!

# NSG for the linux web VM NICs.
resource "azurerm_network_security_group" "web_vmnic_nsg" {
  name                = "${local.resource_name_prefix}-web-linuxvm-nic-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# NSG - NICs association.
resource "azurerm_network_interface_security_group_association" "web_vmnic_nsg_associate" {
  depends_on = [azurerm_network_security_rule.web_vmnic_nsg_rule_inbound]

  for_each = var.web_linuxvm_instance_count

  network_interface_id      = azurerm_network_interface.web_linuxvm_nic[each.key].id
  network_security_group_id = azurerm_network_security_group.web_vmnic_nsg.id
}

# Implementation using count meta arguments.
/*
resource "azurerm_network_interface_security_group_association" "web_vmnic_nsg_associate" {
  depends_on = [azurerm_network_security_rule.web_vmnic_nsg_rule_inbound]

  count = var.web_linuxvm_instance_count

  network_interface_id      = azurerm_network_interface.web_linuxvm_nic[count.index].id
  network_security_group_id = azurerm_network_security_group.web_vmnic_nsg.id
}
*/

# Locals block for NSG rule.
locals {
  web_vmnic_inbound_ports_map = {
    "100" : "80"
    "110" : "443"
    "120" : "22"
  }
}

# NSG Rule 
resource "azurerm_network_security_rule" "web_vmnic_nsg_rule_inbound" {
  for_each                    = local.web_vmnic_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web_vmnic_nsg.name
}
