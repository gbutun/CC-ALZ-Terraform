resource "random_uuid" "rg_pri_auto_hwg_hw_id" {
}

resource "azurerm_automation_hybrid_runbook_worker" "rg_pri_auto_hwg_rls_hw" {
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  resource_group_name     = azurerm_resource_group.rg_pri.name
  worker_group_name       = azurerm_automation_hybrid_runbook_worker_group.rg_pri_auto_hwg.name
  vm_resource_id          = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  worker_id               = random_uuid.rg_pri_auto_hwg_hw_id.result
}