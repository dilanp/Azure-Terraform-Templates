
# Public IP Address for the linux VM.
resource "azurerm_public_ip" "web_linuxvm_public_ip" {
  name                = "${local.resourec_name_prefix}-web-linuxvm-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "app1-vm-${random_string.myrandom.id}"
}
