data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_key_vaults" {
  resource_id = azurerm_key_vault.rg_pri_cmk_enc_kv.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_sql_servers" {
  resource_id = azurerm_mssql_server.rg_pri_sol_sql.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_sql_databases" {
  resource_id = azurerm_mssql_database.rg_pri_vc_db.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_storage_accounts" {
  resource_id = azurerm_storage_account.rg_pri_log_sa.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_virtual_networks" {
  resource_id = azurerm_virtual_network.rg_pri_hub_vn.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_automation_accounts" {
  resource_id = azurerm_automation_account.rg_pri_auto.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_network_interfaces" {
  resource_id = azurerm_network_interface.rg_pri_rls_vm_pvt_nic.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_virtual_machines" {
  resource_id = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_elastic_pools" {
  resource_id = azurerm_mssql_elasticpool.rg_pri_sol_sql_ep.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_public_ip" {
  resource_id = azurerm_public_ip.rg_pri_wef_agw_pip.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_storage_accounts_blob" {
  resource_id = "${azurerm_storage_account.rg_pri_log_sa.id}/blobServices/default/"
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_storage_accounts_file" {
  resource_id = "${azurerm_storage_account.rg_pri_log_sa.id}/fileServices/default/"
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_storage_accounts_queue" {
  resource_id = "${azurerm_storage_account.rg_pri_log_sa.id}/queueServices/default/"
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_storage_accounts_table" {
  resource_id = "${azurerm_storage_account.rg_pri_log_sa.id}/tableServices/default/"
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_network_security_groups" {
  resource_id = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_log_analytics_workspaces" {
  resource_id = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_notification_hubs_namespaces" {
  resource_id = azurerm_notification_hub_namespace.rg_pri_nhb_ns_mob.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_application_gateways" {
  resource_id = azurerm_application_gateway.rg_pri_wef_agw.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_vpn_gateways" {
  resource_id = azurerm_virtual_network_gateway.rg_pri_vpn_vng.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_recovery_services_vaults" {
  resource_id = azurerm_recovery_services_vault.rg_pri_rsv.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_aks_cl" {
  resource_id = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_sol_acr" {
  resource_id = azurerm_container_registry.rg_pri_sol_acr.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_mon_ai" {
  resource_id = azurerm_application_insights.rg_pri_mon_ai.id
}

data "azurerm_monitor_diagnostic_categories" "rg_pri_auto_diag_enabled_azure_firwalls" {
  resource_id = azurerm_firewall.rg_pri_frw.id
}

data "azurerm_monitor_diagnostic_categories" "monitor_diagnostic_categories_traffic_managers" {
  resource_id = azurerm_traffic_manager_profile.rg_pri_mb_app_tmp.id
}