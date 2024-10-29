locals {
  wif_tmp_tme = {
    geo_mappings = "WORLD"
  }

  wef_tmp_tme = {
    geo_mappings = "WORLD"
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "rg_pri_mb_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_pri}-mb-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_mb_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
  priority           = 1
  weight             = 1
}

resource "azurerm_traffic_manager_azure_endpoint" "rg_sec_mb_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_sec}-mb-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_mb_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_sec_wef_agw_pip.id
  priority           = 2
  weight             = 1
}

# resource "azurerm_traffic_manager_azure_endpoint" "rg_pri_sotp_app_tmp_tme" {
#   name               = "${local.resource_prefix_rg_pri}-sotp-tmp-tme-${var.product_unique}"
#   profile_id         = azurerm_traffic_manager_profile.rg_pri_sotp_app_tmp.id
#   target_resource_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
#   priority           = 2
#   weight             = 1
# }

# resource "azurerm_traffic_manager_azure_endpoint" "rg_sec_sotp_app_tmp_tme" {
#   name               = "${local.resource_prefix_rg_sec}-sotp-tmp-tme-${var.product_unique}"
#   profile_id         = azurerm_traffic_manager_profile.rg_pri_sotp_app_tmp.id
#   target_resource_id = azurerm_public_ip.rg_sec_wef_agw_pip.id
#   priority           = 1
#   weight             = 1
# }

resource "azurerm_traffic_manager_azure_endpoint" "rg_pri_bo_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_pri}-bo-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_bo_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
  priority           = 1
  weight             = 1
}

resource "azurerm_traffic_manager_azure_endpoint" "rg_sec_bo_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_sec}-bo-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_bo_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_sec_wef_agw_pip.id
  priority           = 2
  weight             = 1
}

# resource "azurerm_traffic_manager_azure_endpoint" "rg_pri_svc_app_tmp_tme" {
#   name               = "${local.resource_prefix_rg_pri}-svc-tmp-tme-${var.product_unique}"
#   profile_id         = azurerm_traffic_manager_profile.rg_pri_svc_app_tmp.id
#   target_resource_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
#   priority           = 1
#   weight             = 1
# }

# resource "azurerm_traffic_manager_azure_endpoint" "rg_sec_svc_app_tmp_tme" {
#   name               = "${local.resource_prefix_rg_sec}-svc-tmp-tme-${var.product_unique}"
#   profile_id         = azurerm_traffic_manager_profile.rg_pri_svc_app_tmp.id
#   target_resource_id = azurerm_public_ip.rg_sec_wef_agw_pip.id
#   priority           = 2
#   weight             = 1
# }

resource "azurerm_traffic_manager_azure_endpoint" "rg_pri_ib_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_pri}-ib-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_ib_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
  priority           = 2
  weight             = 1
}

resource "azurerm_traffic_manager_azure_endpoint" "rg_sec_ib_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_sec}-ib-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_ib_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_sec_wef_agw_pip.id
  priority           = 1
  weight             = 1
}

resource "azurerm_traffic_manager_azure_endpoint" "rg_pri_psd_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_pri}-psd-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_psd_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
  priority           = 2
  weight             = 1
}

resource "azurerm_traffic_manager_azure_endpoint" "rg_sec_psd_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_sec}-psd-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_psd_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_sec_wef_agw_pip.id
  priority           = 1
  weight             = 1
}

resource "azurerm_traffic_manager_azure_endpoint" "rg_pri_psd_dev_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_pri}-psd-dev-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_psd_dev_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
  priority           = 1
  weight             = 1
}

resource "azurerm_traffic_manager_azure_endpoint" "rg_sec_psd_dev_app_tmp_tme" {
  name               = "${local.resource_prefix_rg_sec}-psd-dev-tmp-tme-${var.product_unique}"
  profile_id         = azurerm_traffic_manager_profile.rg_pri_psd_dev_app_tmp.id
  target_resource_id = azurerm_public_ip.rg_sec_wef_agw_pip.id
  priority           = 2
  weight             = 1
}
