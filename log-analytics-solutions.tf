resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_agw_anl" {
  solution_name         = "AzureAppGatewayAnalytics"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAppGatewayAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_act" {
  solution_name         = "AzureActivity"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureActivity"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_sec" {
  solution_name         = "Security"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Security"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_ad_ass" {
  solution_name         = "ADAssessment"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ADAssessment"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_agt_hlt" {
  solution_name         = "AgentHealthAssessment"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AgentHealthAssessment"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_ant_mlw" {
  solution_name         = "AntiMalware"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AntiMalware"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_app_ins" {
  solution_name         = "ApplicationInsights"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ApplicationInsights"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_sql" {
  solution_name         = "AzureSQLAnalytics"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureSQLAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_dns" {
  solution_name         = "DnsAnalytics"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/DnsAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_kv" {
  solution_name         = "KeyVaultAnalytics"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_net_mon" {
  solution_name         = "NetworkMonitoring"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/NetworkMonitoring"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_sql_ass" {
  solution_name         = "SQLAssessment"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SQLAssessment"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_sql_adv_thr_pro" {
  solution_name         = "SQLAdvancedThreatProtection"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SQLAdvancedThreatProtection"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_sql_vul_ass" {
  solution_name         = "SQLVulnerabilityAssessment"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SQLVulnerabilityAssessment"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_nsg_anl" {
  solution_name         = "AzureNSGAnalytics"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureNSGAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_sol_aut" {
  solution_name         = "AzureAutomation"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAutomation"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_alr_mng" {
  solution_name         = "AlertManagement"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AlertManagement"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_wir_dat" {
  solution_name         = "WireData2"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/WireData2"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_chg_trc" {
  solution_name         = "ChangeTracking"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_svc_map" {
  solution_name         = "ServiceMap"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }
}

resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_updates" {
  solution_name         = "Updates"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Updates"
  }
}


resource "azurerm_log_analytics_solution" "rg_pri_mon_la_ws_win_event_fw" {
  solution_name         = "WindowsEventForwarding"
  location              = azurerm_resource_group.rg_pri.location
  resource_group_name   = azurerm_resource_group.rg_pri.name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/WindowsEventForwarding"
  }
}