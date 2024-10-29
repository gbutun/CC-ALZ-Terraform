data "azurerm_lb" "rg_pri_wl_aks_cl_pvt_lb" {
  name                = "kubernetes-internal"
  resource_group_name = local.aks.rg_pri_node_resource_group_name
}

# #--

data "azurerm_lb" "rg_sec_wl_aks_cl_pvt_lb" {
  name                = "kubernetes-internal"
  resource_group_name = local.aks.rg_sec_node_resource_group_name
}