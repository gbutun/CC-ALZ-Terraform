locals {
  backup_policy = {
    frequency = {
      daily  = "Daily",
      weekly = "Weekly"
    },
    timezone = {
      central_standard_time = "Central Standard Time"
    }
  }
}

resource "azurerm_backup_policy_vm" "rg_pri_rls_vm_bck_pol" {
  name                = "${local.resource_prefix_rg_pri}-rls-vm-bck-pol-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  recovery_vault_name = azurerm_recovery_services_vault.rg_pri_rsv.name

  timezone = local.backup_policy.timezone.central_standard_time

  instant_restore_retention_days = var.rls_vm_bck_pol_instant_restore_retention_days

  backup {
    frequency = local.backup_policy.frequency.daily
    time      = var.rls_vm_bck_pol_backup_time
  }

  retention_daily {
    count = var.rls_vm_bck_pol_daily_policy_retention_days
  }

  retention_weekly {
    count    = var.rls_vm_bck_pol_weekly_policy_retention_weeks
    weekdays = var.rls_vm_bck_pol_weekly_policy_retention_weekdays
  }
}
