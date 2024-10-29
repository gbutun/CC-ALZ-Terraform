locals {
  default_container_sas_token_01_start  = "-24h"
  default_container_sas_token_01_expiry = "175200h"
}

data "azurerm_storage_account_blob_container_sas" "rg_pri_log_sa_ai_cn_sas_token" {
  connection_string = var.storage_account_rotation_key_id == "1" ? azurerm_storage_account.rg_pri_log_sa.primary_connection_string : azurerm_storage_account.rg_pri_log_sa.secondary_connection_string
  container_name    = azurerm_storage_container.rg_pri_log_sa_ai_cn.name
  https_only        = false

  start = timeadd(
    timestamp(),
    local.default_container_sas_token_01_start,
  )
  expiry = timeadd(
    timestamp(),
    local.default_container_sas_token_01_expiry,
  )

  permissions {
    read   = false
    add    = false
    create = false
    write  = true
    delete = false
    list   = false
  }
}