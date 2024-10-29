resource "azurerm_local_network_gateway" "rg_pri_ziraatag_hq_prod_lng" {
  name                = "${local.resource_prefix_rg_pri}-ziraatag-hq-prod-lng-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  gateway_address = var.ziraatag_hq_prod_lng_gateway_address
  address_space   = var.ziraatag_hq_prod_lng_address_space_array
}

resource "azurerm_local_network_gateway" "rg_pri_ziraatag_hq_bck_lng" {
  name                = "${local.resource_prefix_rg_pri}-ziraatag-hq-bck-lng-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  gateway_address = var.ziraatag_hq_bck_lng_gateway_address
  address_space   = var.ziraatag_hq_bck_lng_address_space_array
}

resource "azurerm_local_network_gateway" "rg_pri_ziraatag_drc_lng" {
  name                = "${local.resource_prefix_rg_pri}-ziraatag-drc-lng-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  gateway_address = var.ziraatag_drc_lng_gateway_address
  address_space   = var.ziraatag_drc_lng_address_space_array
}

#RG-02

resource "azurerm_local_network_gateway" "rg_sec_ziraatag_hq_prod_lng" {
  name                = "${local.resource_prefix_rg_sec}-ziraatag-hq-prod-lng-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  gateway_address = var.ziraatag_hq_prod_lng_gateway_address
  address_space   = var.ziraatag_hq_prod_lng_address_space_array
}

resource "azurerm_local_network_gateway" "rg_sec_ziraatag_hq_bck_lng" {
  name                = "${local.resource_prefix_rg_sec}-ziraatag-hq-bck-lng-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  gateway_address = var.ziraatag_hq_bck_lng_gateway_address
  address_space   = var.ziraatag_hq_bck_lng_address_space_array
}

resource "azurerm_local_network_gateway" "rg_sec_ziraatag_drc_lng" {
  name                = "${local.resource_prefix_rg_sec}-ziraatag-drc-lng-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  gateway_address = var.ziraatag_drc_lng_gateway_address
  address_space   = var.ziraatag_drc_lng_address_space_array
}