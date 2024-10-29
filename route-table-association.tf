resource "azurerm_subnet_route_table_association" "rg_pri_hub_vn_jmb_sub_rt_asc_01" {
  subnet_id      = azurerm_subnet.rg_pri_hub_vn_jmb_sub.id
  route_table_id = azurerm_route_table.rg_pri_hub_vn_jmb_sub_rt.id
}

resource "azurerm_subnet_route_table_association" "rg_pri_spk_vn_wl_sub_rt_asc_01" {
  subnet_id      = azurerm_subnet.rg_pri_spk_vn_wl_sub.id
  route_table_id = azurerm_route_table.rg_pri_spk_vn_wl_sub_rt.id
}

resource "azurerm_subnet_route_table_association" "rg_pri_spk_vn_rls_sub_rt_asc_01" {
  subnet_id      = azurerm_subnet.rg_pri_spk_vn_rls_sub.id
  route_table_id = azurerm_route_table.rg_pri_spk_vn_rls_sub_rt.id
}

#--

resource "azurerm_subnet_route_table_association" "rg_sec_hub_vn_jmb_sub_rt_asc_01" {
  subnet_id      = azurerm_subnet.rg_sec_hub_vn_jmb_sub.id
  route_table_id = azurerm_route_table.rg_sec_hub_vn_jmb_sub_rt.id
}

resource "azurerm_subnet_route_table_association" "rg_sec_spk_vn_wl_sub_rt_asc_01" {
  subnet_id      = azurerm_subnet.rg_sec_spk_vn_wl_sub.id
  route_table_id = azurerm_route_table.rg_sec_spk_vn_wl_sub_rt.id
}

resource "azurerm_subnet_route_table_association" "rg_sec_spk_vn_rls_sub_rt_asc_01" {
  subnet_id      = azurerm_subnet.rg_sec_spk_vn_rls_sub.id
  route_table_id = azurerm_route_table.rg_sec_spk_vn_rls_sub_rt.id
}