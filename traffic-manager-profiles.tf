locals {
  wif_tmp = {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/readiness"
    traffic_routing_method       = "Priority"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
    ttl                          = 120
    expected_status_code_ranges  = ["200-200"]
  }

  wef_tmp = {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/readiness"
    traffic_routing_method       = "Priority"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
    ttl                          = 120
    expected_status_code_ranges  = ["200-200"]
  }

  wif_pvt_tmp = {
    protocol                     = "HTTPS"
    port                         = 4443
    path                         = "/readiness"
    traffic_routing_method       = "Priority"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
    ttl                          = 120
    expected_status_code_ranges  = ["200-200"]
  }
}

resource "azurerm_traffic_manager_profile" "rg_pri_mb_app_tmp" {
  name                   = "${local.resource_prefix_rg_pri}-vc-mb-tmp-${var.product_unique}"
  resource_group_name    = azurerm_resource_group.rg_pri.name
  traffic_routing_method = local.wef_tmp.traffic_routing_method
  dns_config {
    relative_name = replace(local.app_custom_domains.mb_app, ".${var.domain_name_suffix}", "-${var.product_unique}")
    ttl           = local.wef_tmp.ttl
  }

  monitor_config {
    protocol                     = local.wef_tmp.protocol
    port                         = local.wef_tmp.port
    path                         = local.wef_tmp.path
    interval_in_seconds          = local.wef_tmp.interval_in_seconds
    timeout_in_seconds           = local.wef_tmp.timeout_in_seconds
    tolerated_number_of_failures = local.wef_tmp.tolerated_number_of_failures
    expected_status_code_ranges  = local.wef_tmp.expected_status_code_ranges
    custom_header {
      name  = "host"
      value = local.app_custom_domains.mb_app
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Traffic Manager Profile 1 (VeriChannel Mobile Banking Application)"
  }
}

# resource "azurerm_traffic_manager_profile" "rg_pri_sotp_app_tmp" {
#   name                   = "${local.resource_prefix_rg_pri}-sotp-tmp-${var.product_unique}"
#   resource_group_name    = azurerm_resource_group.rg_pri.name
#   traffic_routing_method = local.wef_tmp.traffic_routing_method
#   dns_config {
#     relative_name = replace(local.app_custom_domains.sotp_app, ".${var.domain_name_suffix}", "-${var.product_unique}")
#     ttl           = local.wef_tmp.ttl
#   }

#   monitor_config {
#     protocol                     = local.wef_tmp.protocol
#     port                         = local.wef_tmp.port
#     path                         = local.wef_tmp.path
#     interval_in_seconds          = local.wef_tmp.interval_in_seconds
#     timeout_in_seconds           = local.wef_tmp.timeout_in_seconds
#     tolerated_number_of_failures = local.wef_tmp.tolerated_number_of_failures
#     expected_status_code_ranges  = local.wef_tmp.expected_status_code_ranges
#     custom_header {
#       name  = "host"
#       value = local.app_custom_domains.sotp_app
#     }
#   }

#   tags = {
#     company                   = var.company_name_long
#     product                   = local.product_name_long
#     region                    = var.rg_pri_location_long
#     environment               = var.environment_long
#     enable_auto_diag_settings = true
#     name                      = "Traffic Manager Profile 2 (VeriChannel SOTP Application)"
#   }
# }


# resource "azurerm_traffic_manager_profile" "rg_pri_svc_app_tmp" {
#   name                   = "${local.resource_prefix_rg_pri}-svc-tmp-${var.product_unique}"
#   resource_group_name    = azurerm_resource_group.rg_pri.name
#   traffic_routing_method = local.wef_tmp.traffic_routing_method
#   dns_config {
#     relative_name = replace(local.app_custom_domains.svc_app, ".${var.domain_name_suffix}", "-${var.product_unique}")
#     ttl           = local.wef_tmp.ttl
#   }

#   monitor_config {
#     protocol                     = local.wef_tmp.protocol
#     port                         = local.wef_tmp.port
#     path                         = local.wef_tmp.path
#     interval_in_seconds          = local.wef_tmp.interval_in_seconds
#     timeout_in_seconds           = local.wef_tmp.timeout_in_seconds
#     tolerated_number_of_failures = local.wef_tmp.tolerated_number_of_failures
#     expected_status_code_ranges  = local.wef_tmp.expected_status_code_ranges
#     custom_header {
#       name  = "host"
#       value = local.app_custom_domains.svc_app
#     }
#   }

#   tags = {
#     company                   = var.company_name_long
#     product                   = local.product_name_long
#     region                    = var.rg_pri_location_long
#     environment               = var.environment_long
#     enable_auto_diag_settings = true
#     name                      = "Traffic Manager Profile 3 (VeriChannel Internal Services Application)"
#   }
# }

resource "azurerm_traffic_manager_profile" "rg_pri_ib_app_tmp" {
  name                   = "${local.resource_prefix_rg_pri}-ib-tmp-${var.product_unique}"
  resource_group_name    = azurerm_resource_group.rg_pri.name
  traffic_routing_method = local.wef_tmp.traffic_routing_method
  dns_config {
    relative_name = replace(local.app_custom_domains.ib_app, ".${var.domain_name_suffix}", "-${var.product_unique}")
    ttl           = local.wef_tmp.ttl
  }

  monitor_config {
    protocol                     = local.wef_tmp.protocol
    port                         = local.wef_tmp.port
    path                         = local.wef_tmp.path
    interval_in_seconds          = local.wef_tmp.interval_in_seconds
    timeout_in_seconds           = local.wef_tmp.timeout_in_seconds
    tolerated_number_of_failures = local.wef_tmp.tolerated_number_of_failures
    expected_status_code_ranges  = local.wef_tmp.expected_status_code_ranges
    custom_header {
      name  = "host"
      value = local.app_custom_domains.ib_app
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Traffic Manager Profile 4 (VeriChannel Internet Banking Application)"
  }
}

resource "azurerm_traffic_manager_profile" "rg_pri_psd_app_tmp" {
  name                   = "${local.resource_prefix_rg_pri}-psd-tmp-${var.product_unique}"
  resource_group_name    = azurerm_resource_group.rg_pri.name
  traffic_routing_method = local.wef_tmp.traffic_routing_method
  dns_config {
    relative_name = replace(local.app_custom_domains.psd_app, ".${var.domain_name_suffix}", "-${var.product_unique}")
    ttl           = local.wef_tmp.ttl
  }

  monitor_config {
    protocol                     = local.wef_tmp.protocol
    port                         = local.wef_tmp.port
    path                         = local.wef_tmp.path
    interval_in_seconds          = local.wef_tmp.interval_in_seconds
    timeout_in_seconds           = local.wef_tmp.timeout_in_seconds
    tolerated_number_of_failures = local.wef_tmp.tolerated_number_of_failures
    expected_status_code_ranges  = local.wef_tmp.expected_status_code_ranges
    custom_header {
      name  = "host"
      value = local.app_custom_domains.psd_app
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Traffic Manager Profile 5 (VeriChannel PSD-II Application)"
  }
}

resource "azurerm_traffic_manager_profile" "rg_pri_bo_app_tmp" {
  name                   = "${local.resource_prefix_rg_pri}-bo-tmp-${var.product_unique}"
  resource_group_name    = azurerm_resource_group.rg_pri.name
  traffic_routing_method = local.wef_tmp.traffic_routing_method
  dns_config {
    relative_name = replace(local.app_custom_domains.bo_app, ".${var.domain_name_suffix}", "-${var.product_unique}")
    ttl           = local.wif_pvt_tmp.ttl
  }

  monitor_config {
    protocol                     = local.wif_pvt_tmp.protocol
    port                         = local.wif_pvt_tmp.port
    path                         = local.wif_pvt_tmp.path
    interval_in_seconds          = local.wif_pvt_tmp.interval_in_seconds
    timeout_in_seconds           = local.wif_pvt_tmp.timeout_in_seconds
    tolerated_number_of_failures = local.wif_pvt_tmp.tolerated_number_of_failures
    expected_status_code_ranges  = local.wif_pvt_tmp.expected_status_code_ranges
    custom_header {
      name  = "host"
      value = local.app_custom_domains.bo_app
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Traffic Manager Profile 6 (VeriChannel Backoffice Application)"
  }
}
resource "azurerm_traffic_manager_profile" "rg_pri_psd_dev_app_tmp" {
  name                   = "${local.resource_prefix_rg_pri}-psd-dev-tmp-${var.product_unique}"
  resource_group_name    = azurerm_resource_group.rg_pri.name
  traffic_routing_method = local.wef_tmp.traffic_routing_method
  dns_config {
    relative_name = replace(local.app_custom_domains.psd_dev_app, ".${var.domain_name_suffix}", "-${var.product_unique}")
    ttl           = local.wef_tmp.ttl
  }

  monitor_config {
    protocol                     = local.wef_tmp.protocol
    port                         = local.wef_tmp.port
    path                         = local.wef_tmp.path
    interval_in_seconds          = local.wef_tmp.interval_in_seconds
    timeout_in_seconds           = local.wef_tmp.timeout_in_seconds
    tolerated_number_of_failures = local.wef_tmp.tolerated_number_of_failures
    expected_status_code_ranges  = local.wef_tmp.expected_status_code_ranges
    custom_header {
      name  = "host"
      value = local.app_custom_domains.psd_dev_app
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Traffic Manager Profile 6 (VeriChannel PSD-II DEV Application)"
  }
}