locals {
  firewall_configs = {
    threat_intel_mode = {
      off   = "Off",
      alert = "Alert",
      deny  = "Deny"
    }
  }
}

resource "azurerm_firewall" "rg_pri_frw" {
  name                = "${local.resource_prefix_rg_pri}-frw-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location
  sku_name            = var.rg_pri_frw_sku_name
  sku_tier            = var.rg_pri_frw_sku_tier
  threat_intel_mode   = local.firewall_configs.threat_intel_mode.alert

  ip_configuration {
    name                 = "prv-pip-cfg"
    subnet_id            = azurerm_subnet.rg_pri_hub_vn_frw_sub.id
    public_ip_address_id = azurerm_public_ip.rg_pri_frw_pip.id
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Firewall Primary Region"
  }
}

#--

resource "azurerm_firewall" "rg_sec_frw" {
  name                = "${local.resource_prefix_rg_sec}-frw-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location
  sku_name            = var.rg_sec_frw_sku_name
  sku_tier            = var.rg_sec_frw_sku_tier
  threat_intel_mode   = local.firewall_configs.threat_intel_mode.alert

  ip_configuration {
    name                 = "prv-pip-cfg"
    subnet_id            = azurerm_subnet.rg_sec_hub_vn_frw_sub.id
    public_ip_address_id = azurerm_public_ip.rg_sec_frw_pip.id
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Firewall Secondary Region"
  }
}