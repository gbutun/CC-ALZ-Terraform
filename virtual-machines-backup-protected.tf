resource "azurerm_backup_protected_vm" "rg_pri_rls_vm_bck_cfg" {
  resource_group_name = azurerm_resource_group.rg_pri.name
  recovery_vault_name = azurerm_recovery_services_vault.rg_pri_rsv.name
  source_vm_id        = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  backup_policy_id    = azurerm_backup_policy_vm.rg_pri_rls_vm_bck_pol.id
  depends_on = [
    azurerm_key_vault_access_policy.rg_pri_vm_kv_identity_principal,
    azurerm_key_vault_access_policy.rg_pri_vm_kv_bck_svc_identity_principal,
    azurerm_windows_virtual_machine.rg_pri_rls_vm
  ]
}