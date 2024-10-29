locals {
  kv_sku = {
    standard = "standard"
  }


  sa_kv = {
    enabled_for_deployment          = false
    enabled_for_disk_encryption     = true
    enabled_for_template_deployment = false
    enable_purge_protection         = true
    network_acls_default_action     = "Deny"
    network_acls_bypass             = "AzureServices"
  }
  agw_kv = {
    enabled_for_deployment          = false
    enabled_for_disk_encryption     = false
    enabled_for_template_deployment = false
    enable_purge_protection         = false
    network_acls_default_action     = "Deny"
    network_acls_bypass             = "AzureServices"
  }

  kub_kv = {
    enabled_for_deployment          = false
    enabled_for_disk_encryption     = false
    enabled_for_template_deployment = false
    enable_purge_protection         = false
    network_acls_default_action     = "Deny"
    network_acls_bypass             = "AzureServices"
  }

  app_kv = {
    enabled_for_deployment          = false
    enabled_for_disk_encryption     = false
    enabled_for_template_deployment = false
    enable_purge_protection         = false
    network_acls_default_action     = "Deny"
    network_acls_bypass             = "None"
  }

  vm_kv = {
    enabled_for_deployment          = false
    enabled_for_disk_encryption     = true
    enabled_for_template_deployment = false
    enable_purge_protection         = true
    network_acls_default_action     = "Deny"
    network_acls_bypass             = "AzureServices"
  }

  ops_kv = {
    enabled_for_deployment          = false
    enabled_for_disk_encryption     = false
    enabled_for_template_deployment = false
    enable_purge_protection         = false
    network_acls_default_action     = "Deny"
    network_acls_bypass             = "AzureServices"
  }

  tfv_kv = {
    enabled_for_deployment          = false
    enabled_for_disk_encryption     = false
    enabled_for_template_deployment = false
    enable_purge_protection         = false
    network_acls_default_action     = "Deny"
    network_acls_bypass             = "AzureServices"
  }

  auto_kv = {
    enabled_for_deployment          = false
    enabled_for_disk_encryption     = false
    enabled_for_template_deployment = false
    enable_purge_protection         = false
    network_acls_default_action     = "Deny"
    network_acls_bypass             = "AzureServices"
  }
}

resource "azurerm_key_vault" "rg_pri_tfv_kv" {
  name                            = "${local.resource_prefix_rg_pri}-tfv-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_pri.name
  location                        = azurerm_resource_group.rg_pri.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.vm_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.vm_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.vm_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.vm_kv.enable_purge_protection

  network_acls {
    default_action = local.vm_kv.network_acls_default_action
    bypass         = local.vm_kv.network_acls_bypass

    ip_rules = [var.ziraatag_hq_prod_lng_gateway_address]

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Used for storing and rotating terraform variables, solution certificates) (Release server)"
  }
}

resource "azurerm_key_vault" "rg_pri_vm_ops_kv" {
  name                            = "${local.resource_prefix_rg_pri}-ops-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_pri.name
  location                        = azurerm_resource_group.rg_pri.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.ops_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.ops_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.ops_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.ops_kv.enable_purge_protection

  network_acls {
    default_action = local.ops_kv.network_acls_default_action
    bypass         = local.ops_kv.network_acls_bypass

    ip_rules = concat(local.devops_svc_out_ip_addresses, local.vrp_devops_ips, local.z5b_devops_org_ips)

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Used for storing variables, deployment credentials and certificate)"
  }
}

resource "azurerm_key_vault" "rg_pri_cmk_enc_kv" {
  name                            = "${local.resource_prefix_rg_pri}-cmk-enc-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_pri.name
  location                        = azurerm_resource_group.rg_pri.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.sa_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.sa_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.sa_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.sa_kv.enable_purge_protection


  network_acls {
    default_action = local.sa_kv.network_acls_default_action
    bypass         = local.sa_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (CMK Storage Encryption)"
  }
}

resource "azurerm_key_vault" "rg_pri_agw_kv" {
  name                            = "${local.resource_prefix_rg_pri}-agw-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_pri.name
  location                        = azurerm_resource_group.rg_pri.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.agw_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.agw_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.agw_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.agw_kv.enable_purge_protection


  network_acls {
    default_action = local.agw_kv.network_acls_default_action
    bypass         = local.agw_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_hub_vn_wef_agw_sub.id,
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Application Gateway)"
  }
}

resource "azurerm_key_vault" "rg_pri_auto_kv" {
  name                            = "${local.resource_prefix_rg_pri}-auto-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_pri.name
  location                        = azurerm_resource_group.rg_pri.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.auto_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.auto_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.auto_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.auto_kv.enable_purge_protection


  network_acls {
    default_action = local.auto_kv.network_acls_default_action
    bypass         = local.auto_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Automation Account)"
  }
}


resource "azurerm_key_vault" "rg_pri_kub_kv" {
  name                            = "${local.resource_prefix_rg_pri}-kub-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_pri.name
  location                        = azurerm_resource_group.rg_pri.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.kub_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.kub_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.kub_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.kub_kv.enable_purge_protection

  network_acls {
    default_action = local.kub_kv.network_acls_default_action
    bypass         = local.kub_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_wl_sub.id,
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Azure Kubernetes Services - infrastructure secrets)"
  }
}

resource "azurerm_key_vault" "rg_pri_app_kv" {
  name                            = "${local.resource_prefix_rg_pri}-app-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_pri.name
  location                        = azurerm_resource_group.rg_pri.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.app_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.app_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.app_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.app_kv.enable_purge_protection

  network_acls {
    default_action = local.app_kv.network_acls_default_action
    bypass         = local.app_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_wl_sub.id,
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Azure Kubernetes Services - application secrets)"
  }
}

#--

resource "azurerm_key_vault" "rg_sec_tfv_kv" {
  name                            = "${local.resource_prefix_rg_sec}-tfv-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_sec.name
  location                        = azurerm_resource_group.rg_sec.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.vm_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.vm_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.vm_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.vm_kv.enable_purge_protection

  network_acls {
    default_action = local.vm_kv.network_acls_default_action
    bypass         = local.vm_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Used for storing and rotating terraform variables, solution certificates) (Release server)"
  }
}

resource "azurerm_key_vault" "rg_sec_vm_ops_kv" {
  name                            = "${local.resource_prefix_rg_sec}-ops-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_sec.name
  location                        = azurerm_resource_group.rg_sec.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.ops_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.ops_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.ops_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.ops_kv.enable_purge_protection

  network_acls {
    default_action = local.ops_kv.network_acls_default_action
    bypass         = local.ops_kv.network_acls_bypass

    ip_rules = concat(local.devops_svc_out_ip_addresses, local.vrp_devops_ips, local.z5b_devops_org_ips)

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Used for storing variables, deployment credentials and certificate)"
  }
}

resource "azurerm_key_vault" "rg_sec_cmk_enc_kv" {
  name                            = "${local.resource_prefix_rg_sec}-cmk-enc-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_sec.name
  location                        = azurerm_resource_group.rg_sec.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.sa_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.sa_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.sa_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.sa_kv.enable_purge_protection


  network_acls {
    default_action = local.sa_kv.network_acls_default_action
    bypass         = local.sa_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (CMK Storage Encryption)"
  }
}

resource "azurerm_key_vault" "rg_sec_agw_kv" {
  name                            = "${local.resource_prefix_rg_sec}-agw-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_sec.name
  location                        = azurerm_resource_group.rg_sec.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.agw_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.agw_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.agw_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.agw_kv.enable_purge_protection


  network_acls {
    default_action = local.agw_kv.network_acls_default_action
    bypass         = local.agw_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_hub_vn_wef_agw_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Application Gateway)"
  }
}

resource "azurerm_key_vault" "rg_sec_auto_kv" {
  name                            = "${local.resource_prefix_rg_sec}-auto-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_sec.name
  location                        = azurerm_resource_group.rg_sec.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.auto_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.auto_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.auto_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.auto_kv.enable_purge_protection


  network_acls {
    default_action = local.auto_kv.network_acls_default_action
    bypass         = local.auto_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Automation Account)"
  }
}


resource "azurerm_key_vault" "rg_sec_kub_kv" {
  name                            = "${local.resource_prefix_rg_sec}-kub-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_sec.name
  location                        = azurerm_resource_group.rg_sec.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.kub_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.kub_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.kub_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.kub_kv.enable_purge_protection

  network_acls {
    default_action = local.kub_kv.network_acls_default_action
    bypass         = local.kub_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_wl_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Azure Kubernetes Services - infrastructure secrets)"
  }
}

resource "azurerm_key_vault" "rg_sec_app_kv" {
  name                            = "${local.resource_prefix_rg_sec}-app-kv-${var.product_unique}"
  resource_group_name             = azurerm_resource_group.rg_sec.name
  location                        = azurerm_resource_group.rg_sec.location
  tenant_id                       = var.tenant_id
  sku_name                        = local.kv_sku.standard
  enabled_for_deployment          = local.app_kv.enabled_for_deployment
  enabled_for_disk_encryption     = local.app_kv.enabled_for_disk_encryption
  enabled_for_template_deployment = local.app_kv.enabled_for_template_deployment
  purge_protection_enabled        = local.app_kv.enable_purge_protection

  network_acls {
    default_action = local.app_kv.network_acls_default_action
    bypass         = local.app_kv.network_acls_bypass

    # ip_rules = local.vrp_infra_management_ips

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_wl_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  contact {
    email = local.contacts.veripark.managed_services.contact_email
    name  = local.contacts.veripark.managed_services.contact_name
    phone = local.contacts.veripark.managed_services.contact_phone
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Key Vault (Azure Kubernetes Services - application secrets)"
  }
}