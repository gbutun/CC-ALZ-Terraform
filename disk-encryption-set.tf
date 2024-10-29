resource "azurerm_disk_encryption_set" "rg_pri_aks_node_dsk_enc_set" {
  name                = "${local.resource_prefix_rg_pri}-aks-node-dsk-es-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location
  key_vault_key_id    = azurerm_key_vault_key.rg_pri_cmk_enc_kv_aks_node_dsk_enc_key.id

  auto_key_rotation_enabled = false

  identity {
    type = local.resource_identity_type.system_assigned
  }
}

#--

resource "azurerm_disk_encryption_set" "rg_sec_aks_node_dsk_enc_set" {
  name                = "${local.resource_prefix_rg_sec}-aks-node-dsk-es-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location
  key_vault_key_id    = data.azurerm_key_vault_key.rg_sec_cmk_enc_kv_aks_node_dsk_enc_key.id

  auto_key_rotation_enabled = false

  identity {
    type = local.resource_identity_type.system_assigned
  }
}
