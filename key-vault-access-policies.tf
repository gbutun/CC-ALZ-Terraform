locals {
  aad_client_current_kv_service_principal_key_permissions         = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "GetRotationPolicy", "SetRotationPolicy"]
  aad_client_current_kv_service_principal_secret_permissions      = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
  aad_client_current_kv_service_principal_certificate_permissions = ["Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "GetIssuers", "Update"]

  sa_sse_identity_principal_key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
  sa_sse_identity_principal_secret_permissions      = []
  sa_sse_identity_principal_certificate_permissions = []

  sql_tde_identity_principal_key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
  sql_tde_identity_principal_secret_permissions      = []
  sql_tde_identity_principal_certificate_permissions = []

  vc_app_identity_principal_key_permissions         = []
  vc_app_identity_principal_secret_permissions      = ["List", "Get"]
  vc_app_identity_principal_certificate_permissions = ["List", "Get"]

  kub_csi_identity_principal_key_permissions         = ["List", "Get"]
  kub_csi_identity_principal_secret_permissions      = ["List", "Get"]
  kub_csi_identity_principal_certificate_permissions = ["List", "Get"]

  ms_app_svc_identity_principal_key_permissions         = []
  ms_app_svc_identity_principal_secret_permissions      = ["Get"]
  ms_app_svc_identity_principal_certificate_permissions = ["Get"]

  agw_svc_identity_principal_key_permissions         = []
  agw_svc_identity_principal_secret_permissions      = ["Get"]
  agw_svc_identity_principal_certificate_permissions = ["Get"]

  rsv_enc_identity_principal_key_permissions         = ["Get", "List", "WrapKey", "UnwrapKey"]
  rsv_enc_identity_principal_secret_permissions      = []
  rsv_enc_identity_principal_certificate_permissions = []

  vm_disk_enc_identity_principal_key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
  vm_disk_enc_identity_principal_secret_permissions      = ["List", "Get"]
  vm_disk_enc_identity_principal_certificate_permissions = []

  vm_backup_identity_principal_key_permissions         = ["Get", "Backup", "UnwrapKey"]
  vm_backup_identity_principal_secret_permissions      = ["List", "Get"]
  vm_backup_identity_principal_certificate_permissions = []

  acr_enc_identity_principal_key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
  acr_enc_identity_principal_secret_permissions      = ["Get"]
  acr_enc_identity_principal_certificate_permissions = []

  dsk_enc_set_identity_principal_key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
  dsk_enc_set_identity_principal_secret_permissions      = []
  dsk_enc_set_identity_principal_certificate_permissions = []

  aad_app_auto_identity_principal_key_permissions         = []
  aad_app_auto_identity_principal_secret_permissions      = ["List", "Get"]
  aad_app_auto_identity_principal_certificate_permissions = ["List", "Get"]
  aad_app_auto_identity_principal_secret_set_permissions      = ["List", "Get", "Set"]
}

resource "azurerm_key_vault_access_policy" "rg_pri_kvs_service_principals" {
  for_each     = { for resource in data.azurerm_resources.rg_pri_key_vaults.resources : resource.id => resource.name }
  key_vault_id = each.key
  tenant_id    = data.azuread_client_config.current.tenant_id
  object_id    = data.azuread_client_config.current.object_id

  key_permissions         = local.aad_client_current_kv_service_principal_key_permissions
  secret_permissions      = local.aad_client_current_kv_service_principal_secret_permissions
  certificate_permissions = local.aad_client_current_kv_service_principal_certificate_permissions
}

resource "azurerm_key_vault_access_policy" "rg_pri_cmk_enc_kv_sol_sql_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_mssql_server.rg_pri_sol_sql.identity[0].principal_id

  key_permissions         = local.sql_tde_identity_principal_key_permissions
  secret_permissions      = local.sql_tde_identity_principal_secret_permissions
  certificate_permissions = local.sql_tde_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_mssql_server.rg_pri_sol_sql
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_log_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_pri_log_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_storage_account.rg_pri_log_sa,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_rls_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_pri_rls_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_storage_account.rg_pri_rls_sa,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_tfs_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_pri_tfs_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_storage_account.rg_pri_tfs_sa,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_pub_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_pri_pub_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_storage_account.rg_pri_pub_sa,
  ]
}


resource "azurerm_key_vault_access_policy" "rg_pri_vm_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_windows_virtual_machine.rg_pri_rls_vm.identity[0].principal_id

  key_permissions         = local.vm_disk_enc_identity_principal_key_permissions
  secret_permissions      = local.vm_disk_enc_identity_principal_secret_permissions
  certificate_permissions = local.vm_disk_enc_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_windows_virtual_machine.rg_pri_rls_vm
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_vm_kv_bck_svc_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = local.ms_app_ids.backup_service_application_id

  key_permissions         = local.vm_backup_identity_principal_key_permissions
  secret_permissions      = local.vm_backup_identity_principal_secret_permissions
  certificate_permissions = local.vm_backup_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_acr_enc_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.rg_pri_sol_acr_usr_asgn_id.principal_id

  key_permissions         = local.acr_enc_identity_principal_key_permissions
  secret_permissions      = local.acr_enc_identity_principal_secret_permissions
  certificate_permissions = local.acr_enc_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_user_assigned_identity.rg_pri_sol_acr_usr_asgn_id
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_cmk_enc_kv_aks_node_dsk_enc_set_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_disk_encryption_set.rg_pri_aks_node_dsk_enc_set.identity[0].principal_id

  key_permissions         = local.dsk_enc_set_identity_principal_key_permissions
  secret_permissions      = local.dsk_enc_set_identity_principal_secret_permissions
  certificate_permissions = local.dsk_enc_set_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
  ]
}


resource "azurerm_key_vault_access_policy" "rg_pri_biz_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_pri_biz_log_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_storage_account.rg_pri_biz_log_sa,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_apc_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_pri_apc_log_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_storage_account.rg_pri_apc_log_sa,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_mal_scn_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_pri_mal_scn_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_storage_account.rg_pri_mal_scn_sa,
  ]
}


resource "azurerm_key_vault_access_policy" "rg_pri_agw_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_agw_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.rg_pri_wef_agw_usr_asgn_id.principal_id

  key_permissions         = local.agw_svc_identity_principal_key_permissions
  secret_permissions      = local.agw_svc_identity_principal_secret_permissions
  certificate_permissions = local.agw_svc_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_agw_kv,
    azurerm_user_assigned_identity.rg_pri_wef_agw_usr_asgn_id,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_app_kv_aad_app_aks_vc_ns_01_service_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  tenant_id    = var.tenant_id
  object_id    = azuread_service_principal.aad_app_aks_vc_ns_01_service_principal.object_id

  key_permissions         = local.vc_app_identity_principal_key_permissions
  secret_permissions      = local.vc_app_identity_principal_secret_permissions
  certificate_permissions = local.vc_app_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv,
    azuread_service_principal.aad_app_aks_vc_ns_01_service_principal,
  ]
}


resource "azurerm_key_vault_access_policy" "rg_pri_kub_kv_rg_pri_wl_aks_cl_csr_id_usr_asgn_id" {
  key_vault_id = azurerm_key_vault.rg_pri_kub_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.key_vault_secrets_provider[0].secret_identity[0].object_id

  key_permissions         = local.kub_csi_identity_principal_key_permissions
  secret_permissions      = local.kub_csi_identity_principal_secret_permissions
  certificate_permissions = local.kub_csi_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_kub_kv
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_rsv_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_recovery_services_vault.rg_pri_rsv.identity[0].principal_id

  key_permissions         = local.rsv_enc_identity_principal_key_permissions
  secret_permissions      = local.rsv_enc_identity_principal_secret_permissions
  certificate_permissions = local.rsv_enc_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_recovery_services_vault.rg_pri_rsv
  ]
}

#--

resource "azurerm_key_vault_access_policy" "rg_sec_kvs_service_principals" {
  for_each     = { for resource in data.azurerm_resources.rg_sec_key_vaults.resources : resource.id => resource.name }
  key_vault_id = each.key
  tenant_id    = data.azuread_client_config.current.tenant_id
  object_id    = data.azuread_client_config.current.object_id

  key_permissions         = local.aad_client_current_kv_service_principal_key_permissions
  secret_permissions      = local.aad_client_current_kv_service_principal_secret_permissions
  certificate_permissions = local.aad_client_current_kv_service_principal_certificate_permissions
}

resource "azurerm_key_vault_access_policy" "rg_sec_cmk_enc_kv_sol_sql_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_mssql_server.rg_sec_sol_sql.identity[0].principal_id

  key_permissions         = local.sql_tde_identity_principal_key_permissions
  secret_permissions      = local.sql_tde_identity_principal_secret_permissions
  certificate_permissions = local.sql_tde_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_mssql_server.rg_sec_sol_sql
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_log_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_sec_log_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_storage_account.rg_sec_log_sa,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_vm_kv_bck_svc_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = local.ms_app_ids.backup_service_application_id

  key_permissions         = local.vm_backup_identity_principal_key_permissions
  secret_permissions      = local.vm_backup_identity_principal_secret_permissions
  certificate_permissions = local.vm_backup_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_acr_enc_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.rg_sec_sol_acr_usr_asgn_id.principal_id

  key_permissions         = local.acr_enc_identity_principal_key_permissions
  secret_permissions      = local.acr_enc_identity_principal_secret_permissions
  certificate_permissions = local.acr_enc_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_user_assigned_identity.rg_sec_sol_acr_usr_asgn_id
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_cmk_enc_kv_aks_node_dsk_enc_set_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_disk_encryption_set.rg_sec_aks_node_dsk_enc_set.identity[0].principal_id

  key_permissions         = local.dsk_enc_set_identity_principal_key_permissions
  secret_permissions      = local.dsk_enc_set_identity_principal_secret_permissions
  certificate_permissions = local.dsk_enc_set_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_agw_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_agw_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.rg_sec_wef_agw_usr_asgn_id.principal_id

  key_permissions         = local.agw_svc_identity_principal_key_permissions
  secret_permissions      = local.agw_svc_identity_principal_secret_permissions
  certificate_permissions = local.agw_svc_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_agw_kv,
    azurerm_user_assigned_identity.rg_sec_wef_agw_usr_asgn_id,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_app_kv_aad_app_aks_vc_ns_01_service_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  tenant_id    = var.tenant_id
  object_id    = azuread_service_principal.aad_app_aks_vc_ns_01_service_principal.object_id

  key_permissions         = local.vc_app_identity_principal_key_permissions
  secret_permissions      = local.vc_app_identity_principal_secret_permissions
  certificate_permissions = local.vc_app_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv,
    azuread_service_principal.aad_app_aks_vc_ns_01_service_principal,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_app_kv_rg_sec_aad_app_aks_vc_ns_01_service_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  tenant_id    = var.tenant_id
  object_id    = azuread_service_principal.rg_sec_aad_app_aks_vc_ns_01_service_principal.object_id

  key_permissions         = local.vc_app_identity_principal_key_permissions
  secret_permissions      = local.vc_app_identity_principal_secret_permissions
  certificate_permissions = local.vc_app_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv,
    azuread_service_principal.rg_sec_aad_app_aks_vc_ns_01_service_principal,
  ]
}


resource "azurerm_key_vault_access_policy" "rg_sec_kub_kv_rg_sec_wl_aks_cl_csr_id_usr_asgn_id" {
  key_vault_id = azurerm_key_vault.rg_sec_kub_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.key_vault_secrets_provider[0].secret_identity[0].object_id

  key_permissions         = local.kub_csi_identity_principal_key_permissions
  secret_permissions      = local.kub_csi_identity_principal_secret_permissions
  certificate_permissions = local.kub_csi_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_kub_kv
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_rsv_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_recovery_services_vault.rg_sec_rsv.identity[0].principal_id

  key_permissions         = local.rsv_enc_identity_principal_key_permissions
  secret_permissions      = local.rsv_enc_identity_principal_secret_permissions
  certificate_permissions = local.rsv_enc_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_recovery_services_vault.rg_sec_rsv
  ]
}

resource "azurerm_key_vault_access_policy" "rg_sec_biz_sa_kv_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_storage_account.rg_sec_biz_log_sa.identity[0].principal_id

  key_permissions         = local.sa_sse_identity_principal_key_permissions
  secret_permissions      = local.sa_sse_identity_principal_secret_permissions
  certificate_permissions = local.sa_sse_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_storage_account.rg_sec_biz_log_sa,
  ]
}

resource "azurerm_key_vault_access_policy" "rg_pri_auto_kv_aad_app_auto_system_identity_principal" {
  key_vault_id = azurerm_key_vault.rg_pri_auto_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_automation_account.rg_pri_auto.identity[0].principal_id

  key_permissions         = local.aad_app_auto_identity_principal_key_permissions
  secret_permissions      = local.aad_app_auto_identity_principal_secret_set_permissions
  certificate_permissions = local.aad_app_auto_identity_principal_certificate_permissions

  depends_on = [
    azurerm_key_vault.rg_pri_auto_kv
  ]
}