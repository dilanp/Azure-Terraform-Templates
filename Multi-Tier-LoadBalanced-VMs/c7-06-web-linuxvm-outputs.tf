# Public IP Outputs

## Public IP Address - Removed after introduction of the Bastion Subnet/Service introduction...
/*output "web_linuxvm_public_ip" {
  description = "Web Linux VM Public Address"
  value       = azurerm_public_ip.web_linuxvm_public_ip.ip_address
}*/

# Removed after changing count => for_each move.
/*
# Network Interface Outputs
## Network Interface ID
output "web_linuxvm_network_interface_id" {
  description = "Web Linux VM Network Interface ID"
  value       = azurerm_network_interface.web_linuxvm_nic[*].id
}
## Network Interface Private IP Addresses
output "web_linuxvm_network_interface_private_ip_addresses" {
  description = "Web Linux VM Private IP Addresses"
  value       = [azurerm_network_interface.web_linuxvm_nic[*].private_ip_addresses]
}
*/
# Linux VM Outputs

## Virtual Machine Public IP - Removed after introduction of the Bastion Subnet/Service introduction...
/*output "web_linuxvm_public_ip_address" {
  description = "Web Linux Virtual Machine Public IP"
  value       = azurerm_linux_virtual_machine.web_linuxvm.public_ip_address
}*/


### WHENEVER YOU USE for_each LOOPS TO CREATE RESOURCES
### YOU MUST USE for LOOPS TO OUTPUT VALUES.
### ===================================================
## Virtual Machine Private IP
output "web_linuxvm_private_ip_address_list" {
  description = "Web Linux Virtual Machine Private IP"
  value       = [for vm in azurerm_linux_virtual_machine.web_linuxvm : vm.private_ip_address]
  #value       = azurerm_linux_virtual_machine.web_linuxvm[*].private_ip_address
}

# Output Map  - Single Input to for loop
output "web_linuxvm_private_ip_address_map" {
  description = "Web Linux Virtual Machine Private IP"
  value       = { for vm in azurerm_linux_virtual_machine.web_linuxvm : vm.name => vm.private_ip_address }
}

# Terraform keys() function: keys takes a map and returns a list containing the keys from that map.
output "web_linuxvm_private_ip_address_keys_function" {
  description = "Web Linux Virtual Machine Private IP"
  value       = keys({ for vm in azurerm_linux_virtual_machine.web_linuxvm : vm.name => vm.private_ip_address })
}
# Terraform values() function: values takes a map and returns a list containing the values of the elements in that map.
output "web_linuxvm_private_ip_address_values_function" {
  description = "Web Linux Virtual Machine Private IP"
  value       = values({ for vm in azurerm_linux_virtual_machine.web_linuxvm : vm.name => vm.private_ip_address })
}

# Output List - Two Inputs to for loop (here vm is Iterator like "i")
output "web_linuxvm_network_interface_id_list" {
  description = "Web Linux VM Network Interface ID"
  value       = [for vm, nic in azurerm_network_interface.web_linuxvm_nic : nic.id]
}

# Output Map  - Two Inputs to for loop (here vm is Iterator like "i")
output "web_linuxvm_network_interface_id_map" {
  description = "Web Linux VM Network Interface ID"
  value       = { for vm, nic in azurerm_network_interface.web_linuxvm_nic : vm => nic.id }
}

# Removed after changing count => for_each move.
/*
## Virtual Machine 128-bit ID
output "web_linuxvm_virtual_machine_id_128bit" {
  description = "Web Linux Virtual Machine ID - 128-bit identifier"
  value       = azurerm_linux_virtual_machine.web_linuxvm[*].virtual_machine_id
}
## Virtual Machine ID
output "web_linuxvm_virtual_machine_id" {
  description = "Web Linux Virtual Machine ID "
  value       = azurerm_linux_virtual_machine.web_linuxvm[*].id
}
*/
