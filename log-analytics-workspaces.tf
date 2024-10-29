resource "azurerm_log_analytics_workspace" "rg_pri_mon_la_ws" {
  name                = "${local.resource_prefix_rg_pri}-mon-la-ws-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location
  sku                 = var.rg_pri_mon_la_ws_sku
  retention_in_days   = var.rg_pri_mon_la_ws_retention_in_days

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Using for diagnostic logging. (Azure Monitor 1 Azure Log Analytics)"
  }
}
