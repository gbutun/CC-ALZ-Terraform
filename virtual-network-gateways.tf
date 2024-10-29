resource "azurerm_virtual_network_gateway" "rg_pri_vpn_vng" {
  name                = "${local.resource_prefix_rg_pri}-vpn-vng-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetgatewayconfig"
    public_ip_address_id          = azurerm_public_ip.rg_pri_vpn_vng_pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.rg_pri_hub_vn_vng_sub.id
  }

  tags = {
    company                   = var.company_name_long
    product                   = var.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Vpn Gateway"
  }

  depends_on = [
    azurerm_virtual_network.rg_pri_hub_vn,
    azurerm_public_ip.rg_pri_vpn_vng_pip,
  ]
}

#--

resource "azurerm_virtual_network_gateway" "rg_sec_vpn_vng" {
  name                = "${local.resource_prefix_rg_sec}-vpn-vng-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetgatewayconfig"
    public_ip_address_id          = azurerm_public_ip.rg_sec_vpn_vng_pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.rg_sec_hub_vn_vng_sub.id
  }

  tags = {
    company                   = var.company_name_long
    product                   = var.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Vpn Gateway"
  }

  depends_on = [
    azurerm_virtual_network.rg_sec_hub_vn,
    azurerm_public_ip.rg_sec_vpn_vng_pip,
  ]
}
