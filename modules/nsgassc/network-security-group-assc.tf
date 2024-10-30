resource "azurerm_subnet_network_security_group_association" "rg_pri_spk_vn_rls_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_pri_spk_vn_rls_sub.id
  network_security_group_id = azurerm_network_security_group.rg_pri_spk_vn_rls_sub_nsg.id
}
