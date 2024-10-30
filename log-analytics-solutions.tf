module "rg_pri_mon_la_ws_sol_act" {
  source                = "./module/la-solutions"
  solution_name         = "AzureActivity"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AzureActivity"
}

module "rg_pri_mon_la_ws_sol_agw_anl" {
  source                = "./module/la-solutions"
  solution_name         = "AzureAppGatewayAnalytics"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AzureAppGatewayAnalytics"
}

module "rg_pri_mon_la_ws_sol_act" {
  source                = "./module/la-solutions"
  solution_name         = "AzureActivity"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AzureActivity"
}

module "rg_pri_mon_la_ws_sol_sec" {
  source                = "./module/la-solutions"
  solution_name         = "Security"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/Security"
}

module "rg_pri_mon_la_ws_sol_ad_ass" {
  source                = "./module/la-solutions"
  solution_name         = "ADAssessment"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/ADAssessment"

}

module "rg_pri_mon_la_ws_sol_agt_hlt" {
  source                = "./module/la-solutions"
  solution_name         = "AgentHealthAssessment"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AgentHealthAssessment"
}

module "rg_pri_mon_la_ws_sol_ant_mlw" {
  source                = "./module/la-solutions"
  solution_name         = "AntiMalware"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AntiMalware"
}

module "rg_pri_mon_la_ws_sol_app_ins" {
  source                = "./module/la-solutions"
  solution_name         = "ApplicationInsights"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/ApplicationInsights"
}

module "rg_pri_mon_la_ws_sol_sql" {
  source                = "./module/la-solutions"
  solution_name         = "AzureSQLAnalytics"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AzureSQLAnalytics"
}

module "rg_pri_mon_la_ws_sol_dns" {
  source                = "./module/la-solutions"
  solution_name         = "DnsAnalytics"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/DnsAnalytics"
}

module "rg_pri_mon_la_ws_sol_kv" {
  source                = "./module/la-solutions"
  solution_name         = "KeyVaultAnalytics"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/KeyVaultAnalytics"
}

module "rg_pri_mon_la_ws_sol_net_mon" {
  source                = "./module/la-solutions"
  solution_name         = "NetworkMonitoring"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/NetworkMonitoring"
}

module "rg_pri_mon_la_ws_sol_sql_ass" {
  source                = "./module/la-solutions"
  solution_name         = "SQLAssessment"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/SQLAssessment"
}

module "rg_pri_mon_la_ws_sol_sql_adv_thr_pro" {
  source                = "./module/la-solutions"
  solution_name         = "SQLAdvancedThreatProtection"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/SQLAdvancedThreatProtection"
}

module "rg_pri_mon_la_ws_sol_sql_vul_ass" {
  source                = "./module/la-solutions"
  solution_name         = "SQLVulnerabilityAssessment"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/SQLVulnerabilityAssessment"
}

module "rg_pri_mon_la_ws_sol_nsg_anl" {
  source                = "./module/la-solutions"
  solution_name         = "AzureNSGAnalytics"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AzureNSGAnalytics"
}

module "rg_pri_mon_la_ws_sol_aut" {
  source                = "./module/la-solutions"
  solution_name         = "AzureAutomation"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AzureAutomation"
}

module "rg_pri_mon_la_ws_alr_mng" {
  source                = "./module/la-solutions"
  solution_name         = "AlertManagement"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/AlertManagement"

}

module "rg_pri_mon_la_ws_wir_dat" {
  source                = "./module/la-solutions"
  solution_name         = "WireData2"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/WireData2"
}

module "rg_pri_mon_la_ws_chg_trc" {
  source                = "./module/la-solutions"
  solution_name         = "ChangeTracking"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/ChangeTracking"
}

module "rg_pri_mon_la_ws_svc_map" {
  source                = "./module/la-solutions"
  solution_name         = "ServiceMap"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/ServiceMap"
}

module "rg_pri_mon_la_ws_updates" {
  source                = "./module/la-solutions"
  solution_name         = "Updates"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/Updates"
}


module "rg_pri_mon_la_ws_win_event_fw" {
  source                = "./module/la-solutions"
  solution_name         = "WindowsEventForwarding"
  location              = module.rg_pri.location
  resource_group_name   = module.rg_pri.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  workspace_name        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.name
  publisher             = "Microsoft"
  product               = "OMSGallery/WindowsEventForwarding"
}
