locals {
  monitor_data_collection_rule = {
    kind = {
      windows               = "Windows",
      linux                 = "Linux"
      agent_direct_to_store = "AgentDirectToStore"
    }
    data_flow = {
      stream = {
        ms_event            = "Microsoft-Event",
        ms_insights_metrics = "Microsoft-InsightsMetrics",
        ms_perf             = "Microsoft-Perf",
        ms_syslog           = "Microsoft-Syslog",
        ms_windows_event    = "Microsoft-WindowsEvent"
        ms_service_map      = "Microsoft-ServiceMap"
      }
    }
    data_source = {
      perf_counter = {
        default_sampling_frequency_in_seconds = 60 # PT60S
      }
    }
  }
}

resource "azurerm_monitor_data_collection_rule" "win_server_data_coll_rule_prf_mtr" {
  name                = "${local.resource_prefix_rg_pri}-win-server-data-coll-rule-prf-mtr-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  kind = local.monitor_data_collection_rule.kind.windows

  description = "Windows Servers Data Collection Rule"

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
      name                  = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
    }
  }

  data_flow {
    streams      = [local.monitor_data_collection_rule.data_flow.stream.ms_insights_metrics]
    destinations = [azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name]
  }

  data_flow {
    streams      = [local.monitor_data_collection_rule.data_flow.stream.ms_perf]
    destinations = [azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name]
  }

  data_flow {
    streams      = [local.monitor_data_collection_rule.data_flow.stream.ms_event]
    destinations = [azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name]
  }

  data_sources {
    performance_counter {
      streams                       = [local.monitor_data_collection_rule.data_flow.stream.ms_perf, local.monitor_data_collection_rule.data_flow.stream.ms_insights_metrics]
      sampling_frequency_in_seconds = local.monitor_data_collection_rule.data_source.perf_counter.default_sampling_frequency_in_seconds

      name = "ds-prf-cnt-cpu"
      counter_specifiers = [
        "\\Processor Information(_Total)\\% Processor Time",
        "\\Processor Information(_Total)\\% Privileged Time",
        "\\Processor Information(_Total)\\% User Time",
        "\\Processor Information(_Total)\\Processor Frequency",
        "\\System\\Processes",
        "\\Process(_Total)\\Thread Count",
        "\\Process(_Total)\\Handle Count",
        "\\System\\System Up Time",
        "\\System\\Context Switches/sec",
        "\\System\\Processor Queue Length"
      ]
    }
    performance_counter {
      streams                       = [local.monitor_data_collection_rule.data_flow.stream.ms_perf, local.monitor_data_collection_rule.data_flow.stream.ms_insights_metrics]
      sampling_frequency_in_seconds = local.monitor_data_collection_rule.data_source.perf_counter.default_sampling_frequency_in_seconds

      name = "ds-prf-cnt-memory"
      counter_specifiers = [
        "\\Memory\\% Committed Bytes In Use",
        "\\Memory\\Available Bytes",
        "\\Memory\\Committed Bytes",
        "\\Memory\\Cache Bytes",
        "\\Memory\\Pool Paged Bytes",
        "\\Memory\\Pool Nonpaged Bytes",
        "\\Memory\\Pages/sec",
        "\\Memory\\Page Faults/sec",
        "\\Process(_Total)\\Working Set",
        "\\Process(_Total)\\Working Set - Private"
      ]
    }
    performance_counter {
      streams                       = [local.monitor_data_collection_rule.data_flow.stream.ms_perf, local.monitor_data_collection_rule.data_flow.stream.ms_insights_metrics]
      sampling_frequency_in_seconds = local.monitor_data_collection_rule.data_source.perf_counter.default_sampling_frequency_in_seconds

      name = "ds-prf-cnt-disk"
      counter_specifiers = [
        "\\LogicalDisk(_Total)\\% Disk Time",
        "\\LogicalDisk(_Total)\\% Disk Read Time",
        "\\LogicalDisk(_Total)\\% Disk Write Time",
        "\\LogicalDisk(_Total)\\% Idle Time",
        "\\LogicalDisk(_Total)\\Disk Bytes/sec",
        "\\LogicalDisk(_Total)\\Disk Read Bytes/sec",
        "\\LogicalDisk(_Total)\\Disk Write Bytes/sec",
        "\\LogicalDisk(_Total)\\Disk Transfers/sec",
        "\\LogicalDisk(_Total)\\Disk Reads/sec",
        "\\LogicalDisk(_Total)\\Disk Writes/sec",
        "\\LogicalDisk(_Total)\\Avg. Disk sec/Transfer",
        "\\LogicalDisk(_Total)\\Avg. Disk sec/Read",
        "\\LogicalDisk(_Total)\\Avg. Disk sec/Write",
        "\\LogicalDisk(_Total)\\Avg. Disk Queue Length",
        "\\LogicalDisk(_Total)\\Avg. Disk Read Queue Length",
        "\\LogicalDisk(_Total)\\Avg. Disk Write Queue Length",
        "\\LogicalDisk(_Total)\\% Free Space",
        "\\LogicalDisk(_Total)\\Free Megabytes"
      ]
    }
    performance_counter {
      streams                       = [local.monitor_data_collection_rule.data_flow.stream.ms_perf, local.monitor_data_collection_rule.data_flow.stream.ms_insights_metrics]
      sampling_frequency_in_seconds = local.monitor_data_collection_rule.data_source.perf_counter.default_sampling_frequency_in_seconds

      name = "ds-prf-cnt-network"
      counter_specifiers = [
        "\\Network Interface(*)\\Bytes Total/sec",
        "\\Network Interface(*)\\Bytes Sent/sec",
        "\\Network Interface(*)\\Bytes Received/sec",
        "\\Network Interface(*)\\Packets/sec",
        "\\Network Interface(*)\\Packets Sent/sec",
        "\\Network Interface(*)\\Packets Received/sec",
        "\\Network Interface(*)\\Packets Outbound Errors",
        "\\Network Interface(*)\\Packets Received Errors"
      ]
    }

    windows_event_log {
      streams = [local.monitor_data_collection_rule.data_flow.stream.ms_event]

      name = "windows-event-log-data-source"
      x_path_queries = [
        "Application!*[System[(Level=1 or Level=2 or Level=3)]]",
        "Security!*[System[(band(Keywords,13510798882111488))]]",
        "System!*[System[(Level=1 or Level=2 or Level=3)]]"
      ]
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Using for diagnostic logging."
  }

  depends_on = [
    azurerm_log_analytics_solution.rg_pri_mon_la_ws_win_event_fw
  ]
}

resource "azurerm_monitor_data_collection_rule" "all_server_data_coll_rule_vm_insg" {
  name                = "${local.resource_prefix_rg_pri}-all-server-ins-data-coll-rule-vm-insg-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  # kind = local.monitor_data_collection_rule.kind.X

  description = "Data collection rule for VM Insights"

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
      name                  = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
    }
  }

  data_flow {
    streams      = [local.monitor_data_collection_rule.data_flow.stream.ms_insights_metrics]
    destinations = [azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name]
  }
  data_flow {
    streams      = [local.monitor_data_collection_rule.data_flow.stream.ms_service_map]
    destinations = [azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name]
  }

  data_sources {
    performance_counter {
      streams                       = [local.monitor_data_collection_rule.data_flow.stream.ms_insights_metrics]
      sampling_frequency_in_seconds = local.monitor_data_collection_rule.data_source.perf_counter.default_sampling_frequency_in_seconds
      counter_specifiers            = ["\\VmInsights\\DetailedMetrics"]
      name                          = "ds-prf-vm-ins-det-met"
    }

    extension {
      streams        = [local.monitor_data_collection_rule.data_flow.stream.ms_service_map]
      extension_name = "DependencyAgent"
      extension_json = ""
      name           = "ds-ext-dep-agt"
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Using for diagnostic logging."
  }

  depends_on = [

  ]
}

resource "azurerm_monitor_data_collection_rule" "aks_server_data_coll_rule_prf_mtr" {
  name                = "${local.resource_prefix_rg_pri}-aks-server-data-coll-rule-prf-mtr-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
      name                  = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
    }
  }

  data_flow {
    streams      = ["Microsoft-ContainerInsights-Group-Default"]
    destinations = [azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name]
  }

  data_sources {
    extension {
      name           = "ContainerInsightsExtension"
      streams        = ["Microsoft-ContainerInsights-Group-Default"]
      extension_name = "ContainerInsights"
      extension_json = jsonencode({
        dataCollectionSettings = {
          interval               = "5m"
          namespaceFilteringMode = "Exclude"
          namespaces = [
            "kube-system",
            "gatekeeper-system",
            "azure-arc"
          ],
          enableContainerLogV2 = true
        }
      })
    }
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Using for diagnostic logging."
  }
}

#--

# LOG ANALYTICS WORKSPACE AND DATA COLLECTION MUST BE IN SAME REGION. 
# SECONDARY REGION AKS CLUSTER CAN BE ADDED IN PRIMARY REGION DATA COLLECTION RULE ASSOCIATION.

# resource "azurerm_monitor_data_collection_rule" "rg_sec_aks_server_data_coll_rule_prf_mtr" {
#   name                = "${local.resource_prefix_rg_sec}-aks-server-data-coll-rule-prf-mtr-${var.product_unique}"
#   resource_group_name     = azurerm_resource_group.rg_sec.name
#   location                = azurerm_resource_group.rg_sec.location

#   destinations {
#     log_analytics {
#       workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
#       name                  = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
#     }
#   }

#   data_flow {
#     streams      = ["Microsoft-ContainerInsights-Group-Default"]
#     destinations = [azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name]
#   }

#   data_sources {
#     extension {
#       name           = "ContainerInsightsExtension"
#       streams        = ["Microsoft-ContainerInsights-Group-Default", "Microsoft-ContainerLogV2"]
#       extension_name = "ContainerInsights"
#       extension_json = jsonencode({
#         dataCollectionSettings = {
#           interval               = "5m"
#           namespaceFilteringMode = "Exclude"
#           namespaces = [
#             "kube-system",
#             "gatekeeper-system",
#             "azure-arc"
#           ]
#         }
#       })
#     }
#   }  

#   tags = {
#     company                   = var.company_name_long
#     product                   = local.product_name_long
#     region                    = var.rg_sec_location_long
#     environment               = var.environment_long
#     enable_auto_diag_settings = true
#     name                      = "Using for diagnostic logging."
#   }
# }
