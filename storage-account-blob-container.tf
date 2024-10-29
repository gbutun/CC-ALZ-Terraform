locals {
  sa_container = {
    access_type = {
      blob      = "blob"
      container = "container"
      private   = "private"
    }
  }
}

#TODO: add the necessary containers for VeriLink
resource "azurerm_storage_container" "rg_pri_log_sa_log_cn" {
  name                  = "log-cn"
  storage_account_name  = azurerm_storage_account.rg_pri_log_sa.name
  container_access_type = local.sa_container.access_type.private
}
resource "azurerm_storage_container" "rg_pri_log_sa_ai_cn" {
  name                  = "ai-cn"
  storage_account_name  = azurerm_storage_account.rg_pri_log_sa.name
  container_access_type = local.sa_container.access_type.private
}
resource "azurerm_storage_container" "rg_pri_log_sa_vln_ass_cn" {
  name                  = "sql-vln-ass-cn"
  storage_account_name  = azurerm_storage_account.rg_pri_log_sa.name
  container_access_type = local.sa_container.access_type.private
}
resource "azurerm_storage_container" "rg_pri_tfs_sa_tf_st_cn" {
  name                  = "tfstate-cn"
  storage_account_name  = azurerm_storage_account.rg_pri_tfs_sa.name
  container_access_type = local.sa_container.access_type.private
}
resource "azurerm_storage_container" "rg_pri_pub_sa_vc_pub_fs" {
  name                  = "vc-pub-fs"
  storage_account_name  = azurerm_storage_account.rg_pri_pub_sa.name
  container_access_type = local.sa_container.access_type.container
}

resource "azurerm_storage_container" "rg_pri_rls_sa_ops_art_vc" {
  name                  = "ops-art-vc"
  storage_account_name  = azurerm_storage_account.rg_pri_rls_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_pri_rls_sa_ops_stp" {
  name                  = "ops-stp"
  storage_account_name  = azurerm_storage_account.rg_pri_rls_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_pri_rls_sa_ops_art_vc_db" {
  name                  = "ops-art-vc-db"
  storage_account_name  = azurerm_storage_account.rg_pri_rls_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_pri_rls_sa_ops_art_infra" {
  name                  = "ops-art-infra"
  storage_account_name  = azurerm_storage_account.rg_pri_rls_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_pri_rls_sa_ops_tf_out" {
  name                  = "ops-tf-out"
  storage_account_name  = azurerm_storage_account.rg_pri_rls_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_pri_rls_sa_ops_art_infra_rot" {
  name                  = "ops-art-infra-rot"
  storage_account_name  = azurerm_storage_account.rg_pri_rls_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_pri_log_sa_rls_vm_cn" {
  name                  = "rls-vm-cn"
  storage_account_name  = azurerm_storage_account.rg_pri_log_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_pri_mal_scn_sa_file_cn" {
  name                  = "file-cn"
  storage_account_name  = azurerm_storage_account.rg_pri_mal_scn_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_pri_mal_scn_sa_migration_cn" {
  name                  = "migration-cn"
  storage_account_name  = azurerm_storage_account.rg_pri_mal_scn_sa.name
  container_access_type = local.sa_container.access_type.private
}

#--


resource "azurerm_storage_container" "rg_sec_log_sa_log_cn" {
  name                  = "log-cn"
  storage_account_name  = azurerm_storage_account.rg_sec_log_sa.name
  container_access_type = local.sa_container.access_type.private
}
resource "azurerm_storage_container" "rg_sec_log_sa_ai_cn" {
  name                  = "ai-cn"
  storage_account_name  = azurerm_storage_account.rg_sec_log_sa.name
  container_access_type = local.sa_container.access_type.private
}
resource "azurerm_storage_container" "rg_sec_log_sa_vln_ass_cn" {
  name                  = "sql-vln-ass-cn"
  storage_account_name  = azurerm_storage_account.rg_sec_log_sa.name
  container_access_type = local.sa_container.access_type.private
}

resource "azurerm_storage_container" "rg_sec_log_sa_rls_vm_cn" {
  name                  = "rls-vm-cn"
  storage_account_name  = azurerm_storage_account.rg_sec_log_sa.name
  container_access_type = local.sa_container.access_type.private
}