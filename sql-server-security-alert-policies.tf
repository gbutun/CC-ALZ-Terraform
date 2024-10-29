resource "azurerm_mssql_server_security_alert_policy" "rg_pri_sol_sql_sec_alrt_pol" {
  resource_group_name        = azurerm_resource_group.rg_pri.name
  server_name                = azurerm_mssql_server.rg_pri_sol_sql.name
  state                      = "Enabled"
  storage_endpoint           = azurerm_storage_account.rg_pri_log_sa.primary_blob_endpoint
  storage_account_access_key = var.storage_account_rotation_key_id == "1" ? azurerm_storage_account.rg_pri_log_sa.primary_access_key : azurerm_storage_account.rg_pri_log_sa.secondary_access_key
  email_account_admins       = local.sql_vln_ass.email_subscription_admins
  email_addresses            = local.sql_vln_ass.emails
  retention_days             = var.security_alert_policy_log_retention_period_in_days

  depends_on = [
    azurerm_role_assignment.rg_pri_log_sarg_pri_sol_sql_mng_id_role_assg_01
  ]
}

#--

resource "azurerm_mssql_server_security_alert_policy" "rg_sec_sol_sql_sec_alrt_pol" {
  resource_group_name        = azurerm_resource_group.rg_sec.name
  server_name                = azurerm_mssql_server.rg_sec_sol_sql.name
  state                      = "Enabled"
  storage_endpoint           = azurerm_storage_account.rg_sec_log_sa.primary_blob_endpoint
  storage_account_access_key = var.storage_account_rotation_key_id == "1" ? azurerm_storage_account.rg_sec_log_sa.primary_access_key : azurerm_storage_account.rg_sec_log_sa.secondary_access_key
  email_account_admins       = local.sql_vln_ass.email_subscription_admins
  email_addresses            = local.sql_vln_ass.emails
  retention_days             = var.security_alert_policy_log_retention_period_in_days

  depends_on = [
    azurerm_role_assignment.rg_sec_log_sarg_sec_sol_sql_mng_id_role_assg_01
  ]
}