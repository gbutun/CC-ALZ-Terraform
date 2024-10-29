locals {
  certificate_mtls = {
    issue_name         = "Self"
    exportable         = true
    key_size           = 2048
    key_type           = "RSA"
    reuse_key          = false
    action_type        = "EmailContacts"
    days_before_expiry = 30
    content_type       = "application/x-pkcs12"
  }

  certificate_ssl = {
    issue_name         = "Self"
    exportable         = true
    key_size           = 2048
    key_type           = "RSA"
    reuse_key          = false
    action_type        = "EmailContacts"
    days_before_expiry = 30
    content_type       = "application/x-pkcs12"
  }

  certificate_auto = {
    issue_name         = "Self"
    exportable         = true
    key_size           = 2048
    key_type           = "RSA"
    reuse_key          = false
    action_type        = "EmailContacts"
    days_before_expiry = 30
    content_type       = "application/x-pkcs12"
  }
}

resource "azurerm_key_vault_certificate" "rg_pri_agw_kv_wef_cert" {
  name      = "wef-cert"
  key_vault_id = azurerm_key_vault.rg_pri_agw_kv.id

  certificate {
    contents = var.wef_cert_value
    password = var.wef_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate for External Facing Applications"
  }
}

resource "azurerm_key_vault_certificate" "rg_pri_agw_kv_wif_cert" {
  name      = "wif-cert"
  key_vault_id = azurerm_key_vault.rg_pri_agw_kv.id

  certificate {
    contents = var.wif_cert_value
    password = var.wif_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Internal Facing Applications"
  }
}

resource "azurerm_key_vault_certificate" "rg_pri_kub_kv_wef_cert" {
  name      = "wef-cert"
  key_vault_id = azurerm_key_vault.rg_pri_kub_kv.id

  certificate {
    contents = var.wef_cert_value
    password = var.wef_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate for External Facing Applications"
  }
}


resource "azurerm_key_vault_certificate" "rg_pri_kub_kv_wif_cert" {
  name      = "wif-cert"
  key_vault_id = azurerm_key_vault.rg_pri_kub_kv.id

  certificate {
    contents = var.wif_cert_value
    password = var.wif_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Internal Facing Applications"
  }
}


resource "azurerm_key_vault_certificate" "rg_pri_kub_kv_argo_cd_cert" {
  name      = "argo-cd-cert"
  key_vault_id = azurerm_key_vault.rg_pri_kub_kv.id

  certificate {
    contents = var.argo_cert_value
    password = var.argo_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Argo CD API"
  }
}

#-- 

resource "azurerm_key_vault_certificate" "rg_sec_agw_kv_wef_cert" {
  name      = "wef-cert"
  key_vault_id = azurerm_key_vault.rg_sec_agw_kv.id

  certificate {
    contents = var.wef_cert_value
    password = var.wef_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate for External Facing Applications"
  }
}

resource "azurerm_key_vault_certificate" "rg_sec_agw_kv_wif_cert" {
  name      = "wif-cert"
  key_vault_id = azurerm_key_vault.rg_sec_agw_kv.id

  certificate {
    contents = var.wif_cert_value
    password = var.wif_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Internal Facing Applications"
  }
}

resource "azurerm_key_vault_certificate" "rg_sec_kub_kv_wef_cert" {
  name      = "wef-cert"
  key_vault_id = azurerm_key_vault.rg_sec_kub_kv.id

  certificate {
    contents = var.wef_cert_value
    password = var.wef_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate for External Facing Applications"
  }
}

resource "azurerm_key_vault_certificate" "rg_sec_kub_kv_wif_cert" {
  name      = "wif-cert"
  key_vault_id = azurerm_key_vault.rg_sec_kub_kv.id

  certificate {
    contents = var.wif_cert_value
    password = var.wif_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Internal Facing Applications"
  }
}

resource "azurerm_key_vault_certificate" "rg_sec_kub_kv_argo_cd_cert" {
  name      = "argo-cd-cert"
  key_vault_id = azurerm_key_vault.rg_sec_kub_kv.id

  certificate {
    contents = var.argo_cert_value
    password = var.argo_cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = local.certificate_ssl.issue_name
    }

    key_properties {
      exportable = local.certificate_ssl.exportable
      key_size   = local.certificate_ssl.key_size
      key_type   = local.certificate_ssl.key_type
      reuse_key  = local.certificate_ssl.reuse_key
    }

    lifetime_action {
      action {
        action_type = local.certificate_ssl.action_type
      }

      trigger {
        days_before_expiry = local.certificate_ssl.days_before_expiry
      }
    }

    secret_properties {
      content_type = local.certificate_ssl.content_type
    }
  }
  
  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "SSL Certificate for Argo CD API"
  }
}