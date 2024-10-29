resource "azapi_resource_action" "rg_pri_mal_scn_sa_def" {
  type        = "Microsoft.Security/defenderForStorageSettings@2022-12-01-preview"
  resource_id = "${azurerm_storage_account.rg_pri_mal_scn_sa.id}/providers/Microsoft.Security/defenderForStorageSettings/current"
  method      = "PUT"

  body = jsonencode({
    properties = {
      isEnabled = true
      malwareScanning = {
        onUpload = {
          isEnabled = true
        }
      }
      sensitiveDataDiscovery = {
        isEnabled = true
      }
      overrideSubscriptionLevelSettings = true
    }
  })
}

#--

resource "azapi_resource_action" "rg_sec_sol_sql_backup_retention_policy" {
  type        = "Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-11-01"
  resource_id = "${data.azurerm_mssql_database.rg_sec_vc_db.id}/backupLongTermRetentionPolicies/default"
  method      = "PUT"
  body = jsonencode({
    properties = {
      "weeklyRetention" : "PT0S",
      "monthlyRetention" : "P4M"
    }
  })
}