locals {
  sa_blob = {
    type = {
      append = "Append",
      block  = "Block",
      page   = "Page"
    }
    default_parallelism = {
      html = 1
    }
  }
}

resource "azurerm_storage_blob" "rg_pri_pub_sa_vc_pub_fs_vc_st_err_pg" {
  name                   = "maintenance.html"
  storage_account_name   = azurerm_storage_account.rg_pri_pub_sa.name
  storage_container_name = azurerm_storage_container.rg_pri_pub_sa_vc_pub_fs.name
  type                   = local.sa_blob.type.block
  parallelism            = local.sa_blob.default_parallelism.html

  source = "${local.blobs_path}/${azurerm_storage_account.rg_pri_pub_sa.name}/maintenance.html"
  lifecycle {
    ignore_changes = [source]
  }
}

resource "azurerm_storage_blob" "rg_pri_pub_sa_vc_pub_fs_vc_st_404_err_pg" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.rg_pri_pub_sa.name
  storage_container_name = azurerm_storage_container.rg_pri_pub_sa_vc_pub_fs.name
  type                   = local.sa_blob.type.block
  parallelism            = local.sa_blob.default_parallelism.html

  source = "${local.blobs_path}/${azurerm_storage_account.rg_pri_pub_sa.name}/404.html"
  lifecycle {
    ignore_changes = [source]
  }
}