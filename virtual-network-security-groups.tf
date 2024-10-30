module "rg_pri_hub_vn_jmb_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_pri}-jmb-sub-nsg-${var.product_unique}"
  resource_group_name       = module.rg_pri.resource_group_name
  location                  = module.rg_pri.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_pri_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "JumpBox Subnet NSG"
}

module "rg_pri_hub_vn_wef_agw_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_pri}-wef-agw-sub-nsg-${var.product_unique}"
  resource_group_name       = module.rg_pri.resource_group_name
  location                  = module.rg_pri.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_pri_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "External Facing AGW Subnet NSG"
}

module "rg_pri_spk_vn_wl_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_pri}-wl-sub-nsg-${var.product_unique}"
  resource_group_name       = module.rg_pri.resource_group_name
  location                  = module.rg_pri.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_pri_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "Workload Subnet NSG"
}

module "rg_pri_spk_vn_sql_pe_int_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_pri}-sql-pe-int-sub-nsg-${var.product_unique}"
  resource_group_name       = module.rg_pri.resource_group_name
  location                  = module.rg_pri.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_pri_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "SQL Private Endpoint Integration Subnet NSG"
}

module "rg_pri_spk_vn_rls_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_pri}-rls-sub-nsg-${var.product_unique}"
  resource_group_name       = module.rg_pri.resource_group_name
  location                  = module.rg_pri.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_pri_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "Release Subnet NSG"
}

#--

module "rg_sec_hub_vn_jmb_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_sec}-jmb-sub-nsg-${var.product_unique}"
  resource_group_name       = azurerm_resource_group.rg_sec.name
  location                  = azurerm_resource_group.rg_sec.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_sec_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "JumpBox Subnet NSG"
}

module "rg_sec_hub_vn_wef_agw_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_sec}-wef-agw-sub-nsg-${var.product_unique}"
  resource_group_name       = azurerm_resource_group.rg_sec.name
  location                  = azurerm_resource_group.rg_sec.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_sec_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "External Facing AGW Subnet NSG"
}

module "rg_sec_spk_vn_wl_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_sec}-wl-sub-nsg-${var.product_unique}"
  resource_group_name       = azurerm_resource_group.rg_sec.name
  location                  = azurerm_resource_group.rg_sec.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_sec_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "Workload Subnet NSG"
}

module "rg_sec_spk_vn_sql_pe_int_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_sec}-sql-pe-int-sub-nsg-${var.product_unique}"
  resource_group_name       = azurerm_resource_group.rg_sec.name
  location                  = azurerm_resource_group.rg_sec.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_sec_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "SQL Private Endpoint Integration Subnet NSG"
}

module "rg_sec_spk_vn_rls_sub_nsg" {
  source                    = "./module/nsg"
  name                      = "${local.resource_prefix_rg_sec}-rls-sub-nsg-${var.product_unique}"
  resource_group_name       = azurerm_resource_group.rg_sec.name
  location                  = azurerm_resource_group.rg_sec.location
  company                   = var.company_name_long
  product                   = local.product_name_long
  region                    = var.rg_sec_location_long
  environment               = var.environment_long
  enable_auto_diag_settings = true
  tag_name                  = "Release Subnet NSG"
}
