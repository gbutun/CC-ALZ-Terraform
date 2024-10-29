# TODO: Will uncomment when Ziraat sends Certificates and DNS 
resource "azurerm_private_dns_zone_virtual_network_link" "rg_pri_spk_vn_rg_pri_prv_dns_zone_ziraatbank_de_link" {
  name                  = "${local.resource_prefix_rg_pri}-spk-vn-ziraatbank-de-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_pri.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_pri_prv_dns_zone_ziraatbank_de.name
  virtual_network_id    = azurerm_virtual_network.rg_pri_spk_vn.id
  registration_enabled  = true

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet - Private DNS Zone Link (${var.domain_name_suffix})"
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "rg_pri_spk_vn_rg_pri_prv_dns_zone_privatelink_database_windows_net_link" {
  name                  = "${local.resource_prefix_rg_pri}-spk-vn-db-win-net-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_pri.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_pri_prv_dns_zone_privatelink_database_windows_net.name
  virtual_network_id    = azurerm_virtual_network.rg_pri_spk_vn.id
  registration_enabled  = false

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet  - Private DNS Zone Link (Database)"
  }
}


resource "azurerm_private_dns_zone_virtual_network_link" "rg_pri_spk_vn_rg_pri_prv_dns_zone_privatelink_azmk8s_io_link" {
  name                  = "${local.resource_prefix_rg_pri}-spk-vn-aks-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_pri.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_pri_prv_dns_zone_privatelink_azmk8s_io.name
  virtual_network_id    = azurerm_virtual_network.rg_pri_spk_vn.id
  registration_enabled  = false

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet  - Private DNS Zone Link (AKS)"
  }
}


resource "azurerm_private_dns_zone_virtual_network_link" "rg_pri_spk_vn_rg_pri_prv_dns_zone_octupus_saas_veripark_com_link" {
  name                  = "${local.resource_prefix_rg_pri}-spk-vn-oct-saas-vrp-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_pri.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_pri_prv_dns_zone_octupus_saas_veripark_com.name
  virtual_network_id    = azurerm_virtual_network.rg_pri_spk_vn.id
  registration_enabled  = false

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet  - Private DNS Zone Link (OctupusSaaS VeriPark)"
  }
}


#--

# TODO: Will uncomment when Ziraat sends Certificates and DNS 
#TODO: Check DNS for ziraatbank. we can use zag.veripark.com for non-prod
resource "azurerm_private_dns_zone_virtual_network_link" "rg_sec_spk_vn_rg_sec_prv_dns_zone_ziraatbank_de_link" {
  name                  = "${local.resource_prefix_rg_sec}-spk-vn-ziraatbank-de-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_sec.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_sec_prv_dns_zone_ziraatbank_de.name
  virtual_network_id    = azurerm_virtual_network.rg_sec_spk_vn.id
  registration_enabled  = true

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet - Private DNS Zone Link (${var.domain_name_suffix})"
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "rg_sec_spk_vn_rg_sec_prv_dns_zone_privatelink_database_windows_net_link" {
  name                  = "${local.resource_prefix_rg_sec}-spk-vn-db-win-net-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_sec.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_sec_prv_dns_zone_privatelink_database_windows_net.name
  virtual_network_id    = azurerm_virtual_network.rg_sec_spk_vn.id
  registration_enabled  = false

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet  - Private DNS Zone Link (Database)"
  }
}


resource "azurerm_private_dns_zone_virtual_network_link" "rg_sec_spk_vn_rg_sec_prv_dns_zone_privatelink_azmk8s_io_link" {
  name                  = "${local.resource_prefix_rg_sec}-spk-vn-aks-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_sec.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_sec_prv_dns_zone_privatelink_azmk8s_io.name
  virtual_network_id    = azurerm_virtual_network.rg_sec_spk_vn.id
  registration_enabled  = false

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet  - Private DNS Zone Link (AKS)"
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "rg_pri_spk_vn_rg_sec_prv_dns_zone_privatelink_azmk8s_io_link" {
  name                  = "${local.resource_prefix_rg_pri}-spk-vn-sec-aks-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_sec.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_sec_prv_dns_zone_privatelink_azmk8s_io.name
  virtual_network_id    = azurerm_virtual_network.rg_pri_spk_vn.id
  registration_enabled  = false

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet  - Secondary Private DNS Zone Link (AKS)"
  }
}


resource "azurerm_private_dns_zone_virtual_network_link" "rg_sec_spk_vn_rg_sec_prv_dns_zone_octupus_saas_veripark_com_link" {
  name                  = "${local.resource_prefix_rg_sec}-spk-vn-oct-saas-vrp-dns-zn-lnk-${var.product_unique}"
  resource_group_name   = azurerm_resource_group.rg_sec.name
  private_dns_zone_name = azurerm_private_dns_zone.rg_sec_prv_dns_zone_octupus_saas_veripark_com.name
  virtual_network_id    = azurerm_virtual_network.rg_sec_spk_vn.id
  registration_enabled  = false

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Spoke VNet  - Private DNS Zone Link (OctupusSaaS VeriPark)"
  }
}


