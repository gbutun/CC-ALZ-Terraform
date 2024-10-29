
resource "azurerm_network_security_group" "rg_pri_hub_vn_jmb_sub_nsg" {
  name                = "${local.resource_prefix_rg_pri}-jmb-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "JumpBox Subnet NSG"
  }
}

resource "azurerm_network_security_group" "rg_pri_hub_vn_wef_agw_sub_nsg" {
  name                = "${local.resource_prefix_rg_pri}-wef-agw-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "External Facing AGW Subnet NSG"
  }
}

resource "azurerm_network_security_group" "rg_pri_spk_vn_wl_sub_nsg" {
  name                = "${local.resource_prefix_rg_pri}-wl-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Workload Subnet NSG"
  }
}

resource "azurerm_network_security_group" "rg_pri_spk_vn_sql_pe_int_sub_nsg" {
  name                = "${local.resource_prefix_rg_pri}-sql-pe-int-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "SQL Private Endpoint Integration Subnet NSG"
  }
}

resource "azurerm_network_security_group" "rg_pri_spk_vn_rls_sub_nsg" {
  name                = "${local.resource_prefix_rg_pri}-rls-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Release Subnet NSG"
  }
}

#--

resource "azurerm_network_security_group" "rg_sec_hub_vn_jmb_sub_nsg" {
  name                = "${local.resource_prefix_rg_sec}-jmb-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "JumpBox Subnet NSG"
  }
}

resource "azurerm_network_security_group" "rg_sec_hub_vn_wef_agw_sub_nsg" {
  name                = "${local.resource_prefix_rg_sec}-wef-agw-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "External Facing AGW Subnet NSG"
  }
}

resource "azurerm_network_security_group" "rg_sec_spk_vn_wl_sub_nsg" {
  name                = "${local.resource_prefix_rg_sec}-wl-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Workload Subnet NSG"
  }
}

resource "azurerm_network_security_group" "rg_sec_spk_vn_sql_pe_int_sub_nsg" {
  name                = "${local.resource_prefix_rg_sec}-sql-pe-int-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "SQL Private Endpoint Integration Subnet NSG"
  }
}

resource "azurerm_network_security_group" "rg_sec_spk_vn_rls_sub_nsg" {
  name                = "${local.resource_prefix_rg_sec}-rls-sub-nsg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Release Subnet NSG"
  }
}
