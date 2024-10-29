
resource "azurerm_virtual_network_gateway_connection" "rg_pri_ziraatag_hq_prod_lng_vng_con" {
  name = "${local.resource_prefix_rg_pri}-ziraatag-hq-prod-vng-con-${var.product_unique}"

  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.rg_pri_vpn_vng.id
  local_network_gateway_id   = azurerm_local_network_gateway.rg_pri_ziraatag_hq_prod_lng.id

  shared_key = var.rg_pri_ziraatag_hq_prod_lng_vng_con_shared_secret_key

  ipsec_policy {
    dh_group         = var.rg_pri_ziraatag_vngc_policy_dh_group
    ike_encryption   = var.rg_pri_ziraatag_vngc_policy_ike_encryption
    ike_integrity    = var.rg_pri_ziraatag_vngc_policy_ike_integrity
    ipsec_encryption = var.rg_pri_ziraatag_vngc_policy_ipsec_encryption
    ipsec_integrity  = var.rg_pri_ziraatag_vngc_policy_ipsec_integrity
    pfs_group        = var.rg_pri_ziraatag_vngc_policy_pfs_group
    sa_lifetime      = var.rg_pri_ziraatag_vngc_policy_sa_lifetime_sec
    sa_datasize      = var.rg_pri_ziraatag_vngc_policy_sa_datasize_kb
  }
}

resource "azurerm_virtual_network_gateway_connection" "rg_pri_ziraatag_hq_bck_lng_vng_con" {
  name = "${local.resource_prefix_rg_pri}-ziraatag-hq-bck-vng-con-${var.product_unique}"

  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.rg_pri_vpn_vng.id
  local_network_gateway_id   = azurerm_local_network_gateway.rg_pri_ziraatag_hq_bck_lng.id

  shared_key = var.rg_pri_ziraatag_hq_bck_lng_vng_con_shared_secret_key

  ipsec_policy {
    dh_group         = var.rg_pri_ziraatag_vngc_policy_dh_group
    ike_encryption   = var.rg_pri_ziraatag_vngc_policy_ike_encryption
    ike_integrity    = var.rg_pri_ziraatag_vngc_policy_ike_integrity
    ipsec_encryption = var.rg_pri_ziraatag_vngc_policy_ipsec_encryption
    ipsec_integrity  = var.rg_pri_ziraatag_vngc_policy_ipsec_integrity
    pfs_group        = var.rg_pri_ziraatag_vngc_policy_pfs_group
    sa_lifetime      = var.rg_pri_ziraatag_vngc_policy_sa_lifetime_sec
    sa_datasize      = var.rg_pri_ziraatag_vngc_policy_sa_datasize_kb
  }
}

resource "azurerm_virtual_network_gateway_connection" "rg_pri_ziraatag_drc_lng_vng_con" {
  name = "${local.resource_prefix_rg_pri}-ziraatag-drc-vng-con-${var.product_unique}"

  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.rg_pri_vpn_vng.id
  local_network_gateway_id   = azurerm_local_network_gateway.rg_pri_ziraatag_drc_lng.id

  shared_key = var.rg_pri_ziraatag_drc_lng_vng_con_shared_secret_key

  ipsec_policy {
    dh_group         = var.rg_pri_ziraatag_vngc_policy_dh_group
    ike_encryption   = var.rg_pri_ziraatag_vngc_policy_ike_encryption
    ike_integrity    = var.rg_pri_ziraatag_vngc_policy_ike_integrity
    ipsec_encryption = var.rg_pri_ziraatag_vngc_policy_ipsec_encryption
    ipsec_integrity  = var.rg_pri_ziraatag_vngc_policy_ipsec_integrity
    pfs_group        = var.rg_pri_ziraatag_vngc_policy_pfs_group
    sa_lifetime      = var.rg_pri_ziraatag_vngc_policy_sa_lifetime_sec
    sa_datasize      = var.rg_pri_ziraatag_vngc_policy_sa_datasize_kb
  }
}

#--

resource "azurerm_virtual_network_gateway_connection" "rg_sec_ziraatag_hq_prod_lng_vng_con" {
  name = "${local.resource_prefix_rg_sec}-ziraatag-hq-prod-vng-con-${var.product_unique}"

  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.rg_sec_vpn_vng.id
  local_network_gateway_id   = azurerm_local_network_gateway.rg_sec_ziraatag_hq_prod_lng.id

  shared_key = var.rg_sec_ziraatag_hq_prod_lng_vng_con_shared_secret_key

  ipsec_policy {
    dh_group         = var.rg_sec_ziraatag_vngc_policy_dh_group
    ike_encryption   = var.rg_sec_ziraatag_vngc_policy_ike_encryption
    ike_integrity    = var.rg_sec_ziraatag_vngc_policy_ike_integrity
    ipsec_encryption = var.rg_sec_ziraatag_vngc_policy_ipsec_encryption
    ipsec_integrity  = var.rg_sec_ziraatag_vngc_policy_ipsec_integrity
    pfs_group        = var.rg_sec_ziraatag_vngc_policy_pfs_group
    sa_lifetime      = var.rg_sec_ziraatag_vngc_policy_sa_lifetime_sec
    sa_datasize      = var.rg_sec_ziraatag_vngc_policy_sa_datasize_kb
  }
}

resource "azurerm_virtual_network_gateway_connection" "rg_sec_ziraatag_hq_bck_lng_vng_con" {
  name = "${local.resource_prefix_rg_sec}-ziraatag-hq-bck-vng-con-${var.product_unique}"

  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.rg_sec_vpn_vng.id
  local_network_gateway_id   = azurerm_local_network_gateway.rg_sec_ziraatag_hq_bck_lng.id

  shared_key = var.rg_sec_ziraatag_hq_bck_lng_vng_con_shared_secret_key

  ipsec_policy {
    dh_group         = var.rg_sec_ziraatag_vngc_policy_dh_group
    ike_encryption   = var.rg_sec_ziraatag_vngc_policy_ike_encryption
    ike_integrity    = var.rg_sec_ziraatag_vngc_policy_ike_integrity
    ipsec_encryption = var.rg_sec_ziraatag_vngc_policy_ipsec_encryption
    ipsec_integrity  = var.rg_sec_ziraatag_vngc_policy_ipsec_integrity
    pfs_group        = var.rg_sec_ziraatag_vngc_policy_pfs_group
    sa_lifetime      = var.rg_sec_ziraatag_vngc_policy_sa_lifetime_sec
    sa_datasize      = var.rg_sec_ziraatag_vngc_policy_sa_datasize_kb
  }
}

resource "azurerm_virtual_network_gateway_connection" "rg_sec_ziraatag_drc_lng_vng_con" {
  name = "${local.resource_prefix_rg_sec}-ziraatag-drc-vng-con-${var.product_unique}"

  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.rg_sec_vpn_vng.id
  local_network_gateway_id   = azurerm_local_network_gateway.rg_sec_ziraatag_drc_lng.id

  shared_key = var.rg_sec_ziraatag_drc_lng_vng_con_shared_secret_key

  ipsec_policy {
    dh_group         = var.rg_sec_ziraatag_vngc_policy_dh_group
    ike_encryption   = var.rg_sec_ziraatag_vngc_policy_ike_encryption
    ike_integrity    = var.rg_sec_ziraatag_vngc_policy_ike_integrity
    ipsec_encryption = var.rg_sec_ziraatag_vngc_policy_ipsec_encryption
    ipsec_integrity  = var.rg_sec_ziraatag_vngc_policy_ipsec_integrity
    pfs_group        = var.rg_sec_ziraatag_vngc_policy_pfs_group
    sa_lifetime      = var.rg_sec_ziraatag_vngc_policy_sa_lifetime_sec
    sa_datasize      = var.rg_sec_ziraatag_vngc_policy_sa_datasize_kb
  }
}