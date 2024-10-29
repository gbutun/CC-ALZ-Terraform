resource "azurerm_automation_hybrid_runbook_worker_group" "rg_pri_auto_hwg" {
  name                    = "${local.resource_prefix_rg_pri}-auto-hwg-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
}
