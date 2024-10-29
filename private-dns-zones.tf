locals {
  zone_records = {
    app = {
      ttl = 300
    },
    dc = {
      ttl = 600
    },
    private_link = {
      ttl = 600
    }
  }
}

resource "azurerm_private_dns_zone" "rg_pri_prv_dns_zone_ziraatbank_de" {
  name                = var.domain_name_suffix
  resource_group_name = azurerm_resource_group.rg_pri.name

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Private DNS Zone (${var.domain_name_suffix})"
  }
}

resource "azurerm_private_dns_zone" "rg_pri_prv_dns_zone_privatelink_database_windows_net" {
  name                = local.private_link_types.sql.suffix
  resource_group_name = azurerm_resource_group.rg_pri.name

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Private DNS Zone (${local.private_link_types.sql.suffix})"
  }
}

resource "azurerm_private_dns_zone" "rg_pri_prv_dns_zone_privatelink_azmk8s_io" {
  name                = "privatelink.${var.rg_pri_location_long}.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg_pri.name

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Private DNS Zone (AKS Cluster Primary Region)"
  }
}

resource "azurerm_private_dns_zone" "rg_pri_prv_dns_zone_octupus_saas_veripark_com" {
  name                = var.kub_mng_domain_name_suffix
  resource_group_name = azurerm_resource_group.rg_pri.name

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Private DNS Zone (Octupus SaaS VeriPark Primary Region)"
  }
}

#--

# TODO: Will uncomment when Ziraat sends Certificates and DNS 
resource "azurerm_private_dns_zone" "rg_sec_prv_dns_zone_ziraatbank_de" {
  name                = var.domain_name_suffix
  resource_group_name = azurerm_resource_group.rg_sec.name

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Private DNS Zone (${var.domain_name_suffix})"
  }
}

resource "azurerm_private_dns_zone" "rg_sec_prv_dns_zone_privatelink_database_windows_net" {
  name                = local.private_link_types.sql.suffix
  resource_group_name = azurerm_resource_group.rg_sec.name

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Private DNS Zone (${local.private_link_types.sql.suffix})"
  }
}

resource "azurerm_private_dns_zone" "rg_sec_prv_dns_zone_privatelink_azmk8s_io" {
  name                = "privatelink.${var.rg_sec_location_long}.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg_sec.name

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Private DNS Zone (AKS Cluster Primary Region)"
  }
}

resource "azurerm_private_dns_zone" "rg_sec_prv_dns_zone_octupus_saas_veripark_com" {
  name                = var.kub_mng_domain_name_suffix
  resource_group_name = azurerm_resource_group.rg_sec.name

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Private DNS Zone (Octupus SaaS VeriPark Secondary Region)"
  }
}