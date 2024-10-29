resource "azurerm_subnet_network_security_group_association" "rg_pri_hub_vn_jmb_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_pri_hub_vn_jmb_sub.id
  network_security_group_id = azurerm_network_security_group.rg_pri_hub_vn_jmb_sub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "rg_pri_hub_vn_wef_agw_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_pri_hub_vn_wef_agw_sub.id
  network_security_group_id = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "rg_pri_spk_vn_wl_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_pri_spk_vn_wl_sub.id
  network_security_group_id = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "rg_pri_spk_vn_sql_pe_int_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_pri_spk_vn_sql_pe_int_sub.id
  network_security_group_id = azurerm_network_security_group.rg_pri_spk_vn_sql_pe_int_sub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "rg_pri_spk_vn_rls_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_pri_spk_vn_rls_sub.id
  network_security_group_id = azurerm_network_security_group.rg_pri_spk_vn_rls_sub_nsg.id
}

#RG-02

resource "azurerm_subnet_network_security_group_association" "rg_sec_hub_vn_jmb_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_sec_hub_vn_jmb_sub.id
  network_security_group_id = azurerm_network_security_group.rg_sec_hub_vn_jmb_sub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "rg_sec_hub_vn_wef_agw_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_sec_hub_vn_wef_agw_sub.id
  network_security_group_id = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "rg_sec_spk_vn_wl_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_sec_spk_vn_wl_sub.id
  network_security_group_id = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "rg_sec_spk_vn_sql_pe_int_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_sec_spk_vn_sql_pe_int_sub.id
  network_security_group_id = azurerm_network_security_group.rg_sec_spk_vn_sql_pe_int_sub_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "rg_sec_spk_vn_rls_sub_nsg_asc" {
  subnet_id                 = azurerm_subnet.rg_sec_spk_vn_rls_sub.id
  network_security_group_id = azurerm_network_security_group.rg_sec_spk_vn_rls_sub_nsg.id
}