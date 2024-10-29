resource "azurerm_maintenance_assignment_virtual_machine" "rg_pri_win_mnt_cfg_01_assgn" {
  for_each = { for resource in data.azurerm_resources.rg_pri_virtual_machines.resources : resource.id => resource.name }

  location                     = azurerm_resource_group.rg_pri.location
  maintenance_configuration_id = azurerm_maintenance_configuration.rg_pri_win_vm_mnt_cfg_01.id
  virtual_machine_id           = each.key
}

resource "azurerm_maintenance_assignment_virtual_machine" "rg_pri_win_mnt_cfg_02_assgn" {
  for_each = { for resource in data.azurerm_resources.rg_pri_virtual_machines.resources : resource.id => resource.name }

  location                     = azurerm_resource_group.rg_pri.location
  maintenance_configuration_id = azurerm_maintenance_configuration.rg_pri_win_vm_mnt_cfg_02.id
  virtual_machine_id           = each.key
}
