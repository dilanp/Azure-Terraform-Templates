
# Refer a value determined prior to resource creation.
output "db_subnet_name" {
  description = "Db Subnet name"
  value       = azurerm_subnet.dbsubnet.name
}

# Refer a value determined after resource creation.
output "db_subnet_id" {
  description = "Db Subnet id"
  value       = azurerm_subnet.dbsubnet.id
}
