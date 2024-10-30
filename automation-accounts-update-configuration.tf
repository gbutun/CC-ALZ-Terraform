locals {
  automation_update_management = {
    operating_system = {
      windows = "Windows",
      linux   = "Linux"
    }
  }
}

resource "azurerm_automation_software_update_configuration" "rg_pri_auto_win_update_config" {
  name                  = "${local.resource_prefix_rg_pri}-auto-win-update-config-${var.product_unique}"
  automation_account_id = azurerm_automation_account.rg_pri_auto.id

  virtual_machine_ids = [
    azurerm_windows_virtual_machine.rg_pri_jmb_vm.id,
    azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  ]
  schedule {
    is_enabled         = true
    time_zone          = "W. Europe Standard Time"
    frequency          = "Week"
    interval           = "1"
    advanced_week_days = ["Saturday"]
    start_time         = "${formatdate("YYYY-MM-DD", timeadd(timestamp(), "24h"))}T04:00:00Z"
  }

  windows {
    classifications_included = ["Critical", "Security"]
    reboot                   = "IfRequired"

  }

  lifecycle {
    ignore_changes = [schedule]
  }
}
