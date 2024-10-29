locals {
  pip = {
    sku = {
      basic    = "Basic"
      standard = "Standard"
    }
    allocation_method = {
      static  = "Static"
      dynamic = "Dynamic"
    }
    version = {
      ipv4 = "IPv4",
      ipv6 = "IPv6"
    }
    idle_timeout_in_minutes = 30
  }
}


resource "azurerm_public_ip" "rg_pri_wef_agw_pip" {
  name                    = "${local.resource_prefix_rg_pri}-wef-agw-pip-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  location                = azurerm_resource_group.rg_pri.location
  sku                     = local.pip.sku.standard
  allocation_method       = local.pip.allocation_method.static
  ip_version              = local.pip.version.ipv4
  idle_timeout_in_minutes = local.pip.idle_timeout_in_minutes
  domain_name_label       = "${local.resource_prefix_rg_pri}-wef-agw-${var.product_unique}"

  tags = {
    company                   = var.company_name_long
    product                   = var.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "External Facing Application Gateway Public IP"
  }
}

resource "azurerm_public_ip" "rg_pri_vpn_vng_pip" {
  name                    = "${local.resource_prefix_rg_pri}-vpn-vng-pip-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  location                = azurerm_resource_group.rg_pri.location
  sku                     = local.pip.sku.basic
  allocation_method       = local.pip.allocation_method.dynamic
  ip_version              = local.pip.version.ipv4
  idle_timeout_in_minutes = local.pip.idle_timeout_in_minutes
  domain_name_label       = "${local.resource_prefix_rg_pri}-vpn-vng-${var.product_unique}"

  tags = {
    company                   = var.company_name_long
    product                   = var.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "VPN Gateway Public IP"
  }
}

resource "azurerm_public_ip" "rg_pri_jmb_vm_pip" {
  name                    = "${local.resource_prefix_rg_pri}-jmb-pip-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  location                = azurerm_resource_group.rg_pri.location
  sku                     = local.pip.sku.standard
  allocation_method       = local.pip.allocation_method.static
  ip_version              = local.pip.version.ipv4
  idle_timeout_in_minutes = local.pip.idle_timeout_in_minutes
  domain_name_label       = "${local.resource_prefix_rg_pri}-jmb-${var.product_unique}"

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Jumpbox VM Public Static IP"
  }
}

resource "azurerm_public_ip" "rg_pri_frw_pip" {
  name                    = "${local.resource_prefix_rg_pri}-frw-pip-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  location                = azurerm_resource_group.rg_pri.location
  sku                     = local.pip.sku.standard
  allocation_method       = local.pip.allocation_method.static
  ip_version              = local.pip.version.ipv4
  idle_timeout_in_minutes = local.pip.idle_timeout_in_minutes
  domain_name_label       = "${local.resource_prefix_rg_pri}-frw-${var.product_unique}"

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet Nat Gateway Public Static IP"
  }
}

#--

resource "azurerm_public_ip" "rg_sec_wef_agw_pip" {
  name                    = "${local.resource_prefix_rg_sec}-wef-agw-pip-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_sec.name
  location                = azurerm_resource_group.rg_sec.location
  sku                     = local.pip.sku.standard
  allocation_method       = local.pip.allocation_method.static
  ip_version              = local.pip.version.ipv4
  idle_timeout_in_minutes = local.pip.idle_timeout_in_minutes
  domain_name_label       = "${local.resource_prefix_rg_sec}-wef-agw-${var.product_unique}"

  tags = {
    company                   = var.company_name_long
    product                   = var.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "External Facing Application Gateway Public IP"
  }
}

resource "azurerm_public_ip" "rg_sec_vpn_vng_pip" {
  name                    = "${local.resource_prefix_rg_sec}-vpn-vng-pip-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_sec.name
  location                = azurerm_resource_group.rg_sec.location
  sku                     = local.pip.sku.basic
  allocation_method       = local.pip.allocation_method.dynamic
  ip_version              = local.pip.version.ipv4
  idle_timeout_in_minutes = local.pip.idle_timeout_in_minutes
  domain_name_label       = "${local.resource_prefix_rg_sec}-vpn-vng-${var.product_unique}"

  tags = {
    company                   = var.company_name_long
    product                   = var.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "VPN Gateway Public IP"
  }
}

resource "azurerm_public_ip" "rg_sec_frw_pip" {
  name                    = "${local.resource_prefix_rg_sec}-frw-pip-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_sec.name
  location                = azurerm_resource_group.rg_sec.location
  sku                     = local.pip.sku.standard
  allocation_method       = local.pip.allocation_method.static
  ip_version              = local.pip.version.ipv4
  idle_timeout_in_minutes = local.pip.idle_timeout_in_minutes
  domain_name_label       = "${local.resource_prefix_rg_sec}-frw-${var.product_unique}"

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet Nat Gateway Public Static IP"
  }
}