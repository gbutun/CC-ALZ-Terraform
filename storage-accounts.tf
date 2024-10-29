locals {
  sa = {
    account_kind = {
      blob_storage = "BlobStorage"
      file_storage = "BlockBlobStorage"
      storage      = "FileStorage"
      storage_v2   = "StorageV2"
    }

    account_tier = {
      standard = "Standard"
      premium  = "Premium"
    }

    access_tier = {
      hot  = "Hot"
      cool = "Cool"
    }

    container_access_type = {
      blob      = "blob"
      container = "container"
      private   = "private"
    }

    replication_type = {
      lrs = "LRS"
      grs = "GRS"
    }
  }
}

resource "azurerm_storage_account" "rg_pri_log_sa" {
  name                              = "${local.resource_prefix_rg_pri_only_environment_and_location}logsa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_pri.name
  location                          = azurerm_resource_group.rg_pri.location
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = [] #local.vrp_all_ips_for_sa

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (Logs)"
  }
}

resource "azurerm_storage_account" "rg_pri_rls_sa" {
  name                              = "${local.resource_prefix_rg_pri_only_environment_and_location}rlssa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_pri.name
  location                          = azurerm_resource_group.rg_pri.location
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = local.vrp_devops_ips #local.vrp_all_ips_for_sa

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (Setups and Release Components)"
  }
}

resource "azurerm_storage_account" "rg_pri_biz_log_sa" {
  name                              = "${local.resource_prefix_rg_pri_only_environment_and_location}bizlogsa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_pri.name
  location                          = azurerm_resource_group.rg_pri.location
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = [] #local.vrp_all_ips_for_sa

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id,
      azurerm_subnet.rg_pri_spk_vn_wl_sub.id,
      azurerm_subnet.rg_sec_spk_vn_wl_sub.id
    ]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (VeriChannel Business Layer Long Retention Logs)"
  }
}

resource "azurerm_storage_account" "rg_pri_tfs_sa" {
  name                              = "${local.resource_prefix_rg_pri_only_environment_and_location}tfssa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_pri.name
  location                          = azurerm_resource_group.rg_pri.location
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = [] #local.vrp_infra_management_ips_for_sa

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (Terraform State)"
  }
}

resource "azurerm_storage_account" "rg_pri_pub_sa" {
  name                              = "${local.resource_prefix_rg_pri_only_environment_and_location}pubsa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_pri.name
  location                          = azurerm_resource_group.rg_pri.location
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices"]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (Public Files)"
  }
}

resource "azurerm_storage_account" "rg_pri_apc_log_sa" {
  name                              = "${local.resource_prefix_rg_pri_only_environment_and_location}apclogsa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_pri.name
  location                          = azurerm_resource_group.rg_pri.location
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices"]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (App Center Logs)"
  }
}

resource "azurerm_storage_account" "rg_pri_mal_scn_sa" {
  name                              = "${local.resource_prefix_rg_we_only_environment_and_location}malscnsa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_pri.name
  location                          = var.rg_we_location_long
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    # TODO : Remove Ziraat Bank Server IPs from this firewall once Migration is done.
    ip_rules       = []
    default_action = "Deny"
    bypass         = ["AzureServices"]

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_wl_sub.id,
      azurerm_subnet.rg_sec_spk_vn_wl_sub.id,
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id,
    ]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (File Malware Scanning)"
  }
}

# RG-02


resource "azurerm_storage_account" "rg_sec_log_sa" {
  name                              = "${local.resource_prefix_rg_sec_only_environment_and_location}logsa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_sec.name
  location                          = azurerm_resource_group.rg_sec.location
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = [] #local.vrp_all_ips_for_sa

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id
    ]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (Logs)"
  }
}


resource "azurerm_storage_account" "rg_sec_biz_log_sa" {
  name                              = "${local.resource_prefix_rg_sec_only_environment_and_location}bizlogsa${var.product_unique}"
  resource_group_name               = azurerm_resource_group.rg_sec.name
  location                          = azurerm_resource_group.rg_sec.location
  account_kind                      = local.sa.account_kind.storage_v2
  account_tier                      = local.sa.account_tier.standard
  account_replication_type          = local.sa.replication_type.grs
  access_tier                       = local.sa.access_tier.hot
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  min_tls_version                   = "TLS1_2"

  identity {
    type = local.resource_identity_type.system_assigned
  }

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = [] #local.vrp_all_ips_for_sa

    virtual_network_subnet_ids = [
      azurerm_subnet.rg_pri_spk_vn_rls_sub.id,
      azurerm_subnet.rg_sec_spk_vn_rls_sub.id,
      azurerm_subnet.rg_pri_spk_vn_wl_sub.id,
      azurerm_subnet.rg_sec_spk_vn_wl_sub.id
    ]
  }

  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Storage Account (VeriChannel Business Layer Long Retention Logs)"
  }
}
