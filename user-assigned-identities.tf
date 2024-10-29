resource "azurerm_user_assigned_identity" "rg_pri_wef_agw_usr_asgn_id" {
  name                = "${local.resource_prefix_rg_pri}-wef-agw-usr-asgn-id-${var.product_unique}"
  location            = azurerm_resource_group.rg_pri.location
  resource_group_name = azurerm_resource_group.rg_pri.name
}

resource "azurerm_user_assigned_identity" "rg_pri_sol_acr_usr_asgn_id" {
  name                = "${local.resource_prefix_rg_pri}-sol-acr-usr-asgn-id-${var.product_unique}"
  location            = azurerm_resource_group.rg_pri.location
  resource_group_name = azurerm_resource_group.rg_pri.name
}

resource "azurerm_user_assigned_identity" "rg_pri_wl_aks_cl_usr_asgn_id" {
  name                = "${local.resource_prefix_rg_pri}-wl-aks-usr-asgn-id-${var.product_unique}"
  location            = azurerm_resource_group.rg_pri.location
  resource_group_name = azurerm_resource_group.rg_pri.name
}

#--

resource "azurerm_user_assigned_identity" "rg_sec_wef_agw_usr_asgn_id" {
  name                = "${local.resource_prefix_rg_sec}-wef-agw-usr-asgn-id-${var.product_unique}"
  location            = azurerm_resource_group.rg_sec.location
  resource_group_name = azurerm_resource_group.rg_sec.name
}

resource "azurerm_user_assigned_identity" "rg_sec_sol_acr_usr_asgn_id" {
  name                = "${local.resource_prefix_rg_sec}-sol-acr-usr-asgn-id-${var.product_unique}"
  location            = azurerm_resource_group.rg_sec.location
  resource_group_name = azurerm_resource_group.rg_sec.name
}

resource "azurerm_user_assigned_identity" "rg_sec_wl_aks_cl_usr_asgn_id" {
  name                = "${local.resource_prefix_rg_sec}-wl-aks-usr-asgn-id-${var.product_unique}"
  location            = azurerm_resource_group.rg_sec.location
  resource_group_name = azurerm_resource_group.rg_sec.name
}
