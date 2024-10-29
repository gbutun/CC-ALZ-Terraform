locals {
  kvs = {
    content_type = {
      text_plain   = "text/plain"
      public_cert  = "application/pkix-cert"
      private_cert = "application/x-pkcs12"
    }
  }
}

## region 1

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_tenant_id_secret" {
  name         = "ops-crd-tenant-id-secret"
  value        = var.tenant_id
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for tenant_id"
    tf_var      = "tenant_id"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_subscription_id_secret" {
  name         = "ops-crd-subscription-id-secret"
  value        = var.subscription_id
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for subscription_id"
    tf_var      = "subscription_id"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_client_id_secret" {
  name         = "ops-crd-client-id-secret"
  value        = var.client_id
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for client_id"
    tf_var      = "client_id"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_client_secret_01_secret" {
  name         = "ops-crd-client-secret-01-secret"
  value        = azuread_service_principal_password.aad_app_devops_service_principal_password_01.value
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for client_secret 01"
    tf_var      = "client_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_storage_account_name_secret" {
  name         = "ops-crd-storage-account-name-secret"
  value        = var.storage_account_name
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for storage_account_name"
    tf_var      = "storage_account_name"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_storage_container_name_secret" {
  name         = "ops-crd-storage-container-name-secret"
  value        = var.storage_container_name
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for storage_container_name"
    tf_var      = "storage_container_name"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_storage_access_key_secret" {
  name         = "ops-crd-storage-access-key-secret"
  value        = var.storage_access_key
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for storage_access_key"
    tf_var      = "storage_access_key"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_devops_user_name_secret" {
  name         = "ops-crd-devops-user-name-secret"
  value        = local.aad_user.deployment_client_upn
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for devops_user_name"
    tf_var      = "devops_user_name"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_devops_user_password_secret" {
  name         = "ops-crd-devops-user-password-secret"
  value        = random_password.dep_cli_aad_user_pass_01.result
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for devops_user_password"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_deployment_client_pat_secret" {
  name         = "ops-crd-deployment-client-pat-secret"
  value        = var.ops_crd_deployment_client_pat_secret
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for Deployment Client Personal Access Token"
  }

  lifecycle {
    ignore_changes = [
      value,
      content_type,
      tags
    ]
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_rls_admin_username_secret" {
  name         = "ops-crd-rls-admin-username-secret"
  value        = var.rg_pri_rls_vm_os_profile_admin_username
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "TFVAR internal domain rls admin user name"
    tf_var      = "rg_pri_rls_vm_os_profile_admin_username"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_rls_admin_password_secret" {
  name         = "ops-crd-rls-admin-password-secret"
  value        = var.rg_pri_rls_vm_os_profile_admin_password
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "TFVAR internal domain rls admin user pwd"
    tf_var      = "rg_pri_rls_vm_os_profile_admin_password"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_sol_sql_administrator_username_secret" {
  name         = "ops-crd-sol-sql-administrator-username-secret"
  value        = var.rg_pri_sol_sql_administrator_login
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for aad_user_administrator_user_principal_name"
    tf_var      = "rg_pri_sol_sql_administrator_login"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_sol_sql_administrator_password_secret" {
  name         = "ops-crd-sol-sql-administrator-password-secret"
  value        = random_password.rg_pri_sol_sql_administrator_login.result
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for aad_user_administrator_password"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_client_secret_02_secret" {
  name         = "ops-crd-client-secret-02-secret"
  value        = azuread_service_principal_password.aad_app_devops_service_principal_password_02.value
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for client_secret 02"
    tf_var      = "client_secret_02"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}


resource "azurerm_key_vault_secret" "rg_pri_ops_kv_ops_crd_mobile_client_upn_secret" {
  name         = "ops-crd-mobile-client-upn-secret"
  value        = local.aad_user.mobile_client_upn
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for Mobile Client user name"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_ops_kv_ops_crd_mobile_client_password_secret" {
  name         = "ops-crd-mobile-client-password-secret"
  value        = random_password.mob_cli_aad_user_pass_01.result
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for Mobile Client password"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_mobile_client_appCenter_api_token_secret" {
  name         = "ops-crd-mobile-client-appCenter-api-token-secret"
  value        = var.app_center_rest_api_token
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for Mobile Client AppCenter API Token"
    #tf_var      = "app_center_rest_api_token"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_sol_sql_server_fqdn_secret" {
  name         = "ops-crd-sol-sql-server-fqdn-secret"
  value        = azurerm_mssql_server.rg_pri_sol_sql.fully_qualified_domain_name
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for SQL Server FQDN"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_sql_server_admin_username_secret" {
  name         = "ops-crd-sql-server-admin-username-secret"
  value        = var.rg_pri_sql_admin_aad_user_01_username
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_pri_sql_admin_aad_user_01_username"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential Uesr for SQL Server Admin User"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_sql_server_admin_user_password_secret" {
  name         = "ops-crd-sql-server-admin-user-password-secret"
  value        = var.rg_pri_sql_admin_aad_user_01_password
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_pri_sql_admin_aad_user_01_password"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential Uesr for SQL Server Admin Password"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_hq_prod_vngc_shared_secret_key_secret" {
  name         = "ops-crd-secret-hq-prod-vngc-shared-secret-key"
  value        = var.rg_pri_ziraatag_hq_prod_lng_vng_con_shared_secret_key
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Virtual Network Gateway Shared Key"
    tf_var      = "rg_pri_ziraatag_hq_prod_lng_vng_con_shared_secret_key"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_hq_bck_vngc_shared_secret_key_secret" {
  name         = "ops-crd-secret-hq-bck-vngc-shared-secret-key"
  value        = var.rg_pri_ziraatag_hq_bck_lng_vng_con_shared_secret_key
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Virtual Network Gateway Shared Key"
    tf_var      = "rg_pri_ziraatag_hq_bck_lng_vng_con_shared_secret_key"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_drc_vngc_shared_secret_key_secret" {
  name         = "ops-crd-secret-drc-vngc-shared-secret-key"
  value        = var.rg_pri_ziraatag_drc_lng_vng_con_shared_secret_key
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Virtual Network Gateway Shared Key"
    tf_var      = "rg_pri_ziraatag_drc_lng_vng_con_shared_secret_key"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_jmb_vm_admin_username_secret" {
  name         = "ops-crd-jmb-vm-admin-username-secret"
  value        = var.rg_pri_jmb_vm_os_profile_admin_username
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Jumpbox machine admin user name"
    tf_var      = "rg_pri_jmb_vm_os_profile_admin_username"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vm_ops_kv_ops_crd_jmb_vm_admin_user_password_secret" {
  name         = "ops-crd-jmb-vm-admin-user-password-secret"
  value        = var.rg_pri_jmb_vm_os_profile_admin_password
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Jumpbox machine admin user pwd"
    tf_var      = "rg_pri_jmb_vm_os_profile_admin_password"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv,
  ]
}


resource "azurerm_key_vault_secret" "rg_pri_ops_kv_ops_crd_aad_app_acr_push_service_principal_client_id_secret" {
  name         = "ops-crd-acr-push-sp-client-id-secret"
  value        = azuread_application.aad_app_acr_push.client_id
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for ACR Push Service Principal Client ID"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_ops_kv_ops_crd_aad_app_acr_push_service_principal_pwd_01_secret" {
  name         = "ops-crd-acr-push-sp-client-secret-secret"
  value        = azuread_service_principal_password.aad_app_acr_push_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for ACR Push Service Principal Client Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}


resource "azurerm_key_vault_secret" "rg_pri_ops_kv_ops_crd_aad_app_acr_pull_service_principal_client_id_secret" {
  name         = "ops-crd-acr-pull-sp-client-id-secret"
  value        = azuread_application.aad_app_acr_pull.object_id
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for ACR Pull Service Principal Client ID"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_ops_kv_ops_crd_aad_app_acr_pull_service_principal_pwd_01_secret" {
  name         = "ops-crd-acr-pull-sp-client-secret-secret"
  value        = azuread_service_principal_password.aad_app_acr_pull_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for ACR Pull Service Principal Client Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_cmk_enc_kv_nhub_sas_secret" {
  name         = "nhub-crd-sas-secret"
  value        = "Endpoint=sb://${azurerm_notification_hub_authorization_rule.rg_pri_nhb_auth_mob_nhb.namespace_name}.servicebus.windows.net/;SharedAccessKeyName=${azurerm_notification_hub_authorization_rule.rg_pri_nhb_auth_mob_nhb.name};SharedAccessKey=${azurerm_notification_hub_authorization_rule.rg_pri_nhb_auth_mob_nhb.primary_access_key}"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Manager SAS keys for push notification"
  }

  depends_on = [
    azurerm_notification_hub_namespace.rg_pri_nhb_ns_mob,
    azurerm_notification_hub.rg_pri_nhb_ns_mob_nhb,
    azurerm_notification_hub_authorization_rule.rg_pri_nhb_auth_mob_nhb,
    azurerm_key_vault.rg_pri_cmk_enc_kv
  ]
}


resource "azurerm_key_vault_secret" "rg_pri_ops_kv_ops_crd_aad_app_argo_cd_pwd_01_secret" {
  name         = "ops-crd-aad-app-argocd-pwd-01-secret"
  value        = azuread_application_password.aad_app_argo_cd_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "OPS Credential for ArgoCD Service Principal Password Client Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_mon_ai_instrumentation_key_secret" {
  name         = "ops-crd-mon-ai-instrumentation-key-secret"
  value        = azurerm_application_insights.rg_pri_mon_ai.instrumentation_key
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Application Insights Instrumentation Key"
  }
}

resource "azurerm_key_vault_secret" "rg_pri_aad_app_vt_d365_01_service_principal_client_id_secret" {
  name         = "aad-app-vt-d365-01-sp-client-id-secret"
  value        = azuread_service_principal.aad_app_vt_d365_01_service_principal.client_id
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "DEV Env D365 Service Principal 01 Client ID"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_aad_app_vt_d365_01_service_principal_pwd_01_secret" {
  name         = "aad-app-vt-d365-01-sp-password-01-secret"
  value        = azuread_application_password.aad_app_vt_d365_01_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "DEV Env D365 Service Principal 01 Password 01"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_aad_app_vt_d365_02_service_principal_client_id_secret" {
  name         = "aad-app-vt-d365-02-sp-client-id-secret"
  value        = azuread_service_principal.aad_app_vt_d365_02_service_principal.client_id
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "DEV Env D365 02 Service Principal Client ID"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_aad_app_vt_d365_02_service_principal_pwd_01_secret" {
  name         = "aad-app-vt-d365-02-sp-password-01-secret"
  value        = azuread_application_password.aad_app_vt_d365_02_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_pri_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "DEV Env D365 02 Service Principal Password 01"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_cmk_enc_kv_nhub_gcm_cred_api_key_secret" {
  name         = "nhub-gcm-cred-api-key-secret"
  value        = var.rg_pri_nhb_ns_mob_nhb_gcm_credential_api_key
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_pri_nhb_ns_mob_nhb_gcm_credential_api_key"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "notification hub gcm credential api key"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_cmk_enc_kv_nhub_apns_cred_bundle_id_secret" {
  name         = "nhub-apns-cred-bundle-id-secret"
  value        = var.rg_pri_nhb_ns_mob_nhb_apns_credential_bundle_id
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_pri_nhb_ns_mob_nhb_apns_credential_bundle_id"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Notification Hub APNS Credential Bundle ID"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_cmk_enc_kv_nhub_apns_cred_key_secret" {
  name         = "nhub-apns-cred-key-secret"
  value        = var.rg_pri_nhb_ns_mob_nhb_apns_credential_key_id
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_pri_nhb_ns_mob_nhb_apns_credential_key_id"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Notification Hub APNS Credential Key"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_cmk_enc_kv_nhub_apns_cred_team_id_secret" {
  name         = "nhub-apns-cred-team-id-secret"
  value        = var.rg_pri_nhb_ns_mob_nhb_apns_credential_team_id
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_pri_nhb_ns_mob_nhb_apns_credential_team_id"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "notification hub apns credential team id"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_cmk_enc_kv_nhub_apns_cred_token_secret" {
  name         = "nhub-apns-cred-token-secret"
  value        = var.rg_pri_nhb_ns_mob_nhb_apns_credential_token
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_pri_nhb_ns_mob_nhb_apns_credential_token"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Notification Hub APNS Credential Token"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_pri_kvs_service_principals
  ]
}

## VeriChannel Secrets - START

resource "azurerm_key_vault_secret" "rg_pri_vc_app_d365_smtp_password_secret" {
  name         = "vc-app-d365-smtp-password-secret"
  value        = var.vc_app_d365_smtp_password_secret
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "D365 SMTP Password Secret"
    tf_var       = "vc_app_d365_smtp_password_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_pdf_converter_license_key_secret" {
  name         = "vc-app-pdf-converter-license-key-secret"
  value        = var.vc_app_pdf_converter_license_key_secret
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "PDF Converter License Key Secret"
    tf_var       = "vc_app_pdf_converter_license_key_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_rsa_private_key_secret" {
  name         = "vc-app-rsa-private-key-secret"
  value        = var.vc_app_rsa_private_key_secret
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "RSA Private Key Secret"
    tf_var       = "vc_app_rsa_private_key_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_rsa_public_key_modulus_secret" {
  name         = "vc-app-rsa-public-key-modulus-secret"
  value        = var.vc_app_rsa_public_key_modulus_secret
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "RSA Public Key Modulus Secret"
    tf_var       = "vc_app_rsa_public_key_modulus_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_crm_service_credentials_client_id_secret" {
  name         = "vc-app-crm-service-credentials-client-id-secret"
  value        = azuread_service_principal.aad_app_vt_d365_01_service_principal.client_id
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "CRM Service Credentials Client Id Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_crm_service_credentials_secret_key_secret" {
  name         = "vc-app-crm-service-credentials-secret-key-secret"
  value        = azuread_application_password.aad_app_vt_d365_01_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "CRM Service Credentials Secret Key Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_soft_otp_rsa_private_key_secret" {
  name         = "vc-app-soft-otp-rsa-private-key-secret"
  value        = var.vc_app_soft_otp_rsa_private_key_secret
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Soft Otp Rsa Private Key Secret"
    tf_var       = "vc_app_soft_otp_rsa_private_key_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_sinch_api_token_secret" {
  name         = "vc-app-sinch-api-token-secret"
  value        = var.vc_app_sinch_api_token_secret
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Sinch API Token Secret"
    tf_var       = "vc_app_sinch_api_token_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_azure_storage_token_secret" {
  name         = "vc-app-azure-storage-token-secret"
  value        = var.vc_app_azure_storage_token_secret
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Azure Storage Token Secret"
    tf_var       = "vc_app_azure_storage_token_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_vc_app_adcon_api_password_secret" {
  name         = "vc-app-adcon-api-password-secret"
  value        = var.vc_app_adcon_api_password_secret
  key_vault_id = azurerm_key_vault.rg_pri_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "ADCon API Password Secret"
    tf_var       = "vc_app_adcon_api_password_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_app_kv
  ]
}

## VeriChannel Secrets - END

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_rls_admin_username_secret" {
  name         = "ops-crd-rls-admin-username-secret"
  value        = var.rg_sec_rls_vm_os_profile_admin_username
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "TFVAR internal domain rls admin user name"
    tf_var      = "rg_sec_rls_vm_os_profile_admin_username"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_rls_admin_password_secret" {
  name         = "ops-crd-rls-admin-password-secret"
  value        = var.rg_sec_rls_vm_os_profile_admin_password
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "TFVAR internal domain rls admin user pwd"
    tf_var      = "rg_sec_rls_vm_os_profile_admin_password"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_sol_sql_administrator_username_secret" {
  name         = "ops-crd-sol-sql-administrator-username-secret"
  value        = var.rg_sec_sol_sql_administrator_login
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for aad_user_administrator_user_principal_name"
    tf_var      = "rg_sec_sol_sql_administrator_login"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
  ]
}

# resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_sol_sql_administrator_password_secret" {
#   name         = "ops-crd-sol-sql-administrator-password-secret"
#   value        = random_password.rg_sec_sol_sql_administrator_login.result
#   key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
#   content_type = local.kvs.content_type.text_plain

#   tags = {
#     company     = var.company_name_long
#     product     = local.product_name_long
#     region      = var.rg_sec_location_long
#     environment = var.environment_long
#     name        = "OPS Credential for aad_user_administrator_password"
#   }

#   depends_on = [
#     azurerm_key_vault.rg_sec_vm_ops_kv,
#   ]
# }

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_client_secret_02_secret" {
  name         = "ops-crd-client-secret-02-secret"
  value        = azuread_service_principal_password.aad_app_devops_service_principal_password_02.value
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for client_secret 02"
    tf_var      = "client_secret_02"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
  ]
}


resource "azurerm_key_vault_secret" "rg_sec_ops_kv_ops_crd_mobile_client_upn_secret" {
  name         = "ops-crd-mobile-client-upn-secret"
  value        = local.aad_user.mobile_client_upn
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for Mobile Client user name"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_ops_kv_ops_crd_mobile_client_password_secret" {
  name         = "ops-crd-mobile-client-password-secret"
  value        = random_password.mob_cli_aad_user_pass_01.result
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for Mobile Client password"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

# resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_mobile_client_appCenter_api_token_secret" {
#   name         = "ops-crd-mobile-client-appCenter-api-token-secret"
#   value        = var.app_center_rest_api_token
#   key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
#   content_type = local.kvs.content_type.text_plain

#   tags = {
#     company     = var.company_name_long
#     product     = local.product_name_long
#     region      = var.rg_sec_location_long
#     environment = var.environment_long
#     name        = "OPS Credential for Mobile Client AppCenter API Token"
#   }

#   depends_on = [
#     azurerm_key_vault.rg_sec_vm_ops_kv
#   ]
# }

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_sol_sql_server_fqdn_secret" {
  name         = "ops-crd-sol-sql-server-fqdn-secret"
  value        = azurerm_mssql_server.rg_sec_sol_sql.fully_qualified_domain_name
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for SQL Server FQDN"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_sql_server_admin_username_secret" {
  name         = "ops-crd-sql-server-admin-username-secret"
  value        = var.rg_sec_sql_admin_aad_user_01_username
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_sec_sql_admin_aad_user_01_username"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential Uesr for SQL Server Admin User"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_sql_server_admin_user_password_secret" {
  name         = "ops-crd-sql-server-admin-user-password-secret"
  value        = var.rg_sec_sql_admin_aad_user_01_password
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_sec_sql_admin_aad_user_01_password"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential Uesr for SQL Server Admin Password"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

# resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_vngc_shared_secret_key_secret" {
#   name         = "ops-crd-secret-vngc-shared-secret-key"
#   value        = var.rg_sec_ziraatag_vngc_shared_secret_key
#   key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
#   content_type = local.kvs.content_type.text_plain

#   tags = {
#     company     = var.company_name_long
#     product     = local.product_name_long
#     region      = var.rg_sec_location_long
#     environment = var.environment_long
#     name        = "Virtual Network Gateway Shared Key"
#     tf_var      = "rg_sec_ziraatag_vngc_shared_secret_key"
#   }

#   depends_on = [
#     azurerm_key_vault.rg_sec_vm_ops_kv,
#     azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
#   ]
# }

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_jmb_vm_admin_username_secret" {
  name         = "ops-crd-jmb-vm-admin-username-secret"
  value        = var.rg_sec_jmb_vm_os_profile_admin_username
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Jumpbox machine admin user name"
    tf_var      = "rg_sec_jmb_vm_os_profile_admin_username"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_jmb_vm_admin_user_password_secret" {
  name         = "ops-crd-jmb-vm-admin-user-password-secret"
  value        = var.rg_sec_jmb_vm_os_profile_admin_password
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Jumpbox machine admin user pwd"
    tf_var      = "rg_sec_jmb_vm_os_profile_admin_password"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
  ]
}


resource "azurerm_key_vault_secret" "rg_sec_ops_kv_ops_crd_aad_app_acr_push_service_principal_client_id_secret" {
  name         = "ops-crd-acr-push-sp-client-id-secret"
  value        = azuread_application.aad_app_acr_push.client_id
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for ACR Push Service Principal Client ID"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_ops_kv_ops_crd_aad_app_acr_push_service_principal_pwd_01_secret" {
  name         = "ops-crd-acr-push-sp-client-secret-secret"
  value        = azuread_service_principal_password.aad_app_acr_push_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for ACR Push Service Principal Client Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}


resource "azurerm_key_vault_secret" "rg_sec_ops_kv_ops_crd_aad_app_acr_pull_service_principal_client_id_secret" {
  name         = "ops-crd-acr-pull-sp-client-id-secret"
  value        = azuread_application.aad_app_acr_pull.object_id
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for ACR Pull Service Principal Client ID"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_ops_kv_ops_crd_aad_app_acr_pull_service_principal_pwd_01_secret" {
  name         = "ops-crd-acr-pull-sp-client-secret-secret"
  value        = azuread_service_principal_password.aad_app_acr_pull_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "OPS Credential for ACR Pull Service Principal Client Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

# resource "azurerm_key_vault_secret" "rg_sec_cmk_enc_kv_nhub_sas_secret" {
#   name = "nhub-crd-sas-secret"
#   value        = "Endpoint=sb://${azurerm_notification_hub_authorization_rule.rg_sec_nhb_auth_mob_nhb.namespace_name}.servicebus.windows.net/;SharedAccessKeyName=${azurerm_notification_hub_authorization_rule.rg_sec_nhb_auth_mob_nhb.name};SharedAccessKey=${azurerm_notification_hub_authorization_rule.rg_sec_nhb_auth_mob_nhb.primary_access_key}"
#   key_vault_id    = azurerm_key_vault.rg_sec_cmk_enc_kv.id
#   content_type = local.kvs.content_type.text_plain

#   tags = {
#     company     = var.company_name_long
#     product     = local.product_name_long
#     region      = var.rg_sec_location_long
#     environment = var.environment_long
#     name        = "Manager SAS keys for push notification"
#   }

#   depends_on = [
#     azurerm_notification_hub_namespace.rg_sec_nhb_ns_mob,
#     azurerm_notification_hub.rg_sec_nhb_ns_mob_nhb,
#     azurerm_notification_hub_authorization_rule.rg_sec_nhb_auth_mob_nhb,
#     azurerm_key_vault.rg_sec_cmk_enc_kv
#   ]
# }


# resource "azurerm_key_vault_secret" "rg_sec_ops_kv_ops_crd_aad_app_argo_cd_pwd_01_secret" {
#   name         = "ops-crd-aad-app-argocd-pwd-01-secret"
#   value        = azuread_application_password.reg_sec_aad_app_argo_cd_pwd_01.value
#   key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
#   content_type = local.kvs.content_type.text_plain

#   tags = {
#     company     = var.company_name_long
#     product     = local.product_name_long
#     region      = var.rg_sec_location_long
#     environment = var.environment_long
#     name        = "OPS Credential for ArgoCD Service Principal Password Client Secret"
#   }

#   depends_on = [
#     azurerm_key_vault.rg_sec_vm_ops_kv
#   ]
# }

resource "azurerm_key_vault_secret" "rg_sec_mon_ai_instrumentation_key_secret" {
  name         = "ops-crd-mon-ai-instrumentation-key-secret"
  value        = azurerm_application_insights.rg_pri_mon_ai.instrumentation_key
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Application Insights Instrumentation Key"
  }
}

resource "azurerm_key_vault_secret" "rg_sec_aad_app_vt_d365_01_service_principal_client_id_secret" {
  name         = "aad-app-vt-d365-01-sp-client-id-secret"
  value        = azuread_service_principal.aad_app_vt_d365_01_service_principal.client_id
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "DEV Env D365 Service Principal 01 Client ID"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_aad_app_vt_d365_01_service_principal_pwd_01_secret" {
  name         = "aad-app-vt-d365-01-sp-password-01-secret"
  value        = azuread_application_password.aad_app_vt_d365_01_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "DEV Env D365 Service Principal 01 Password 01"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_aad_app_vt_d365_02_service_principal_client_id_secret" {
  name         = "aad-app-vt-d365-02-sp-client-id-secret"
  value        = azuread_service_principal.aad_app_vt_d365_02_service_principal.client_id
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "DEV Env D365 02 Service Principal Client ID"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_aad_app_vt_d365_02_service_principal_pwd_01_secret" {
  name         = "aad-app-vt-d365-02-sp-password-01-secret"
  value        = azuread_application_password.aad_app_vt_d365_02_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "DEV Env D365 02 Service Principal Password 01"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_cmk_enc_kv_nhub_gcm_cred_api_key_secret" {
  name         = "nhub-gcm-cred-api-key-secret"
  value        = var.rg_sec_nhb_ns_mob_nhb_gcm_credential_api_key
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_sec_nhb_ns_mob_nhb_gcm_credential_api_key"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "notification hub gcm credential api key"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_cmk_enc_kv_nhub_apns_cred_bundle_id_secret" {
  name         = "nhub-apns-cred-bundle-id-secret"
  value        = var.rg_sec_nhb_ns_mob_nhb_apns_credential_bundle_id
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_sec_nhb_ns_mob_nhb_apns_credential_bundle_id"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Notification Hub APNS Credential Bundle ID"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_cmk_enc_kv_nhub_apns_cred_key_secret" {
  name         = "nhub-apns-cred-key-secret"
  value        = var.rg_sec_nhb_ns_mob_nhb_apns_credential_key_id
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_sec_nhb_ns_mob_nhb_apns_credential_key_id"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Notification Hub APNS Credential Key"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_cmk_enc_kv_nhub_apns_cred_team_id_secret" {
  name         = "nhub-apns-cred-team-id-secret"
  value        = var.rg_sec_nhb_ns_mob_nhb_apns_credential_team_id
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_sec_nhb_ns_mob_nhb_apns_credential_team_id"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "notification hub apns credential team id"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_cmk_enc_kv_nhub_apns_cred_token_secret" {
  name         = "nhub-apns-cred-token-secret"
  value        = var.rg_sec_nhb_ns_mob_nhb_apns_credential_token
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "rg_sec_nhb_ns_mob_nhb_apns_credential_token"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Notification Hub APNS Credential Token"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_cmk_enc_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_hq_prod_vngc_shared_secret_key_secret" {
  name         = "ops-crd-secret-hq-prod-vngc-shared-secret-key"
  value        = var.rg_sec_ziraatag_hq_prod_lng_vng_con_shared_secret_key
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Virtual Network Gateway Shared Key"
    tf_var      = "rg_sec_ziraatag_hq_prod_lng_vng_con_shared_secret_key"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_hq_bck_vngc_shared_secret_key_secret" {
  name         = "ops-crd-secret-hq-bck-vngc-shared-secret-key"
  value        = var.rg_sec_ziraatag_hq_bck_lng_vng_con_shared_secret_key
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Virtual Network Gateway Shared Key"
    tf_var      = "rg_sec_ziraatag_hq_bck_lng_vng_con_shared_secret_key"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vm_ops_kv_ops_crd_drc_vngc_shared_secret_key_secret" {
  name         = "ops-crd-secret-drc-vngc-shared-secret-key"
  value        = var.rg_sec_ziraatag_drc_lng_vng_con_shared_secret_key
  key_vault_id = azurerm_key_vault.rg_sec_vm_ops_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Virtual Network Gateway Shared Key"
    tf_var      = "rg_sec_ziraatag_drc_lng_vng_con_shared_secret_key"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_vm_ops_kv,
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

## VeriChannel Secrets - START

resource "azurerm_key_vault_secret" "rg_sec_vc_app_d365_smtp_password_secret" {
  name         = "vc-app-d365-smtp-password-secret"
  value        = var.vc_app_d365_smtp_password_secret
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "D365 SMTP Password Secret"
    tf_var       = "vc_app_d365_smtp_password_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_pdf_converter_license_key_secret" {
  name         = "vc-app-pdf-converter-license-key-secret"
  value        = var.vc_app_pdf_converter_license_key_secret
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "PDF Converter License Key Secret"
    tf_var       = "vc_app_pdf_converter_license_key_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_rsa_private_key_secret" {
  name         = "vc-app-rsa-private-key-secret"
  value        = var.vc_app_rsa_private_key_secret
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "RSA Private Key Secret"
    tf_var       = "vc_app_rsa_private_key_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_rsa_public_key_modulus_secret" {
  name         = "vc-app-rsa-public-key-modulus-secret"
  value        = var.vc_app_rsa_public_key_modulus_secret
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "RSA Public Key Modulus Secret"
    tf_var       = "vc_app_rsa_public_key_modulus_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_crm_service_credentials_client_id_secret" {
  name         = "vc-app-crm-service-credentials-client-id-secret"
  value        = azuread_service_principal.aad_app_vt_d365_01_service_principal.client_id
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "CRM Service Credentials Client Id Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_crm_service_credentials_secret_key_secret" {
  name         = "vc-app-crm-service-credentials-secret-key-secret"
  value        = azuread_application_password.aad_app_vt_d365_01_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "CRM Service Credentials Secret Key Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_soft_otp_rsa_private_key_secret" {
  name         = "vc-app-soft-otp-rsa-private-key-secret"
  value        = var.vc_app_soft_otp_rsa_private_key_secret
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Soft Otp Rsa Private Key Secret"
    tf_var       = "vc_app_soft_otp_rsa_private_key_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_sinch_api_token_secret" {
  name         = "vc-app-sinch-api-token-secret"
  value        = var.vc_app_sinch_api_token_secret
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Sinch API Token Secret"
    tf_var       = "vc_app_sinch_api_token_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_azure_storage_token_secret" {
  name         = "vc-app-azure-storage-token-secret"
  value        = var.vc_app_azure_storage_token_secret
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Azure Storage Token Secret"
    tf_var       = "vc_app_azure_storage_token_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_vc_app_adcon_api_password_secret" {
  name         = "vc-app-adcon-api-password-secret"
  value        = var.vc_app_adcon_api_password_secret
  key_vault_id = azurerm_key_vault.rg_sec_app_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "ADCon API Password Secret"
    tf_var       = "vc_app_adcon_api_password_secret"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_app_kv
  ]
}

## VeriChannel Secrets - END
# ## Certificates

resource "azurerm_key_vault_secret" "rg_pri_agw_kv_wef_cert_value_secret" {
  name         = "wef-cert-value-secret"
  value        = var.wef_cert_value
  key_vault_id = azurerm_key_vault.rg_pri_agw_kv.id
  content_type = local.kvs.content_type.private_cert

  tags = {
    tf_var      = "wef_cert_value"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate Value for Ziraat DE"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_agw_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_agw_kv_wef_cert_password_secret" {
  name         = "wef-cert-password-secret"
  value        = var.wef_cert_password
  key_vault_id = azurerm_key_vault.rg_pri_agw_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "wef_cert_password"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate Password for Ziraat DE"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_agw_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_agw_kv_wif_cert_value_secret" {
  name         = "wif-cert-value-secret"
  value        = var.wif_cert_value
  key_vault_id = azurerm_key_vault.rg_pri_agw_kv.id
  content_type = local.kvs.content_type.private_cert

  tags = {
    tf_var      = "wif_cert_value"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate Value for Ziraat DE"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_agw_kv
  ]
}
 
resource "azurerm_key_vault_secret" "rg_pri_agw_kv_wif_cert_password_secret" {
  name         = "wif-cert-password-secret"
  value        = var.wif_cert_password
  key_vault_id = azurerm_key_vault.rg_pri_agw_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "wif_cert_password"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Pass for Ziraat DE"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_agw_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_kub_kv_argo_cert_value_secret" {
  name         = "argo-cert-value-secret"
  value        = var.argo_cert_value
  key_vault_id = azurerm_key_vault.rg_pri_kub_kv.id
  content_type = local.kvs.content_type.private_cert

  tags = {
    tf_var      = "argo_cert_value"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate Value for ARGO CD"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_kub_kv
  ]
}
 
resource "azurerm_key_vault_secret" "rg_pri_kub_kv_argo_cert_password_secret" {
  name         = "argo-cert-password-secret"
  value        = var.argo_cert_password
  key_vault_id = azurerm_key_vault.rg_pri_kub_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "argo_cert_password"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Pass for ARGO CD"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_kub_kv
  ]
}


resource "azurerm_key_vault_secret" "rg_pri_auto_kv_d365_availability_check_client_id_secret" {
  name         = "d365-availability-check-client-id-secret"
  value        = azuread_service_principal.aad_app_vt_d365_01_service_principal.client_id
  key_vault_id = azurerm_key_vault.rg_pri_auto_kv.id 
  content_type = "text/plain"

  tags = {
    company     = var.company_name_long
    product     = var.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "D365 Availability Check Client Id Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_auto_kv, 
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_auto_kv_d365_availability_check_client_secret_secret" {
  name         = "d365-availability-check-client-secret-secret"
  value        = azuread_application_password.aad_app_vt_d365_01_service_principal_pwd_01.value
  key_vault_id = azurerm_key_vault.rg_pri_auto_kv.id
  content_type = "text/plain"

  tags = {
    company     = var.company_name_long
    product     = var.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "D365 Availability Check Client Secret Secret"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_auto_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_pri_auto_kv_customer_d365_org_url_secret" {
  name         = "customer-d365-org-url-secret"
  value        = var.customer_d365_org_url
  key_vault_id = azurerm_key_vault.rg_pri_auto_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Customer D365 Organization URL"
    tf_var      = "customer_d365_org_url"
  }

  depends_on = [
    azurerm_key_vault.rg_pri_auto_kv
  ]
}


#--

resource "azurerm_key_vault_secret" "rg_sec_agw_kv_wef_cert_value_secret" {
  name         = "wef-cert-value-secret"
  value        = var.wef_cert_value
  key_vault_id = azurerm_key_vault.rg_sec_agw_kv.id
  content_type = local.kvs.content_type.private_cert

  tags = {
    tf_var      = "wef_cert_value"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate Value for Ziraat DE"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_agw_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_agw_kv_wef_cert_password_secret" {
  name         = "wef-cert-password-secret"
  value        = var.wef_cert_password
  key_vault_id = azurerm_key_vault.rg_sec_agw_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "wef_cert_password"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate Password for Ziraat DE"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_agw_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_agw_kv_wif_cert_value_secret" {
  name         = "wif-cert-value-secret"
  value        = var.wif_cert_value
  key_vault_id = azurerm_key_vault.rg_sec_agw_kv.id
  content_type = local.kvs.content_type.private_cert

  tags = {
    tf_var      = "wif_cert_value"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate Value for Ziraat DE"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_agw_kv
  ]
}
 
resource "azurerm_key_vault_secret" "rg_sec_agw_kv_wif_cert_password_secret" {
  name         = "wif-cert-password-secret"
  value        = var.wif_cert_password
  key_vault_id = azurerm_key_vault.rg_sec_agw_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "wif_cert_password"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Pass for Ziraat DE"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_agw_kv
  ]
}

resource "azurerm_key_vault_secret" "rg_sec_kub_kv_argo_cert_value_secret" {
  name         = "argo-cert-value-secret"
  value        = var.argo_cert_value
  key_vault_id = azurerm_key_vault.rg_sec_kub_kv.id
  content_type = local.kvs.content_type.private_cert

  tags = {
    tf_var      = "argo_cert_value"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate Value for ARGO CD"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_kub_kv
  ]
}
 
resource "azurerm_key_vault_secret" "rg_sec_kub_kv_argo_cert_password_secret" {
  name         = "argo-cert-password-secret"
  value        = var.argo_cert_password
  key_vault_id = azurerm_key_vault.rg_sec_kub_kv.id
  content_type = local.kvs.content_type.text_plain

  tags = {
    tf_var      = "argo_cert_password"
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Pass for ARGO CD"
  }

  depends_on = [
    azurerm_key_vault.rg_sec_kub_kv
  ]
}