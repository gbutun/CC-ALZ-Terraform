locals {
  log_retention_period_in_days    = var.log_retention_period_in_days
  metric_retention_period_in_days = var.metric_retention_period_in_days

  diag_categories = {
    subscription = {
      logs = [
        "Administrative",
        "Security",
        "ServiceHealth",
        "Alert",
        "Recommendation",
        "Policy",
        "Autoscale",
        "ResourceHealth"
      ]
      metrics = []
      ms_entra_id_logs = [
        "AuditLogs",
        "SignInLogs",
        "NonInteractiveUserSignInLogs",
        "ServicePrincipalSignInLogs",
        "ManagedIdentitySignInLogs",
        "ProvisioningLogs",
        "ADFSSignInLogs",
        "RiskyUsers",
        "UserRiskEvents",
        "NetworkAccessTrafficLogs",
        "RiskyServicePrincipals",
        "ServicePrincipalRiskEvents",
        "EnrichedOffice365AuditLogs",
        "MicrosoftGraphActivityLogs",
        "RemoteNetworkHealthLogs"
      ]
      aks_skipped_logs = ["Kubernetes Audit"]
    }
  }

  app_service_server_logs = ["AppServiceHTTPLogs", "AppServiceAppLogs"]

  key_vault_logs = ["AzurePolicyEvaluationDetails"]
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_subs" {

  name                       = "subscription-diag-set"
  target_resource_id         = data.azurerm_subscription.current.id
  storage_account_id         = azurerm_storage_account.rg_pri_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = local.diag_categories.subscription.logs
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = local.diag_categories.subscription.metrics
    content {
      category = metric.value
    }
  }
}


resource "azurerm_monitor_diagnostic_setting" "diag_set_kvs" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_key_vaults.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_key_vaults.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_key_vaults.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_key_vaults.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_laws" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_log_analytics_workspaces.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_log_analytics_workspaces.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_log_analytics_workspaces.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_log_analytics_workspaces.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_recovery_services_vaults" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_recovery_services_vaults.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_recovery_services_vaults.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set-${var.product_unique}"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  log_analytics_destination_type = "AzureDiagnostics"

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_recovery_services_vaults.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_recovery_services_vaults.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_agws" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_application_gateways.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_application_gateways.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set-${var.product_unique}"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_application_gateways.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_application_gateways.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_vpn_vng" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_vpn_gateways.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_vpn_gateways.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set-${var.product_unique}"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_vpn_gateways.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_vpn_gateways.metrics
    content {
      category = metric.value
    }
  }
}



resource "azurerm_monitor_diagnostic_setting" "diag_set_nsgs" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_network_security_groups.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_network_security_groups.resources, data.azurerm_resources.aks_rg_pri_auto_diag_enabled_network_security_groups.resources, data.azurerm_resources.aks_rg_sec_auto_diag_enabled_network_security_groups.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_network_security_groups.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_network_security_groups.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_sql_srvs" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_sql_servers.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_sql_servers.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_sql_servers.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_sql_servers.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_sql_dbs" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_sql_databases.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_sql_databases.resources) : resource.id => resource.name }

  name                       = "${split("/", each.value)[1]}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_sql_databases.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_sql_databases.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_sa_accs" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_storage_accounts.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_storage_accounts.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_auto_accs" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_automation_accounts.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_automation_accounts.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_automation_accounts.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_automation_accounts.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_nics" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_network_interfaces.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_network_interfaces.resources, data.azurerm_resources.aks_rg_pri_auto_diag_enabled_network_interfaces.resources, data.azurerm_resources.aks_rg_sec_auto_diag_enabled_network_interfaces.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_network_interfaces.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_network_interfaces.metrics
    content {
      category = metric.value
    }
  }
}


resource "azurerm_monitor_diagnostic_setting" "diag_set_vms" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_virtual_machines.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_virtual_machines.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_virtual_machines.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_virtual_machines.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_pip" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_public_ips.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_public_ips.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_public_ip.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_public_ip.metrics
    content {
      category = metric.value
    }
  }
}


resource "azurerm_monitor_diagnostic_setting" "diag_set_vns" {
  for_each = { for resource in data.azurerm_resources.rg_pri_auto_diag_enabled_virtual_networks.resources : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_virtual_networks.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_virtual_networks.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_nhs" {
  for_each = { for resource in data.azurerm_resources.rg_pri_auto_diag_enabled_notification_hubs.resources : resource.id => resource.name }

  name                       = "${each.value}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = azurerm_storage_account.rg_pri_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_notification_hubs_namespaces.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_notification_hubs_namespaces.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_sa_accs_blob" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_storage_accounts.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_storage_accounts.resources) : resource.id => resource.name }

  name                       = "${each.value}-blob-diag-set"
  target_resource_id         = "${each.key}/blobServices/default/"
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts_blob.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts_blob.metrics
    content {
      category = metric.value
    }
  }
}


resource "azurerm_monitor_diagnostic_setting" "diag_set_sa_accs_file" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_storage_accounts.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_storage_accounts.resources) : resource.id => resource.name }

  name                       = "${each.value}-file-diag-set"
  target_resource_id         = "${each.key}/fileServices/default/"
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts_file.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts_file.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_sa_accs_queue" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_storage_accounts.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_storage_accounts.resources) : resource.id => resource.name }

  name                       = "${each.value}-queue-diag-set"
  target_resource_id         = "${each.key}/queueServices/default/"
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts_queue.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts_queue.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_sa_accs_table" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_storage_accounts.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_storage_accounts.resources) : resource.id => resource.name }

  name                       = "${each.value}-table-diag-set"
  target_resource_id         = "${each.key}/tableServices/default/"
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts_table.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_storage_accounts_table.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_aks_cl" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_aks_cl.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_aks_cl.resources) : resource.id => resource.name }

  name                       = "${each.value}-aks-cl-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = setsubtract(data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_aks_cl.log_category_types, local.diag_categories.subscription.aks_skipped_logs)
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_aks_cl.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_sol_acr" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_sol_acr.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_sol_acr.resources) : resource.id => resource.name }

  name                       = "${each.value}-sol-acr-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_sol_acr.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_sol_acr.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_mon_ai" {
  for_each = { for resource in data.azurerm_resources.rg_pri_auto_diag_enabled_mon_ai.resources : resource.id => resource.name }

  name               = "${each.value}-mon-ai-diag-set"
  target_resource_id = each.key
  storage_account_id = azurerm_storage_account.rg_pri_log_sa.id
  # log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_mon_ai.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_mon_ai.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_firewalls" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_azure_firwalls.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_azure_firwalls.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set-${var.product_unique}"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.rg_pri_auto_diag_enabled_azure_firwalls.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.rg_pri_auto_diag_enabled_azure_firwalls.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_traffic_managers" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_traffic_managers.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_traffic_managers.resources) : resource.id => resource.name }

  name                       = "${each.value}-diag-set-${var.product_unique}"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_traffic_managers.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_traffic_managers.metrics
    content {
      category = metric.value
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diag_set_sql_ep" {
  for_each = { for resource in concat(data.azurerm_resources.rg_pri_auto_diag_enabled_elastic_pools.resources, data.azurerm_resources.rg_sec_auto_diag_enabled_elastic_pools.resources) : resource.id => resource.name }

  name                       = "${split("/", each.value)[1]}-diag-set"
  target_resource_id         = each.key
  storage_account_id         = length(regexall(azurerm_resource_group.rg_pri.name, each.key)) > 0 ? azurerm_storage_account.rg_pri_log_sa.id : azurerm_storage_account.rg_sec_log_sa.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_elastic_pools.log_category_types
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.monitor_diagnostic_categories_elastic_pools.metrics
    content {
      category = metric.value
    }
  }
}

# TODO : The AAD Diagnostic Setting resource does not work proper due to Azure Rest API issue
# TODO : un-comment and try if problem fixed, check GIT for resolution.
# resource "azurerm_monitor_aad_diagnostic_setting" "diag_set_ms_entra_id" {
#   name               = "diag-set-ms-entra-id-${var.product_unique}"
#   storage_account_id = azurerm_storage_account.rg_pri_log_sa.id

#   for_each = toset(local.diag_categories.subscription.ms_entra_id_logs)
#   enabled_log {
#     category = each.key
#     retention_policy {
#       enabled = true
#       days    = local.log_retention_period_in_days
#     }
#   }
# }