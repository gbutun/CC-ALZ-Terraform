module "rg_pri_hub_vn_frw_sub" {
  source              = "./modules/subnet"
  subnet_name         = "AzureFirewallSubnet"
  resource_group_name = module.rg_pri.resource_group_name
  vn_name             = module.rg_pri_hub_vn.vn_name
  sub_address_space   = [var.rg_pri_hub_vn_frw_sub_address_space]
}

module "rg_pri_hub_vn_jmb_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_pri}-jmb-sub-${var.product_unique}"
  resource_group_name = module.rg_pri.resource_group_name
  vn_name             = module.rg_pri_hub_vn.vn_name
  sub_address_space   = [var.rg_pri_hub_vn_jmb_sub_address_space]
}

module "rg_pri_hub_vn_vng_sub" {
  source              = "./modules/subnet"
  subnet_name         = "GatewaySubnet"
  resource_group_name = module.rg_pri.resource_group_name
  vn_name             = module.rg_pri_hub_vn.vn_name
  sub_address_space   = [var.rg_pri_hub_vn_vng_sub_address_space]
}

module "rg_pri_hub_vn_wef_agw_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_pri}-agw-sub-${var.product_unique}"
  resource_group_name = module.rg_pri.resource_group_name
  vn_name             = module.rg_pri_hub_vn.vn_name
  sub_address_space   = [var.rg_pri_hub_vn_wef_agw_sub_address_space]
  service_endpoints   = ["Microsoft.Storage", "Microsoft.KeyVault"]
}

module "rg_pri_spk_vn_wl_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_pri}-wl-sub-${var.product_unique}"
  resource_group_name = module.rg_pri.resource_group_name
  vn_name             = module.rg_pri_spk_vn.vn_name
  sub_address_space   = [var.rg_pri_spk_vn_wl_sub_address_space]
  # Microsoft.ContainerRegistry service endpoint is not supported by ACR yet.
  #service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ContainerRegistry","Microsoft.AzureActiveDirectory"]
  service_endpoints = ["Microsoft.Storage.Global", "Microsoft.KeyVault"]
}

module "rg_pri_spk_vn_sql_pe_int_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_pri}-sql-pe-int-sub-${var.product_unique}"
  resource_group_name = module.rg_pri.resource_group_name
  vn_name             = module.rg_pri_spk_vn.vn_name
  sub_address_space   = [var.rg_pri_spk_vn_sql_pe_int_sub_address_space]
}

module "rg_pri_spk_vn_rls_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_pri}-rls-sub-${var.product_unique}"
  resource_group_name = module.rg_pri.resource_group_name
  vn_name             = module.rg_pri_spk_vn.vn_name
  sub_address_space   = [var.rg_pri_spk_vn_rls_sub_address_space]
  # Microsoft.ContainerRegistry service endpoint is not supported by ACR yet.
  #service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault","Microsoft.ContainerRegistry","Microsoft.AzureActiveDirectory"]
  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault"]
}

#--


module "rg_sec_hub_vn_frw_sub" {
  source              = "./modules/subnet"
  subnet_name         = "AzureFirewallSubnet"
  resource_group_name = azurerm_resource_group.rg_sec.name
  vn_name             = module.rg_pri_spk_vn.vn_name
  sub_address_space   = [var.rg_sec_hub_vn_frw_sub_address_space]
}

module "rg_sec_hub_vn_jmb_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_sec}-jmb-sub-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  vn_name             = module.rg_pri_spk_vn.vn_name
  sub_address_space   = [var.rg_sec_hub_vn_jmb_sub_address_space]
}

module "rg_sec_hub_vn_vng_sub" {
  source              = "./modules/subnet"
  subnet_name         = "GatewaySubnet"
  resource_group_name = azurerm_resource_group.rg_sec.name
  vn_name             = module.rg_pri_spk_vn.vn_name
  sub_address_space   = [var.rg_sec_hub_vn_vng_sub_address_space]
}

module "rg_sec_hub_vn_wef_agw_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_sec}-agw-sub-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  vn_name             = module.rg_pri_spk_vn.vn_name
  sub_address_space   = [var.rg_sec_hub_vn_wef_agw_sub_address_space]
  service_endpoints   = ["Microsoft.Storage", "Microsoft.KeyVault"]
}

module "rg_sec_spk_vn_wl_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_sec}-wl-sub-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  vn_name             = module.rg_pri_spk_vn.vn_name
  sub_address_space   = [var.rg_sec_spk_vn_wl_sub_address_space]
  # Microsoft.ContainerRegistry service endpoint is not supported by ACR yet.
  #service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ContainerRegistry","Microsoft.AzureActiveDirectory"]
  service_endpoints = ["Microsoft.Storage.Global", "Microsoft.KeyVault"]
}

module "rg_sec_spk_vn_sql_pe_int_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_sec}-sql-pe-int-sub-${var.product_unique}"
  resource_group_name = module.rg_pri_spk_vn.vn_name
  vn_name             = module.rg_sec_hub_vn.vn_name
  sub_address_space   = [var.rg_sec_spk_vn_sql_pe_int_sub_address_space]
}

module "rg_sec_spk_vn_rls_sub" {
  source              = "./modules/subnet"
  subnet_name         = "${local.resource_prefix_rg_sec}-rls-sub-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  vn_name             = module.rg_sec_hub_vn.vn_name
  sub_address_space   = [var.rg_sec_spk_vn_rls_sub_address_space]
  # Microsoft.ContainerRegistry service endpoint is not supported by ACR yet.
  #service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault","Microsoft.ContainerRegistry","Microsoft.AzureActiveDirectory"]
  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault"]
}
