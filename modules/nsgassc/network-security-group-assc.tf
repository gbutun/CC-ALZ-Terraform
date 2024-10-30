resource "azurerm_subnet_network_security_group_association" "nsgassc" {
  subnet_id                 =  var.sub_id
  network_security_group_id = var.nsg_id
}
