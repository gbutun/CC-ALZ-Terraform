#TODO : Uncomment and provision the certificates when  certificates are provided.

locals {

  key_vault_key_props = {
    sa_sse = {
      key_type = "RSA"
      key_size = 2048
      key_opts = ["unwrapKey", "wrapKey"]
    }

    tfs_enc = {
      key_type = "RSA"
      key_size = 2048
      key_opts = ["unwrapKey", "wrapKey", "decrypt", "encrypt", "sign", "verify"]
    }

    sql_tde = {
      key_type = "RSA"
      key_size = 2048
      key_opts = ["unwrapKey", "wrapKey"]
    }

    vm_dsk_enc = {
      key_type = "RSA"
      key_size = 4096
      key_opts = ["decrypt", "encrypt", "unwrapKey", "wrapKey", "sign", "verify"]
    }


    aks_node_dsk_enc = {
      key_type = "RSA"
      key_size = 2048
      key_opts = ["decrypt", "encrypt", "unwrapKey", "wrapKey"]
    }


    adf_cmk = {
      key_type = "RSA"
      key_size = 2048
      key_opts = ["unwrapKey", "wrapKey"]
    }

    rsv_enc = {
      key_type = "RSA"
      key_size = 2048
      key_opts = ["decrypt", "encrypt", "unwrapKey", "wrapKey"]
    }
    acr_sse = {
      key_type = "RSA"
      key_size = 2048
      key_opts = ["decrypt", "encrypt", "unwrapKey", "wrapKey"]
    }

  }
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_log_sa_sse_key" {
  name         = "log-sa-sse-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.sa_sse.key_type
  key_size     = local.key_vault_key_props.sa_sse.key_size
  key_opts     = local.key_vault_key_props.sa_sse.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSE Key of Azure Storage 1"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_rls_sa_sse_key" {
  name         = "rls-sa-sse-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.sa_sse.key_type
  key_size     = local.key_vault_key_props.sa_sse.key_size
  key_opts     = local.key_vault_key_props.sa_sse.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSE Key of Azure Storage 2"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}


resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_biz_log_sa_sse_key" {
  name         = "biz-log-sa-sse-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.sa_sse.key_type
  key_size     = local.key_vault_key_props.sa_sse.key_size
  key_opts     = local.key_vault_key_props.sa_sse.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSE Key of Azure Storage 3"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_tfs_sa_sse_key" {
  name         = "tfs-sa-sse-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.sa_sse.key_type
  key_size     = local.key_vault_key_props.sa_sse.key_size
  key_opts     = local.key_vault_key_props.sa_sse.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSE Key of Azure Storage 4"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_pub_sa_sse_key" {
  name         = "pub-sa-sse-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.sa_sse.key_type
  key_size     = local.key_vault_key_props.sa_sse.key_size
  key_opts     = local.key_vault_key_props.sa_sse.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSE Key of Azure Storage 5"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_apc_log_sa_sse_key" {
  name         = "apc-log-sa-sse-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.sa_sse.key_type
  key_size     = local.key_vault_key_props.sa_sse.key_size
  key_opts     = local.key_vault_key_props.sa_sse.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSE Key of Azure Storage 6"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_sol_sql_tde_key_01" {
  name         = "sol-sql-tde-key-01"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.sql_tde.key_type
  key_size     = local.key_vault_key_props.sql_tde.key_size
  key_opts     = local.key_vault_key_props.sql_tde.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "TDE Key of Azure SQL Server 1"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_vlt_enc_key" {
  name         = "rsv-enc-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.rsv_enc.key_type
  key_size     = local.key_vault_key_props.rsv_enc.key_size
  key_opts     = local.key_vault_key_props.rsv_enc.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Encryption Key of Azure Recovery Services Vault"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_rg_pri_rls_vm_dsk_enc_key" {
  name         = "rls-vm-dsk-enc-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.vm_dsk_enc.key_type
  key_size     = local.key_vault_key_props.vm_dsk_enc.key_size
  key_opts     = local.key_vault_key_props.vm_dsk_enc.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Release Server VM Disk Encryption Key"
  }
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_rg_pri_jmb_vm_dsk_enc_key" {
  name         = "jmb-vm-dsk-enc-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.vm_dsk_enc.key_type
  key_size     = local.key_vault_key_props.vm_dsk_enc.key_size
  key_opts     = local.key_vault_key_props.vm_dsk_enc.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Jumpbox VM Disk Encryption Key"
  }
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_acr_enc_sse_key" {
  name         = "acr-enc-sse-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.acr_sse.key_type
  key_size     = local.key_vault_key_props.acr_sse.key_size
  key_opts     = local.key_vault_key_props.acr_sse.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Azure Container Registry encryption key"
  }
}

resource "azurerm_key_vault_key" "rg_pri_tfv_kv_enc_key" {
  name         = "tfv-enc-key"
  key_vault_id = azurerm_key_vault.rg_pri_tfv_kv.id
  key_type     = local.key_vault_key_props.tfs_enc.key_type
  key_size     = local.key_vault_key_props.tfs_enc.key_size
  key_opts     = local.key_vault_key_props.tfs_enc.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Terraform state file encryption key"
  }
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_aks_node_dsk_enc_key" {
  name         = "aks-node-dsk-enc-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.aks_node_dsk_enc.key_type
  key_size     = local.key_vault_key_props.aks_node_dsk_enc.key_size
  key_opts     = local.key_vault_key_props.aks_node_dsk_enc.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Disk Encryption Key of AKS Nodes"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

resource "azurerm_key_vault_key" "rg_pri_cmk_enc_kv_mal_scn_sa_sse_key" {
  name         = "mal-scn-sa-sse-key"
  key_vault_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
  key_type     = local.key_vault_key_props.sa_sse.key_type
  key_size     = local.key_vault_key_props.sa_sse.key_size
  key_opts     = local.key_vault_key_props.sa_sse.key_opts

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSE Key of Malware Scan Storage"
  }

  depends_on = [azurerm_key_vault_access_policy.rg_pri_kvs_service_principals]
}

#--

data "azurerm_key_vault_key" "rg_sec_cmk_enc_kv_log_sa_sse_key" {
  name         = azurerm_key_vault_key.rg_pri_cmk_enc_kv_log_sa_sse_key.name
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
}

data "azurerm_key_vault_key" "rg_sec_cmk_enc_kv_sol_sql_tde_key_01" {
  name         = azurerm_key_vault_key.rg_pri_cmk_enc_kv_sol_sql_tde_key_01.name
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
}

data "azurerm_key_vault_key" "rg_sec_cmk_enc_kv_vlt_enc_key" {
  name         = azurerm_key_vault_key.rg_pri_cmk_enc_kv_vlt_enc_key.name
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
}

data "azurerm_key_vault_key" "rg_sec_cmk_enc_kv_aks_node_dsk_enc_key" {
  name         = azurerm_key_vault_key.rg_pri_cmk_enc_kv_aks_node_dsk_enc_key.name
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
}

data "azurerm_key_vault_key" "rg_sec_cmk_enc_kv_acr_enc_sse_key" {
  name         = azurerm_key_vault_key.rg_pri_cmk_enc_kv_acr_enc_sse_key.name
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
}

data "azurerm_key_vault_key" "rg_sec_cmk_enc_kv_biz_log_sa_sse_key" {
  name         = azurerm_key_vault_key.rg_pri_cmk_enc_kv_biz_log_sa_sse_key.name
  key_vault_id = azurerm_key_vault.rg_sec_cmk_enc_kv.id
}

resource "null_resource" "rg_sec_cmk_enc_kv_log_sa_sse_key" {
  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-key-vault-backup-restore-key.ps1"

    environment = {
      use_msi               = false
      subscription_id       = var.subscription_id
      client_id             = var.client_id
      client_secret         = var.client_secret
      tenant_id             = var.tenant_id
      temps_path            = local.temps_path
      source_key_vault_name = azurerm_key_vault.rg_pri_cmk_enc_kv.name
      source_key_name       = azurerm_key_vault_key.rg_pri_cmk_enc_kv_log_sa_sse_key.name
      target_key_vault_name = azurerm_key_vault.rg_sec_cmk_enc_kv.name
      is_logger_enabled     = true
    }
  }

  triggers = {
    run_id = 1
  }

  depends_on = [
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "null_resource" "rg_sec_cmk_enc_kv_sol_sql_tde_key_01" {
  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-key-vault-backup-restore-key.ps1"

    environment = {
      use_msi               = false
      subscription_id       = var.subscription_id
      client_id             = var.client_id
      client_secret         = var.client_secret
      tenant_id             = var.tenant_id
      temps_path            = local.temps_path
      source_key_vault_name = azurerm_key_vault.rg_pri_cmk_enc_kv.name
      source_key_name       = azurerm_key_vault_key.rg_pri_cmk_enc_kv_sol_sql_tde_key_01.name
      target_key_vault_name = azurerm_key_vault.rg_sec_cmk_enc_kv.name
      is_logger_enabled     = true
    }
  }

  triggers = {
    run_id = 1
  }

  depends_on = [
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "null_resource" "rg_sec_cmk_enc_kv_vlt_enc_key" {
  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-key-vault-backup-restore-key.ps1"

    environment = {
      use_msi               = false
      subscription_id       = var.subscription_id
      client_id             = var.client_id
      client_secret         = var.client_secret
      tenant_id             = var.tenant_id
      temps_path            = local.temps_path
      source_key_vault_name = azurerm_key_vault.rg_pri_cmk_enc_kv.name
      source_key_name       = azurerm_key_vault_key.rg_pri_cmk_enc_kv_vlt_enc_key.name
      target_key_vault_name = azurerm_key_vault.rg_sec_cmk_enc_kv.name
      is_logger_enabled     = true
    }
  }

  triggers = {
    run_id = 1
  }

  depends_on = [
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "null_resource" "rg_sec_cmk_enc_kv_aks_node_dsk_enc_key" {
  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-key-vault-backup-restore-key.ps1"

    environment = {
      use_msi               = false
      subscription_id       = var.subscription_id
      client_id             = var.client_id
      client_secret         = var.client_secret
      tenant_id             = var.tenant_id
      temps_path            = local.temps_path
      source_key_vault_name = azurerm_key_vault.rg_pri_cmk_enc_kv.name
      source_key_name       = azurerm_key_vault_key.rg_pri_cmk_enc_kv_aks_node_dsk_enc_key.name
      target_key_vault_name = azurerm_key_vault.rg_sec_cmk_enc_kv.name
      is_logger_enabled     = true
    }
  }

  triggers = {
    run_id = 2
  }

  depends_on = [
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "null_resource" "rg_sec_cmk_enc_kv_acr_enc_sse_key" {
  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-key-vault-backup-restore-key.ps1"

    environment = {
      use_msi               = false
      subscription_id       = var.subscription_id
      client_id             = var.client_id
      client_secret         = var.client_secret
      tenant_id             = var.tenant_id
      temps_path            = local.temps_path
      source_key_vault_name = azurerm_key_vault.rg_pri_cmk_enc_kv.name
      source_key_name       = azurerm_key_vault_key.rg_pri_cmk_enc_kv_acr_enc_sse_key.name
      target_key_vault_name = azurerm_key_vault.rg_sec_cmk_enc_kv.name
      is_logger_enabled     = true
    }
  }

  triggers = {
    run_id = 2
  }

  depends_on = [
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}

resource "null_resource" "rg_sec_cmk_enc_kv_biz_log_sa_sse_key" {
  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-key-vault-backup-restore-key.ps1"

    environment = {
      use_msi               = false
      subscription_id       = var.subscription_id
      client_id             = var.client_id
      client_secret         = var.client_secret
      tenant_id             = var.tenant_id
      temps_path            = local.temps_path
      source_key_vault_name = azurerm_key_vault.rg_pri_cmk_enc_kv.name
      source_key_name       = azurerm_key_vault_key.rg_pri_cmk_enc_kv_biz_log_sa_sse_key.name
      target_key_vault_name = azurerm_key_vault.rg_sec_cmk_enc_kv.name
      is_logger_enabled     = true
    }
  }

  triggers = {
    run_id = 1
  }

  depends_on = [
    azurerm_key_vault_access_policy.rg_sec_kvs_service_principals
  ]
}