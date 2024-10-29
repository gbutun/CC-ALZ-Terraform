data "azurerm_network_security_group" "rg_pri_spk_vn_aks_sub_nsg" {
  name                = "aks-agentpool-12857252-nsg"
  resource_group_name = local.aks.rg_pri_node_resource_group_name
}

data "azurerm_network_security_group" "rg_sec_spk_vn_aks_sub_nsg" {
  name                = "aks-agentpool-12857252-nsg"
  resource_group_name = local.aks.rg_sec_node_resource_group_name
}