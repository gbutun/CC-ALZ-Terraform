resource "azurerm_mssql_server_microsoft_support_auditing_policy" "rg_pri_sol_sql_ms_support_auditing_policy" {
  server_id                       = azurerm_mssql_server.rg_pri_sol_sql.id
  blob_storage_endpoint           = azurerm_storage_account.rg_pri_log_sa.primary_blob_endpoint
  storage_account_subscription_id = var.subscription_id
  log_monitoring_enabled          = false
  depends_on = [
    azurerm_role_assignment.rg_pri_log_sarg_pri_sol_sql_mng_id_role_assg_01,
    azurerm_role_assignment.rg_pri_log_sarg_pri_sol_sql_mng_id_role_assg_02
  ]
}

#--

resource "azurerm_mssql_server_microsoft_support_auditing_policy" "rg_sec_sol_sql_ms_support_auditing_policy" {
  server_id                       = azurerm_mssql_server.rg_sec_sol_sql.id
  blob_storage_endpoint           = azurerm_storage_account.rg_sec_log_sa.primary_blob_endpoint
  storage_account_subscription_id = var.subscription_id
  log_monitoring_enabled          = false
  depends_on = [
    azurerm_role_assignment.rg_sec_log_sarg_sec_sol_sql_mng_id_role_assg_01,
    azurerm_role_assignment.rg_sec_log_sarg_sec_sol_sql_mng_id_role_assg_02
  ]
}
