locals {
  maintenance_configuration = {
    operating_system = {
      windows = "windows",
      linux   = "linux"
    }
    windows_classification = {
      unclassified  = "Unclassified",
      critical      = "Critical",
      security      = "Security",
      update_rollup = "UpdateRollup",
      feature_pack  = "FeaturePack",
      service_pack  = "ServicePack",
      definition    = "Definition",
      tools         = "Tools",
      updates       = "Updates"
    }
    schedule = {
      frequency = {
        day   = "day",
        hour  = "hour",
        week  = "week",
        month = "month"
      }
      time_zone = {
        utc = "UTC"
      }
    }
    reboot_option = {
      if_required = "IfRequired",
      never       = "Never",
      always      = "Always"
    }
    scope = {
      extension            = "Extension"
      host                 = "Host"
      in_guest_patch       = "InGuestPatch"
      os_image             = "OSImage"
      sqldb                = "SQLDB"
      sql_managed_instance = "SQLManagedInstance"
    }
    in_guest_user_patch_mode = {
      platform = "Platform"
      user     = "User"
    }
  }

  maintenance_configuration_defaults = {
    update_duration = {
      critical = "01:30",
      all      = "02:00"
    }
    windows_classification_list_critical = [
      local.maintenance_configuration.windows_classification.critical,
      local.maintenance_configuration.windows_classification.security,
      local.maintenance_configuration.windows_classification.definition
    ]
    windows_classification_list_all = [
      local.maintenance_configuration.windows_classification.critical,
      local.maintenance_configuration.windows_classification.security,
      local.maintenance_configuration.windows_classification.update_rollup,
      local.maintenance_configuration.windows_classification.feature_pack,
      local.maintenance_configuration.windows_classification.service_pack,
      local.maintenance_configuration.windows_classification.definition,
      local.maintenance_configuration.windows_classification.tools,
      local.maintenance_configuration.windows_classification.updates
    ]
  }
}

resource "azurerm_maintenance_configuration" "rg_pri_win_vm_mnt_cfg_01" {
  name                = "${local.resource_prefix_rg_pri}-win-vm-mnt-cfg-01-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  scope                    = local.maintenance_configuration.scope.in_guest_patch
  in_guest_user_patch_mode = local.maintenance_configuration.in_guest_user_patch_mode.user

  install_patches {
    windows {
      classifications_to_include = local.maintenance_configuration_defaults.windows_classification_list_critical
    }
    reboot = local.maintenance_configuration.reboot_option.if_required
  }

  window {
    time_zone       = local.maintenance_configuration.schedule.time_zone.utc
    start_date_time = var.maintenance_configuration_start_time
    duration        = local.maintenance_configuration_defaults.update_duration.critical
    recur_every     = local.maintenance_configuration.schedule.frequency.day
  }
}

resource "azurerm_maintenance_configuration" "rg_pri_win_vm_mnt_cfg_02" {
  name                = "${local.resource_prefix_rg_pri}-win-vm-mnt-cfg-02-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  scope                    = local.maintenance_configuration.scope.in_guest_patch
  in_guest_user_patch_mode = local.maintenance_configuration.in_guest_user_patch_mode.user

  install_patches {
    windows {
      classifications_to_include = local.maintenance_configuration_defaults.windows_classification_list_all
    }
    reboot = local.maintenance_configuration.reboot_option.always
  }

  window {
    time_zone       = local.maintenance_configuration.schedule.time_zone.utc
    start_date_time = var.maintenance_configuration_start_time
    duration        = local.maintenance_configuration_defaults.update_duration.all
    recur_every     = local.maintenance_configuration.schedule.frequency.day
  }
}
