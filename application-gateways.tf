locals {
  static_maintenance_page = "https://${azurerm_storage_account.rg_pri_pub_sa.name}.blob.core.windows.net/${azurerm_storage_container.rg_pri_pub_sa_vc_pub_fs.name}/${azurerm_storage_blob.rg_pri_pub_sa_vc_pub_fs_vc_st_err_pg.name}"
  static_error_404_page   = "https://${azurerm_storage_account.rg_pri_pub_sa.name}.blob.core.windows.net/${azurerm_storage_container.rg_pri_pub_sa_vc_pub_fs.name}/${azurerm_storage_blob.rg_pri_pub_sa_vc_pub_fs_vc_st_404_err_pg.name}"
  agw = {
    ssl_policy = {
      minimum_tls_version = {
        tls_10 = "TLSv1_0"
        tls_11 = "TLSv1_1"
        tls_12 = "TLSv1_2"
      }
      policy_type = {
        predefined = "Predefined"
        custom     = "Custom"
      }
      policy_name = {
        appGwSslPolicy20150501  = "AppGwSslPolicy20150501"
        appGwSslPolicy20170401  = "AppGwSslPolicy20170401"
        appGwSslPolicy20170401S = "AppGwSslPolicy20170401S"
        appGwSslPolicy20220101S = "AppGwSslPolicy20220101S"
      }
    }
    waf_config = {
      rule_set_type = {
        owasp = "OWASP"
      }
      rule_set_version = {
        v229 = "2.2.9"
        v300 = "3.0"
        v310 = "3.1"
        v320 = "3.2"
      }
    }
    private_ip_address_allocations = {
      static  = "Static"
      dynamic = "Dynamic"
    }
  }
}


resource "azurerm_application_gateway" "rg_pri_wef_agw" {
  name                = "${local.resource_prefix_rg_pri}-wef-agw-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location
  enable_http2        = true

  sku {
    name = var.rg_pri_wef_agw_sku_name
    tier = var.rg_pri_wef_agw_sku_tier
  }

  identity {
    type = local.resource_identity_type.user_assigned

    identity_ids = [
      azurerm_user_assigned_identity.rg_pri_wef_agw_usr_asgn_id.id
    ]
  }

  ssl_policy {
    policy_type = local.agw.ssl_policy.policy_type.predefined
    policy_name = local.agw.ssl_policy.policy_name.appGwSslPolicy20220101S
  }

  waf_configuration {
    enabled          = true
    firewall_mode    = var.rg_pri_wef_agw_waf_configuration_firewall_mode
    rule_set_type    = local.agw.waf_config.rule_set_type.owasp
    rule_set_version = local.agw.waf_config.rule_set_version.v320
  }

  autoscale_configuration {
    min_capacity = var.rg_pri_wef_agw_autoscale_min_capacity
    max_capacity = var.rg_pri_wef_agw_autoscale_max_capacity
  }

  gateway_ip_configuration {
    name      = "gw-sub-ip-config"
    subnet_id = "${azurerm_virtual_network.rg_pri_hub_vn.id}/subnets/${azurerm_subnet.rg_pri_hub_vn_wef_agw_sub.name}"
  }

  frontend_ip_configuration {
    name                 = "fe-ip-config-01"
    public_ip_address_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
  }

  frontend_ip_configuration {
    name                          = "fe-ip-config-02"
    subnet_id                     = azurerm_subnet.rg_pri_hub_vn_wef_agw_sub.id
    private_ip_address            = cidrhost(azurerm_subnet.rg_pri_hub_vn_wef_agw_sub.address_prefixes[0], 5)
    private_ip_address_allocation = local.agw.private_ip_address_allocations.static
  }


  frontend_port {
    name = "fe-http-port-80"
    port = 80
  }
  frontend_port {
    name = "fe-https-port-443"
    port = 443
  }

  frontend_port {
    name = "fe-https-port-8443"
    port = 8443
  }

  frontend_port {
    name = "fe-https-port-4443"
    port = 4443
  }

  ssl_certificate {
    name     = "prv-cert-ssl-wef"
    data     = var.wef_cert_value
    password = var.wef_cert_password
  }

  ssl_certificate {
    name     = "prv-cert-ssl-wif"
    data     = var.wif_cert_value
    password = var.wif_cert_password
  }

  #============================================ LISTENERS ==============================================#

  # MB_CONFIG:START
  http_listener {
    name                           = "https-lstn-mb-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.mb_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  http_listener {
    name                           = "http-lstn-mb-80"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-http-port-80"
    protocol                       = "Http"
    require_sni                    = false
    host_name                      = local.app_custom_domains.mb_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  backend_address_pool {
    name = "wef-mb-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wef-mb-prb-02"
    host                = local.app_custom_domains.mb_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-mb-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wef-mb-prb-02"
    host_name             = local.app_custom_domains.mb_app
  }
  backend_http_settings {
    name                  = "be-http-st-mb-01"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    host_name             = local.app_custom_domains.mb_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-mb-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-mb-443"
    backend_address_pool_name  = "wef-mb-be-ap-01"
    backend_http_settings_name = "be-https-st-mb-01"
    priority                   = 300
    rewrite_rule_set_name      = "rrs-block-404"
  }
  request_routing_rule {
    name                        = "rq-rt-rl-mb-01"
    rule_type                   = "Basic"
    http_listener_name          = "http-lstn-mb-80"
    redirect_configuration_name = "rq-rd-cfg-mb-01"
    priority                    = 290
    rewrite_rule_set_name       = "rrs-block-404"
  }
  redirect_configuration {
    name                 = "rq-rd-cfg-mb-01"
    redirect_type        = "Permanent"
    target_listener_name = "https-lstn-mb-443"
    include_path         = true
    include_query_string = true
  }
  # MB_CONFIG:END

  # SVC_CONFIG:START
  http_listener {
    name                           = "https-lstn-svc-8443"
    frontend_ip_configuration_name = "fe-ip-config-02"
    frontend_port_name             = "fe-https-port-8443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wif"
    host_name                      = local.app_custom_domains.svc_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }

  backend_address_pool {
    name = "wif-svc-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wif-svc-prb-01"
    host                = local.app_custom_domains.svc_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-svc-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wif-svc-prb-01"
    host_name             = local.app_custom_domains.svc_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-svc-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-svc-8443"
    backend_address_pool_name  = "wif-svc-be-ap-01"
    backend_http_settings_name = "be-https-st-svc-01"
    priority                   = 310
    rewrite_rule_set_name      = "rrs-block-404"
  }
  # SVC_CONFIG:END

  # SOTP_CONFIG:START
  # http_listener {
  #   name                           = "https-lstn-sotp-443"
  #   frontend_ip_configuration_name = "fe-ip-config-01"
  #   frontend_port_name             = "fe-https-port-443"
  #   protocol                       = "Https"
  #   require_sni                    = true
  #   ssl_certificate_name           = "prv-cert-ssl-wef"
  #   host_name                      = local.app_custom_domains.sotp_app


  #   custom_error_configuration {
  #     status_code           = "HttpStatus403"
  #     custom_error_page_url = local.static_maintenance_page
  #   }

  #   custom_error_configuration {
  #     status_code           = "HttpStatus502"
  #     custom_error_page_url = local.static_maintenance_page
  #   }
  # }
  # http_listener {
  #   name                           = "http-lstn-sotp-80"
  #   frontend_ip_configuration_name = "fe-ip-config-01"
  #   frontend_port_name             = "fe-http-port-80"
  #   protocol                       = "Http"
  #   require_sni                    = false
  #   host_name                      = local.app_custom_domains.sotp_app


  #   custom_error_configuration {
  #     status_code           = "HttpStatus403"
  #     custom_error_page_url = local.static_maintenance_page
  #   }

  #   custom_error_configuration {
  #     status_code           = "HttpStatus502"
  #     custom_error_page_url = local.static_maintenance_page
  #   }
  # }
  # backend_address_pool {
  #   name = "wef-sotp-be-ap-01"
  #   ip_addresses = [
  #     data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address
  #   ]
  # }
  # probe {
  #   name                = "wef-sotp-prb-01"
  #   host                = local.app_custom_domains.sotp_app
  #   protocol            = "Https"
  #   path                = local.vc_app_monitor_path
  #   interval            = 30
  #   timeout             = 60
  #   unhealthy_threshold = 3

  #   match {
  #     body        = ""
  #     status_code = ["200"]
  #   }
  # }
  # backend_http_settings {
  #   name                  = "be-https-st-sotp-01"
  #   cookie_based_affinity = "Disabled"
  #   port                  = 443
  #   protocol              = "Https"
  #   request_timeout       = 60
  #   probe_name            = "wef-sotp-prb-01"
  #   host_name             = local.app_custom_domains.sotp_app
  # }
  # backend_http_settings {
  #   name                  = "be-http-st-sotp-01"
  #   cookie_based_affinity = "Disabled"
  #   port                  = 80
  #   protocol              = "Http"
  #   request_timeout       = 60
  #   host_name             = local.app_custom_domains.sotp_app
  # }
  # request_routing_rule {
  #   name                       = "rq-rt-rl-sotp-02"
  #   rule_type                  = "Basic"
  #   http_listener_name         = "https-lstn-sotp-443"
  #   backend_address_pool_name  = "wef-sotp-be-ap-01"
  #   backend_http_settings_name = "be-https-st-sotp-01"
  #   priority                   = 340
  #   rewrite_rule_set_name = "rrs-block-404"
  # }
  # request_routing_rule {
  #   name                        = "rq-rt-rl-sotp-01"
  #   rule_type                   = "Basic"
  #   http_listener_name          = "http-lstn-sotp-80"
  #   redirect_configuration_name = "rq-rd-cfg-sotp-01"
  #   priority                    = 330
  #   rewrite_rule_set_name = "rrs-block-404"
  # }
  # redirect_configuration {
  #   name                 = "rq-rd-cfg-sotp-01"
  #   redirect_type        = "Permanent"
  #   target_listener_name = "https-lstn-sotp-443"
  #   include_path         = true
  #   include_query_string = true
  # }
  # SOTP_CONFIG:END

  # IB_CONFIG:START
  http_listener {
    name                           = "https-lstn-ib-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.ib_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  http_listener {
    name                           = "http-lstn-ib-80"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-http-port-80"
    protocol                       = "Http"
    require_sni                    = false
    host_name                      = local.app_custom_domains.ib_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  backend_address_pool {
    name = "wef-ib-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wef-ib-prb-02"
    host                = local.app_custom_domains.ib_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-ib-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wef-ib-prb-02"
    host_name             = local.app_custom_domains.ib_app
  }
  backend_http_settings {
    name                  = "be-http-st-ib-01"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    host_name             = local.app_custom_domains.ib_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-ib-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-ib-443"
    backend_address_pool_name  = "wef-ib-be-ap-01"
    backend_http_settings_name = "be-https-st-ib-01"
    priority                   = 360
    rewrite_rule_set_name      = "rrs-block-404"
  }
  request_routing_rule {
    name                        = "rq-rt-rl-ib-01"
    rule_type                   = "Basic"
    http_listener_name          = "http-lstn-ib-80"
    redirect_configuration_name = "rq-rd-cfg-ib-01"
    priority                    = 350
    rewrite_rule_set_name       = "rrs-block-404"
  }
  redirect_configuration {
    name                 = "rq-rd-cfg-ib-01"
    redirect_type        = "Permanent"
    target_listener_name = "https-lstn-ib-443"
    include_path         = true
    include_query_string = true
  }
  # IB_CONFIG:END

  #PSD2_CONFIG:START
  http_listener {
    name                           = "https-lstn-psd2-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.psd_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  http_listener {
    name                           = "http-lstn-psd2-80"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-http-port-80"
    protocol                       = "Http"
    require_sni                    = false
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.psd_app

    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }


  backend_address_pool {
    name = "wef-psd2-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wef-psd2-prb-02"
    host                = local.app_custom_domains.psd_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-psd2-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wef-psd2-prb-02"
    host_name             = local.app_custom_domains.psd_app
  }

  backend_http_settings {
    name                  = "be-http-st-psd2-01"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    host_name             = local.app_custom_domains.psd_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-psd2-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-psd2-443"
    backend_address_pool_name  = "wef-psd2-be-ap-01"
    backend_http_settings_name = "be-https-st-psd2-01"
    priority                   = 380
    rewrite_rule_set_name      = "rrs-block-404"
  }

  request_routing_rule {
    name                        = "rq-rt-rl-psd2-01"
    rule_type                   = "Basic"
    http_listener_name          = "http-lstn-psd2-80"
    redirect_configuration_name = "rq-rd-cfg-psd2-01"
    priority                    = 370
    rewrite_rule_set_name       = "rrs-block-404"
  }
  redirect_configuration {
    name                 = "rq-rd-cfg-psd2-01"
    redirect_type        = "Permanent"
    target_listener_name = "https-lstn-psd2-443"
    include_path         = true
    include_query_string = true
  }


  #PSD2_CONFIG:END

  # PSD2_DEV_CONFIG:START
  http_listener {
    name                           = "https-lstn-psd2dev-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.psd_dev_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  http_listener {
    name                           = "http-lstn-psd2dev-80"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-http-port-80"
    protocol                       = "Http"
    require_sni                    = false
    host_name                      = local.app_custom_domains.psd_dev_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }

  backend_address_pool {
    name = "wef-psd2dev-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wef-psd2dev-prb-02"
    host                = local.app_custom_domains.psd_dev_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-psd2dev-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wef-psd2dev-prb-02"
    host_name             = local.app_custom_domains.psd_dev_app
  }
  backend_http_settings {
    name                  = "be-http-st-psd2dev-01"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    host_name             = local.app_custom_domains.psd_dev_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-psd2dev-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-psd2dev-443"
    backend_address_pool_name  = "wef-psd2dev-be-ap-01"
    backend_http_settings_name = "be-https-st-psd2dev-01"
    priority                   = 400
    rewrite_rule_set_name      = "rrs-block-404"
  }
  request_routing_rule {
    name                        = "rq-rt-rl-psd2dev-01"
    rule_type                   = "Basic"
    http_listener_name          = "http-lstn-psd2dev-80"
    redirect_configuration_name = "rq-rd-cfg-psd2dev-01"
    priority                    = 390
    rewrite_rule_set_name       = "rrs-block-404"
  }
  redirect_configuration {
    name                 = "rq-rd-cfg-psd2dev-01"
    redirect_type        = "Permanent"
    target_listener_name = "https-lstn-psd2dev-443"
    include_path         = true
    include_query_string = true
  }
  # PSD2_CONFIG:END


  # VC_BO_CONFIG:START
  http_listener {
    name                           = "https-lstn-vc-bo-4443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-4443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wif"
    host_name                      = local.app_custom_domains.bo_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }


    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  backend_address_pool {
    name = "wif-vc-bo-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wif-vc-bo-prb-01"
    host                = local.app_custom_domains.bo_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-vc-bo-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wif-vc-bo-prb-01"
    host_name             = local.app_custom_domains.bo_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-vc-bo-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-vc-bo-4443"
    backend_address_pool_name  = "wif-vc-bo-be-ap-01"
    backend_http_settings_name = "be-https-st-vc-bo-01"
    priority                   = 420
    rewrite_rule_set_name      = "rrs-block-404"
  }
  # VC_BO_CONFIG:END


  # VC_BO_CONFIG 443:START
  http_listener {
    name                           = "https-lstn-vc-bo-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wif"
    host_name                      = local.app_custom_domains.bo_app
    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }
    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  backend_address_pool {
    name = "wif-vc-bo-be-ap-01-443"
    ip_addresses = [
      data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wif-vc-bo-prb-01-443"
    host                = local.app_custom_domains.bo_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3
    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-vc-bo-01-443"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wif-vc-bo-prb-01-443"
    host_name             = local.app_custom_domains.bo_app
  }

  request_routing_rule {
    name                       = "rq-rt-rl-vc-bo-02-443"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-vc-bo-443"
    backend_address_pool_name  = "wif-vc-bo-be-ap-01-443"
    backend_http_settings_name = "be-https-st-vc-bo-01-443"
    priority                   = 410
    rewrite_rule_set_name      = "rrs-block-404"
  }

  # # VC_BO_CONFIG 443:END


  rewrite_rule_set {
    name = "rrs-block-404"
    rewrite_rule {
      name          = "rr-block-404"
      rule_sequence = 1
      condition {
        variable    = "var_request_uri"
        pattern     = "/hcdetailed|/hc|/liveness|/metrics"
        ignore_case = true
        negate      = false
      }
      url {
        path = "/notfound"
      }
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Application Gateway"
  }
}

#-- 


resource "azurerm_application_gateway" "rg_sec_wef_agw" {
  name                = "${local.resource_prefix_rg_sec}-wef-agw-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location
  enable_http2        = true

  sku {
    name = var.rg_sec_wef_agw_sku_name
    tier = var.rg_sec_wef_agw_sku_tier
  }

  identity {
    type = local.resource_identity_type.user_assigned

    identity_ids = [
      azurerm_user_assigned_identity.rg_sec_wef_agw_usr_asgn_id.id
    ]
  }

  ssl_policy {
    policy_type = local.agw.ssl_policy.policy_type.predefined
    policy_name = local.agw.ssl_policy.policy_name.appGwSslPolicy20220101S
  }

  waf_configuration {
    enabled          = true
    firewall_mode    = var.rg_sec_wef_agw_waf_configuration_firewall_mode
    rule_set_type    = local.agw.waf_config.rule_set_type.owasp
    rule_set_version = local.agw.waf_config.rule_set_version.v320
  }

  autoscale_configuration {
    min_capacity = var.rg_sec_wef_agw_autoscale_min_capacity
    max_capacity = var.rg_sec_wef_agw_autoscale_max_capacity
  }

  gateway_ip_configuration {
    name      = "gw-sub-ip-config"
    subnet_id = "${azurerm_virtual_network.rg_sec_hub_vn.id}/subnets/${azurerm_subnet.rg_sec_hub_vn_wef_agw_sub.name}"
  }

  frontend_ip_configuration {
    name                 = "fe-ip-config-01"
    public_ip_address_id = azurerm_public_ip.rg_sec_wef_agw_pip.id
  }

  frontend_ip_configuration {
    name                          = "fe-ip-config-02"
    subnet_id                     = azurerm_subnet.rg_sec_hub_vn_wef_agw_sub.id
    private_ip_address            = cidrhost(azurerm_subnet.rg_sec_hub_vn_wef_agw_sub.address_prefixes[0], 5)
    private_ip_address_allocation = local.agw.private_ip_address_allocations.static
  }


  frontend_port {
    name = "fe-http-port-80"
    port = 80
  }
  frontend_port {
    name = "fe-https-port-443"
    port = 443
  }

  frontend_port {
    name = "fe-https-port-8443"
    port = 8443
  }

  frontend_port {
    name = "fe-https-port-4443"
    port = 4443
  }

  ssl_certificate {
    name     = "prv-cert-ssl-wef"
    data     = var.wef_cert_value
    password = var.wef_cert_password
  }

  ssl_certificate {
    name     = "prv-cert-ssl-wif"
    data     = var.wif_cert_value
    password = var.wif_cert_password
  }

  #============================================ LISTENERS ==============================================#

  # MB_CONFIG:START
  http_listener {
    name                           = "https-lstn-mb-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.mb_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  http_listener {
    name                           = "http-lstn-mb-80"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-http-port-80"
    protocol                       = "Http"
    require_sni                    = false
    host_name                      = local.app_custom_domains.mb_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  backend_address_pool {
    name = "wef-mb-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wef-mb-prb-02"
    host                = local.app_custom_domains.mb_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-mb-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wef-mb-prb-02"
    host_name             = local.app_custom_domains.mb_app
  }
  backend_http_settings {
    name                  = "be-http-st-mb-01"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    host_name             = local.app_custom_domains.mb_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-mb-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-mb-443"
    backend_address_pool_name  = "wef-mb-be-ap-01"
    backend_http_settings_name = "be-https-st-mb-01"
    priority                   = 300
    rewrite_rule_set_name      = "rrs-block-404"
  }
  request_routing_rule {
    name                        = "rq-rt-rl-mb-01"
    rule_type                   = "Basic"
    http_listener_name          = "http-lstn-mb-80"
    redirect_configuration_name = "rq-rd-cfg-mb-01"
    priority                    = 290
    rewrite_rule_set_name       = "rrs-block-404"
  }
  redirect_configuration {
    name                 = "rq-rd-cfg-mb-01"
    redirect_type        = "Permanent"
    target_listener_name = "https-lstn-mb-443"
    include_path         = true
    include_query_string = true
  }
  # MB_CONFIG:END

  # SVC_CONFIG:START
  http_listener {
    name                           = "https-lstn-svc-8443"
    frontend_ip_configuration_name = "fe-ip-config-02"
    frontend_port_name             = "fe-https-port-8443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wif"
    host_name                      = local.app_custom_domains.svc_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }

  backend_address_pool {
    name = "wif-svc-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wif-svc-prb-01"
    host                = local.app_custom_domains.svc_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-svc-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wif-svc-prb-01"
    host_name             = local.app_custom_domains.svc_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-svc-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-svc-8443"
    backend_address_pool_name  = "wif-svc-be-ap-01"
    backend_http_settings_name = "be-https-st-svc-01"
    priority                   = 310
    rewrite_rule_set_name      = "rrs-block-404"
  }
  # SVC_CONFIG:END

  # SOTP_CONFIG:START
  # http_listener {
  #   name                           = "https-lstn-sotp-443"
  #   frontend_ip_configuration_name = "fe-ip-config-01"
  #   frontend_port_name             = "fe-https-port-443"
  #   protocol                       = "Https"
  #   require_sni                    = true
  #   ssl_certificate_name           = "prv-cert-ssl-wef"
  #   host_name                      = local.app_custom_domains.sotp_app


  #   custom_error_configuration {
  #     status_code           = "HttpStatus403"
  #     custom_error_page_url = local.static_maintenance_page
  #   }

  #   custom_error_configuration {
  #     status_code           = "HttpStatus502"
  #     custom_error_page_url = local.static_maintenance_page
  #   }
  # }
  # http_listener {
  #   name                           = "http-lstn-sotp-80"
  #   frontend_ip_configuration_name = "fe-ip-config-01"
  #   frontend_port_name             = "fe-http-port-80"
  #   protocol                       = "Http"
  #   require_sni                    = false
  #   host_name                      = local.app_custom_domains.sotp_app


  #   custom_error_configuration {
  #     status_code           = "HttpStatus403"
  #     custom_error_page_url = local.static_maintenance_page
  #   }

  #   custom_error_configuration {
  #     status_code           = "HttpStatus502"
  #     custom_error_page_url = local.static_maintenance_page
  #   }
  # }
  # backend_address_pool {
  #   name = "wef-sotp-be-ap-01"
  #   ip_addresses = [
  #     data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address
  #   ]
  # }
  # probe {
  #   name                = "wef-sotp-prb-01"
  #   host                = local.app_custom_domains.sotp_app
  #   protocol            = "Https"
  #   path                = local.vc_app_monitor_path
  #   interval            = 30
  #   timeout             = 60
  #   unhealthy_threshold = 3

  #   match {
  #     body        = ""
  #     status_code = ["200"]
  #   }
  # }
  # backend_http_settings {
  #   name                  = "be-https-st-sotp-01"
  #   cookie_based_affinity = "Disabled"
  #   port                  = 443
  #   protocol              = "Https"
  #   request_timeout       = 60
  #   probe_name            = "wef-sotp-prb-01"
  #   host_name             = local.app_custom_domains.sotp_app
  # }
  # backend_http_settings {
  #   name                  = "be-http-st-sotp-01"
  #   cookie_based_affinity = "Disabled"
  #   port                  = 80
  #   protocol              = "Http"
  #   request_timeout       = 60
  #   host_name             = local.app_custom_domains.sotp_app
  # }
  # request_routing_rule {
  #   name                       = "rq-rt-rl-sotp-02"
  #   rule_type                  = "Basic"
  #   http_listener_name         = "https-lstn-sotp-443"
  #   backend_address_pool_name  = "wef-sotp-be-ap-01"
  #   backend_http_settings_name = "be-https-st-sotp-01"
  #   priority                   = 340
  #   rewrite_rule_set_name = "rrs-block-404"
  # }
  # request_routing_rule {
  #   name                        = "rq-rt-rl-sotp-01"
  #   rule_type                   = "Basic"
  #   http_listener_name          = "http-lstn-sotp-80"
  #   redirect_configuration_name = "rq-rd-cfg-sotp-01"
  #   priority                    = 330
  #   rewrite_rule_set_name = "rrs-block-404"
  # }
  # redirect_configuration {
  #   name                 = "rq-rd-cfg-sotp-01"
  #   redirect_type        = "Permanent"
  #   target_listener_name = "https-lstn-sotp-443"
  #   include_path         = true
  #   include_query_string = true
  # }
  # SOTP_CONFIG:END

  # IB_CONFIG:START
  http_listener {
    name                           = "https-lstn-ib-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.ib_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  http_listener {
    name                           = "http-lstn-ib-80"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-http-port-80"
    protocol                       = "Http"
    require_sni                    = false
    host_name                      = local.app_custom_domains.ib_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  backend_address_pool {
    name = "wef-ib-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wef-ib-prb-02"
    host                = local.app_custom_domains.ib_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-ib-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wef-ib-prb-02"
    host_name             = local.app_custom_domains.ib_app
  }
  backend_http_settings {
    name                  = "be-http-st-ib-01"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    host_name             = local.app_custom_domains.ib_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-ib-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-ib-443"
    backend_address_pool_name  = "wef-ib-be-ap-01"
    backend_http_settings_name = "be-https-st-ib-01"
    priority                   = 360
    rewrite_rule_set_name      = "rrs-block-404"
  }
  request_routing_rule {
    name                        = "rq-rt-rl-ib-01"
    rule_type                   = "Basic"
    http_listener_name          = "http-lstn-ib-80"
    redirect_configuration_name = "rq-rd-cfg-ib-01"
    priority                    = 350
    rewrite_rule_set_name       = "rrs-block-404"
  }
  redirect_configuration {
    name                 = "rq-rd-cfg-ib-01"
    redirect_type        = "Permanent"
    target_listener_name = "https-lstn-ib-443"
    include_path         = true
    include_query_string = true
  }
  # IB_CONFIG:END

  #PSD2_CONFIG:START
  http_listener {
    name                           = "https-lstn-psd2-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.psd_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }

  http_listener {
    name                           = "http-lstn-psd2-80"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-http-port-80"
    protocol                       = "Http"
    require_sni                    = false
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.psd_app

    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }


  backend_address_pool {
    name = "wef-psd2-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wef-psd2-prb-02"
    host                = local.app_custom_domains.psd_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-psd2-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wef-psd2-prb-02"
    host_name             = local.app_custom_domains.psd_app
  }

  backend_http_settings {
    name                  = "be-http-st-psd2-01"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    host_name             = local.app_custom_domains.psd_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-psd2-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-psd2-443"
    backend_address_pool_name  = "wef-psd2-be-ap-01"
    backend_http_settings_name = "be-https-st-psd2-01"
    priority                   = 380
    rewrite_rule_set_name      = "rrs-block-404"
  }


  request_routing_rule {
    name                        = "rq-rt-rl-psd2-01"
    rule_type                   = "Basic"
    http_listener_name          = "http-lstn-psd2-80"
    redirect_configuration_name = "rq-rd-cfg-psd2-01"
    priority                    = 370
    rewrite_rule_set_name       = "rrs-block-404"
  }
  redirect_configuration {
    name                 = "rq-rd-cfg-psd2-01"
    redirect_type        = "Permanent"
    target_listener_name = "https-lstn-psd2-443"
    include_path         = true
    include_query_string = true
  }
  #PSD2_CONFIG:END

  # PSD2_CONFIG:START
  http_listener {
    name                           = "https-lstn-psd2dev-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wef"
    host_name                      = local.app_custom_domains.psd_dev_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  http_listener {
    name                           = "http-lstn-psd2dev-80"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-http-port-80"
    protocol                       = "Http"
    require_sni                    = false
    host_name                      = local.app_custom_domains.psd_dev_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }

    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }

  backend_address_pool {
    name = "wef-psd2dev-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wef-psd2dev-prb-02"
    host                = local.app_custom_domains.psd_dev_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-psd2dev-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wef-psd2dev-prb-02"
    host_name             = local.app_custom_domains.psd_dev_app
  }
  backend_http_settings {
    name                  = "be-http-st-psd2dev-01"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    host_name             = local.app_custom_domains.psd_dev_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-psd2dev-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-psd2dev-443"
    backend_address_pool_name  = "wef-psd2dev-be-ap-01"
    backend_http_settings_name = "be-https-st-psd2dev-01"
    priority                   = 400
    rewrite_rule_set_name      = "rrs-block-404"
  }
  request_routing_rule {
    name                        = "rq-rt-rl-psd2dev-01"
    rule_type                   = "Basic"
    http_listener_name          = "http-lstn-psd2dev-80"
    redirect_configuration_name = "rq-rd-cfg-psd2dev-01"
    priority                    = 390
    rewrite_rule_set_name       = "rrs-block-404"
  }
  redirect_configuration {
    name                 = "rq-rd-cfg-psd2dev-01"
    redirect_type        = "Permanent"
    target_listener_name = "https-lstn-psd2dev-443"
    include_path         = true
    include_query_string = true
  }
  # PSD2_CONFIG:END


  # VC_BO_CONFIG:START
  http_listener {
    name                           = "https-lstn-vc-bo-4443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-4443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wif"
    host_name                      = local.app_custom_domains.bo_app


    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }


    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  backend_address_pool {
    name = "wif-vc-bo-be-ap-01"
    ip_addresses = [
      data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wif-vc-bo-prb-01"
    host                = local.app_custom_domains.bo_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3

    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-vc-bo-01"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wif-vc-bo-prb-01"
    host_name             = local.app_custom_domains.bo_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-vc-bo-02"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-vc-bo-4443"
    backend_address_pool_name  = "wif-vc-bo-be-ap-01"
    backend_http_settings_name = "be-https-st-vc-bo-01"
    priority                   = 420
    rewrite_rule_set_name      = "rrs-block-404"
  }
  # VC_BO_CONFIG:END



  # VC_BO_CONFIG 443:START
  http_listener {
    name                           = "https-lstn-vc-bo-443"
    frontend_ip_configuration_name = "fe-ip-config-01"
    frontend_port_name             = "fe-https-port-443"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = "prv-cert-ssl-wif"
    host_name                      = local.app_custom_domains.bo_app
    custom_error_configuration {
      status_code           = "HttpStatus403"
      custom_error_page_url = local.static_maintenance_page
    }
    custom_error_configuration {
      status_code           = "HttpStatus502"
      custom_error_page_url = local.static_maintenance_page
    }
  }
  backend_address_pool {
    name = "wif-vc-bo-be-ap-01-443"
    ip_addresses = [
      data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address
    ]
  }
  probe {
    name                = "wif-vc-bo-prb-01-443"
    host                = local.app_custom_domains.bo_app
    protocol            = "Https"
    path                = local.vc_app_monitor_path
    interval            = 30
    timeout             = 60
    unhealthy_threshold = 3
    match {
      body        = ""
      status_code = ["200"]
    }
  }
  backend_http_settings {
    name                  = "be-https-st-vc-bo-01-443"
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 60
    probe_name            = "wif-vc-bo-prb-01-443"
    host_name             = local.app_custom_domains.bo_app
  }
  request_routing_rule {
    name                       = "rq-rt-rl-vc-bo-02-443"
    rule_type                  = "Basic"
    http_listener_name         = "https-lstn-vc-bo-443"
    backend_address_pool_name  = "wif-vc-bo-be-ap-01-443"
    backend_http_settings_name = "be-https-st-vc-bo-01-443"
    priority                   = 410
    rewrite_rule_set_name      = "rrs-block-404"
  }
  #VC_BO_CONFIG 443:END


  rewrite_rule_set {
    name = "rrs-block-404"
    rewrite_rule {
      name          = "rr-block-404"
      rule_sequence = 1
      condition {
        variable    = "var_request_uri"
        pattern     = "/hcdetailed|/hc|/liveness|/metrics"
        ignore_case = true
        negate      = false
      }
      url {
        path = "/notfound"
      }
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Application Gateway"
  }
}

