resource "azurerm_subnet" "sub" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vn_name
  address_prefixes     = [var.sub_address_space]
}