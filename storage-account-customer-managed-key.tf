
resource "azurerm_storage_account_customer_managed_key" "rg_pri_log_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_pri_log_sa.id
  key_vault_id       = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_name           = azurerm_key_vault_key.rg_pri_cmk_enc_kv_log_sa_sse_key.name
}

resource "azurerm_storage_account_customer_managed_key" "rg_pri_rls_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_pri_rls_sa.id
  key_vault_id       = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_name           = azurerm_key_vault_key.rg_pri_cmk_enc_kv_rls_sa_sse_key.name
}

resource "azurerm_storage_account_customer_managed_key" "rg_pri_tfs_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_pri_tfs_sa.id
  key_vault_id       = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_name           = azurerm_key_vault_key.rg_pri_cmk_enc_kv_tfs_sa_sse_key.name
}

resource "azurerm_storage_account_customer_managed_key" "rg_pri_pub_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_pri_pub_sa.id
  key_vault_id       = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_name           = azurerm_key_vault_key.rg_pri_cmk_enc_kv_pub_sa_sse_key.name
}

resource "azurerm_storage_account_customer_managed_key" "rg_pri_biz_log_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_pri_biz_log_sa.id
  key_vault_id       = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_name           = azurerm_key_vault_key.rg_pri_cmk_enc_kv_biz_log_sa_sse_key.name
}

resource "azurerm_storage_account_customer_managed_key" "rg_pri_apc_log_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_pri_apc_log_sa.id
  key_vault_id       = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_name           = azurerm_key_vault_key.rg_pri_cmk_enc_kv_apc_log_sa_sse_key.name
}

resource "azurerm_storage_account_customer_managed_key" "rg_pri_mal_scn_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_pri_mal_scn_sa.id
  key_vault_id       = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_name           = azurerm_key_vault_key.rg_pri_cmk_enc_kv_mal_scn_sa_sse_key.name
}

#--

resource "azurerm_storage_account_customer_managed_key" "rg_sec_log_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_sec_log_sa.id
  key_vault_id       = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  key_name           = data.azurerm_key_vault_key.rg_sec_cmk_enc_kv_log_sa_sse_key.name
}

resource "azurerm_storage_account_customer_managed_key" "rg_sec_biz_log_sa_cmk" {
  storage_account_id = azurerm_storage_account.rg_sec_biz_log_sa.id
  key_vault_id       = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  key_name           = data.azurerm_key_vault_key.rg_sec_cmk_enc_kv_biz_log_sa_sse_key.name
}
