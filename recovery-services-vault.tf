resource "azurerm_recovery_services_vault" "rg_pri_rsv" {
  name                         = "${local.resource_prefix_rg_pri}-rsv-${var.product_unique}"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  location                     = azurerm_resource_group.rg_pri.location
  sku                          = var.rg_pri_rsv_sku
  soft_delete_enabled          = true
  storage_mode_type            = "GeoRedundant"
  cross_region_restore_enabled = true
  encryption {
    key_id                            = azurerm_key_vault_key.rg_pri_cmk_enc_kv_vlt_enc_key.id
    infrastructure_encryption_enabled = true
  }

  identity {
    type = local.resource_identity_type.system_assigned
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Recovery Services Vault 1.1"
  }
}

#-----

resource "azurerm_recovery_services_vault" "rg_sec_rsv" {
  name                         = "${local.resource_prefix_rg_sec}-rsv-${var.product_unique}"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  location                     = azurerm_resource_group.rg_sec.location
  sku                          = var.rg_sec_rsv_sku
  soft_delete_enabled          = true
  storage_mode_type            = "GeoRedundant"
  cross_region_restore_enabled = true

  encryption {
    key_id                            = data.azurerm_key_vault_key.rg_sec_cmk_enc_kv_vlt_enc_key.id
    infrastructure_encryption_enabled = true
  }

  identity {
    type = local.resource_identity_type.system_assigned
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Recovery Services Vault 1.2"
  }
}
