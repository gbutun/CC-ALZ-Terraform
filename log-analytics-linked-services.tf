resource "azurerm_log_analytics_linked_service" "rg_pri_mon_la_ws_auto_ls" {
  resource_group_name = azurerm_resource_group.rg_pri.name
  workspace_id        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  read_access_id      = azurerm_automation_account.rg_pri_auto.id
}