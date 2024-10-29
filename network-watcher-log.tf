#TODO: add missing NSGs here

resource "azurerm_network_watcher_flow_log" "rg_pri_hub_vn_jmb_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_pri_nww.name
  resource_group_name  = azurerm_resource_group.rg_pri.name
  name                 = "jmb-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_pri_hub_vn_jmb_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_pri_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}

resource "azurerm_network_watcher_flow_log" "rg_pri_hub_vn_wef_agw_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_pri_nww.name
  resource_group_name  = azurerm_resource_group.rg_pri.name
  name                 = "agw-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_pri_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}

resource "azurerm_network_watcher_flow_log" "rg_pri_spk_vn_wl_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_pri_nww.name
  resource_group_name  = azurerm_resource_group.rg_pri.name
  name                 = "wl-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_pri_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}

resource "azurerm_network_watcher_flow_log" "rg_pri_spk_vn_sql_pe_int_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_pri_nww.name
  resource_group_name  = azurerm_resource_group.rg_pri.name
  name                 = "sql-pe-int-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_pri_spk_vn_sql_pe_int_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_pri_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}


resource "azurerm_network_watcher_flow_log" "rg_pri_spk_vn_rls_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_pri_nww.name
  resource_group_name  = azurerm_resource_group.rg_pri.name
  name                 = "rls-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_pri_spk_vn_rls_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_pri_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}

resource "azurerm_network_watcher_flow_log" "rg_pri_spk_vn_aks_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_pri_nww.name
  resource_group_name  = azurerm_resource_group.rg_pri.name
  name                 = "aks-sub-nsg-nww-flog"

  network_security_group_id = data.azurerm_network_security_group.rg_pri_spk_vn_aks_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_pri_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}


#--


resource "azurerm_network_watcher_flow_log" "rg_sec_hub_vn_jmb_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_sec_nww.name
  resource_group_name  = azurerm_resource_group.rg_sec.name
  name                 = "jmb-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_sec_hub_vn_jmb_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_sec_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}

resource "azurerm_network_watcher_flow_log" "rg_sec_hub_vn_wef_agw_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_sec_nww.name
  resource_group_name  = azurerm_resource_group.rg_sec.name
  name                 = "agw-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_sec_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}

resource "azurerm_network_watcher_flow_log" "rg_sec_spk_vn_wl_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_sec_nww.name
  resource_group_name  = azurerm_resource_group.rg_sec.name
  name                 = "wl-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_sec_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}

resource "azurerm_network_watcher_flow_log" "rg_sec_spk_vn_sql_pe_int_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_sec_nww.name
  resource_group_name  = azurerm_resource_group.rg_sec.name
  name                 = "sql-pe-int-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_sec_spk_vn_sql_pe_int_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_sec_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}


resource "azurerm_network_watcher_flow_log" "rg_sec_spk_vn_rls_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_sec_nww.name
  resource_group_name  = azurerm_resource_group.rg_sec.name
  name                 = "rls-sub-nsg-nww-flog"

  network_security_group_id = azurerm_network_security_group.rg_sec_spk_vn_rls_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_sec_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}

resource "azurerm_network_watcher_flow_log" "rg_sec_spk_vn_aks_sub_nsg_nww_flog" {
  network_watcher_name = azurerm_network_watcher.rg_sec_nww.name
  resource_group_name  = azurerm_resource_group.rg_sec.name
  name                 = "aks-sub-nsg-nww-flog"

  network_security_group_id = data.azurerm_network_security_group.rg_sec_spk_vn_aks_sub_nsg.id
  storage_account_id        = azurerm_storage_account.rg_sec_log_sa.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = false
    days    = 7
  }
}
