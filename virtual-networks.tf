module "rg_pri_hub_vn" {
  source              = "./modules/vnet"
  vn_name             = "${local.resource_prefix_rg_pri}-hub-vn-${var.product_unique}"
  resource_group_name = module.rg_pri.resource_group_name
  location            = azurerm_resource_group.rg_pri.location
  vn_address_space    = [var.rg_pri_hub_vn_address_space]
  company             = var.company_name_long
  product             = local.product_name_long
  region              = var.rg_pri_location_long
  environment         = var.environment_long
  name                = "Hub VNet"
}

module "rg_pri_spk_vn" {
  source              = "./modules/vnet"
  vn_name             = "${local.resource_prefix_rg_pri}-spk-vn-${var.product_unique}"
  resource_group_name = module.rg_pri.resource_group_name
  location            = azurerm_resource_group.rg_pri.location
  vn_address_space    = [var.rg_pri_spk_vn_address_space]
  company             = var.company_name_long
  product             = local.product_name_long
  region              = var.rg_pri_location_long
  environment         = var.environment_long
  name                = "Spoke VNet"
}

# Secondary Region 

module "rg_sec_hub_vn" {
  source              = "./modules/network"
  vn_name             = "${local.resource_prefix_rg_sec}-hub-vn-${var.product_unique}"
  resource_group_name = module.rg_sec.resource_group_name
  location            = azurerm_resource_group.rg_sec.location
  vn_address_space    = [var.rg_sec_hub_vn_address_space]
  company             = var.company_name_long
  product             = local.product_name_long
  region              = var.rg_sec_location_long
  environment         = var.environment_long
  name                = "Hub VNet"
}

module "rg_sec_spk_vn" {
  source              = "./modules/network"
  vn_name             = "${local.resource_prefix_rg_sec}-spk-vn-${var.product_unique}"
  resource_group_name = module.rg_sec.resource_group_name
  location            = azurerm_resource_group.rg_sec.location
  vn_address_space    = [var.rg_sec_spk_vn_address_space]
  company             = var.company_name_long
  product             = local.product_name_long
  region              = var.rg_sec_location_long
  environment         = var.environment_long
  name                = "Spoke VNet"
}
