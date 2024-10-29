resource "azurerm_network_watcher" "rg_pri_nww" {
  name                = "${local.resource_prefix_rg_pri}-nww-${var.product_unique}"
  location            = azurerm_resource_group.rg_pri.location
  resource_group_name = azurerm_resource_group.rg_pri.name
}

#--

resource "azurerm_network_watcher" "rg_sec_nww" {
  name                = "${local.resource_prefix_rg_sec}-nww-${var.product_unique}"
  location            = azurerm_resource_group.rg_sec.location
  resource_group_name = azurerm_resource_group.rg_sec.name
}