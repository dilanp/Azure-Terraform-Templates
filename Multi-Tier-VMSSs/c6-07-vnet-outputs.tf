# VNET output values

# VNET Name
output "virtual_network_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.vnet.name
}

# VNET Name
output "virtual_network_id" {
  description = "Virtual network id"
  value       = azurerm_virtual_network.vnet.id
}

# Web Subnet Name
output "web_subnet_name" {
  description = "Web Subnet name"
  value       = azurerm_subnet.websubnet.name
}

# Web Subnet Id
output "web_subnet_id" {
  description = "Web Subnet id"
  value       = azurerm_subnet.websubnet.id
}

# App Subnet Name
output "app_subnet_name" {
  description = "App Subnet name"
  value       = azurerm_subnet.appsubnet.name
}

# App Subnet Id
output "app_subnet_id" {
  description = "App Subnet id"
  value       = azurerm_subnet.appsubnet.id
}

# Db Subnet Name
output "db_subnet_name" {
  description = "Db Subnet name"
  value       = azurerm_subnet.dbsubnet.name
}

# Db Subnet Id
output "db_subnet_id" {
  description = "Db Subnet id"
  value       = azurerm_subnet.dbsubnet.id
}

# Bastion Subnet Name
output "bastion_subnet_name" {
  description = "Bastion Subnet name"
  value       = azurerm_subnet.bastionsubnet.name
}

# Bastion Subnet Id
output "bastion_subnet_id" {
  description = "Bastion Subnet id"
  value       = azurerm_subnet.bastionsubnet.id
}
