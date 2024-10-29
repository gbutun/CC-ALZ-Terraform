resource "azurerm_storage_management_policy" "rg_pri_log_sa_mng_pol" {
  storage_account_id = azurerm_storage_account.rg_pri_log_sa.id

  rule {
    name    = "deleteRule"
    enabled = true
    filters {
      prefix_match = []
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = var.cool_logs_after_modification_date_greater_than_in_days
        tier_to_archive_after_days_since_modification_greater_than = var.archive_logs_after_modification_date_greater_than_in_days
        delete_after_days_since_modification_greater_than          = var.delete_logs_after_modification_date_greater_than_in_days
      }
      snapshot {
        delete_after_days_since_creation_greater_than = var.snapshot_delete_after_days_since_creation_greater_than
      }
    }
  }
}


resource "azurerm_storage_management_policy" "rg_pri_biz_log_sa_mng_pol" {
  storage_account_id = azurerm_storage_account.rg_pri_biz_log_sa.id

  rule {
    name    = "deleteRule"
    enabled = true
    filters {
      prefix_match = []
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = var.cool_logs_after_modification_date_greater_than_in_days
        tier_to_archive_after_days_since_modification_greater_than = var.archive_logs_after_modification_date_greater_than_in_days
        delete_after_days_since_modification_greater_than          = var.delete_logs_after_modification_date_greater_than_in_days
      }
      snapshot {
        delete_after_days_since_creation_greater_than = var.snapshot_delete_after_days_since_creation_greater_than
      }
    }
  }
}

resource "azurerm_storage_management_policy" "rg_pri_apc_log_sa_mng_pol" {
  storage_account_id = azurerm_storage_account.rg_pri_apc_log_sa.id

  rule {
    name    = "deleteRule"
    enabled = true
    filters {
      prefix_match = []
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = var.cool_logs_after_modification_date_greater_than_in_days
        tier_to_archive_after_days_since_modification_greater_than = var.archive_logs_after_modification_date_greater_than_in_days
        delete_after_days_since_modification_greater_than          = var.delete_logs_after_modification_date_greater_than_in_days
      }
      snapshot {
        delete_after_days_since_creation_greater_than = var.snapshot_delete_after_days_since_creation_greater_than
      }
    }
  }
}

#--

resource "azurerm_storage_management_policy" "rg_sec_log_sa_mng_pol" {
  storage_account_id = azurerm_storage_account.rg_sec_log_sa.id

  rule {
    name    = "deleteRule"
    enabled = true
    filters {
      prefix_match = []
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = var.cool_logs_after_modification_date_greater_than_in_days
        # TODO : Tier to Archive not available in GermanyNorth 
        # tier_to_archive_after_days_since_modification_greater_than = var.archive_logs_after_modification_date_greater_than_in_days
        delete_after_days_since_modification_greater_than          = var.delete_logs_after_modification_date_greater_than_in_days
      }
      snapshot {
        delete_after_days_since_creation_greater_than = var.snapshot_delete_after_days_since_creation_greater_than
      }
    }
  }
}

resource "azurerm_storage_management_policy" "rg_sec_biz_log_sa_mng_pol" {
  storage_account_id = azurerm_storage_account.rg_sec_biz_log_sa.id

  rule {
    name    = "deleteRule"
    enabled = true
    filters {
      prefix_match = []
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = var.cool_logs_after_modification_date_greater_than_in_days
        # TODO : Tier to Archive not available in GermanyNorth 
        # tier_to_archive_after_days_since_modification_greater_than = var.archive_logs_after_modification_date_greater_than_in_days
        delete_after_days_since_modification_greater_than          = var.delete_logs_after_modification_date_greater_than_in_days
      }
      snapshot {
        delete_after_days_since_creation_greater_than = var.snapshot_delete_after_days_since_creation_greater_than
      }
    }
  }
}
