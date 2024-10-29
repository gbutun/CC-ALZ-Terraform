
locals {
  ps_scripts_path = "../ps-scripts"

  sql_scripts_path = "../sql-scripts"

  temps_path = "../temps"

  configs_path = "../configs"

  blobs_path = "../blobs"

  demo_prefix = var.is_demo ? var.demo_prefix : ""

  product_name_long = format("%s (%s)", var.product_name_long, var.environment_long)

  resource_prefix_rg_pri = "${local.demo_prefix}${var.environment_short}-${var.rg_pri_location_short}"

  resource_prefix_rg_sec = "${local.demo_prefix}${var.environment_short}-${var.rg_sec_location_short}"

  resource_prefix_rg_pri_only_environment_and_location = "${local.demo_prefix}${var.environment_short}${var.rg_pri_location_short}"

  resource_prefix_rg_sec_only_environment_and_location = "${local.demo_prefix}${var.environment_short}${var.rg_sec_location_short}"

  resource_prefix_rg_we_only_environment_and_location = "${local.demo_prefix}${var.environment_short}${var.rg_we_location_short}"

  resource_prefix_only_environment = "${local.demo_prefix}${var.environment_short}"

  monitoring_mail_dl_vrp = "ManagedServices@veripark.com"

  app_service_autoscale_alert_emails = [
    local.monitoring_mail_dl_vrp
  ]

  resource_identity_type = {
    system_assigned = "SystemAssigned"
    user_assigned   = "UserAssigned"
  }


  contacts = {
    veripark = {
      technology_services = {
        contact_email = "technology.services@veripark.com"
        contact_name  = "Technology Services"
        contact_phone = "+902122852234"
      }

      managed_services = {
        contact_email = "ManagedServices@veripark.com"
        contact_name  = "ManagedServices"
        contact_phone = "+35924928043"
      }
      ssl_admmin = {
        contact_email = "ssladmin@veripark.com"
        contact_name  = "SSL Admin"
        contact_phone = "+902122852234"
      }
    }
  }

  verichannel = {
    environments = {
      prod = "PRD"
    }
  }

  vc_app_monitor_path = "/readiness"

  app_custom_domains = {
    mb_app   = "mobile.${var.domain_name_suffix}",
    # sotp_app = "ext.sotp.${var.domain_name_suffix}",
    ib_app   = "online.${var.domain_name_suffix}",
    psd_app  = "psd2.${var.domain_name_suffix}"
    psd_dev_app  = "psd2dev.${var.domain_name_suffix}"
    svc_app  = "isa.${var.domain_name_suffix}",
    bo_app   = "bo.${var.domain_name_suffix}",
    hermes_api = "hermes.${var.domain_name_suffix}"
  }
}
