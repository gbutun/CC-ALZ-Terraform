resource "azurerm_monitor_data_collection_rule_association" "win_server_data_coll_rule_prf_mtr_rg_pri_rls_vm_asc" {
  name                    = "${azurerm_windows_virtual_machine.rg_pri_rls_vm.name}-${azurerm_monitor_data_collection_rule.win_server_data_coll_rule_prf_mtr.name}-dcr-asc"
  target_resource_id      = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.win_server_data_coll_rule_prf_mtr.id
  description             = "Data Collection Rule Association"
}

resource "azurerm_monitor_data_collection_rule_association" "win_server_data_coll_rule_prf_mtr_rg_pri_jmb_vm_asc" {
  name                    = "${azurerm_windows_virtual_machine.rg_pri_jmb_vm.name}-${azurerm_monitor_data_collection_rule.win_server_data_coll_rule_prf_mtr.name}-dcr-asc"
  target_resource_id      = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.win_server_data_coll_rule_prf_mtr.id
  description             = "Data Collection Rule Association"
}


resource "azurerm_monitor_data_collection_rule_association" "all_server_data_coll_rule_02_all_vms_asc" {
  for_each = { for resource in data.azurerm_resources.all_virtual_machines.resources : resource.id => resource.name }

  name                    = "${each.value}-${azurerm_monitor_data_collection_rule.all_server_data_coll_rule_vm_insg.name}-dcr-asc"
  target_resource_id      = each.key
  data_collection_rule_id = azurerm_monitor_data_collection_rule.all_server_data_coll_rule_vm_insg.id
  description             = "Data Collection Rule Association"
}


resource "azurerm_monitor_data_collection_rule_association" "aks_server_data_coll_rule_prf_mtr_rg_pri_wl_aks_cl_asc" {
  name                    = "${azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name}-${azurerm_monitor_data_collection_rule.aks_server_data_coll_rule_prf_mtr.name}-dcr-asc"
  target_resource_id      = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.aks_server_data_coll_rule_prf_mtr.id
  description             = "Data Collection Rule Association"
}

#--


resource "azurerm_monitor_data_collection_rule_association" "rg_sec_aks_server_data_coll_rule_prf_mtr_rg_pri_wl_aks_cl_asc" {
  name                    = "${azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name}-${azurerm_monitor_data_collection_rule.aks_server_data_coll_rule_prf_mtr.name}-dcr-asc"
  target_resource_id      = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.aks_server_data_coll_rule_prf_mtr.id
  description             = "Data Collection Rule Association"
}
