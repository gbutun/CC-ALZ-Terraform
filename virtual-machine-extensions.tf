locals {
  auto_hwg_prv_feat = {
    dsc_suffix = ".agentsvc.dewc.azure-automation.net/accounts/"
    hwg_suffix = ".jrds.dewc.azure-automation.net/automationAccounts/"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_mon" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "AzureMonitorWindowsAgent"
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.2"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true
  protected_settings         = <<PROTECTED_SETTINGS
  {
    "workspaceKey" : "${azurerm_log_analytics_workspace.rg_pri_mon_la_ws.primary_shared_key}"
  }
  PROTECTED_SETTINGS
  settings                   = <<SETTINGS
  {
    "workspaceId" : "${azurerm_log_analytics_workspace.rg_pri_mon_la_ws.workspace_id}"
  }
  SETTINGS
  tags = {
    name = "Log Analytics Data Source Connection"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_ant_mal" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "IaaSAntimalware"
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.5"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
  {
  "AntimalwareEnabled": "true",
  "RealtimeProtectionEnabled": "true",
  "ScheduledScanSettings": {
    "isEnabled": "true",
    "day": "1",
    "time": "120",
    "scanType": "Quick"
  },
  "Exclusions": {}
  }
  SETTINGS

  tags = {
    name = "Anti Malware"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_dsk_enc" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "AzureDiskEncryption"
  publisher                  = "Microsoft.Azure.Security"
  type                       = "AzureDiskEncryption"
  type_handler_version       = "2.2"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
  {
    "EncryptionOperation": "EnableEncryption",
    "KeyEncryptionKeyURL": "${azurerm_key_vault_key.rg_pri_cmk_enc_kv_rg_pri_rls_vm_dsk_enc_key.id}",
    "KeyVaultResourceId":"${azurerm_key_vault.rg_pri_cmk_enc_kv.id}",
    "KekVaultResourceId":"${azurerm_key_vault.rg_pri_cmk_enc_kv.id}",
    "KeyVaultURL":"${azurerm_key_vault.rg_pri_cmk_enc_kv.vault_uri}",
    "KeyEncryptionAlgorithm": "RSA-OAEP",
    "VolumeType": "All"
  }
  SETTINGS
  tags = {
    name = "Disk Encryption Extension"
  }
}

data "template_file" "rg_pri_rls_vm_ext_diag_config" {
  template = file("${local.configs_path}/vm-ext-diag-config.xml")
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_diag" {
  name                       = "IaaSDiagnostics"
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  publisher                  = "Microsoft.Azure.Diagnostics"
  type                       = "IaaSDiagnostics"
  type_handler_version       = "1.18"
  auto_upgrade_minor_version = true

  settings           = <<SETTINGS
  {
    "xmlCfg": "${base64encode(data.template_file.rg_pri_rls_vm_ext_diag_config.rendered)}",
    "storageAccount": "${azurerm_storage_account.rg_pri_log_sa.name}"
  }
  SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
  {
    "storageAccountName": "${azurerm_storage_account.rg_pri_log_sa.name}",
    "storageAccountKey": "${azurerm_storage_account.rg_pri_log_sa.primary_access_key}"
  }
  PROTECTED_SETTINGS
  tags = {
    name = "VM Diagnostics Extention"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_nww" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "NetworkWatcherAgentWindows"
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentWindows"
  type_handler_version       = "1.4"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  tags = {
    name = "Azure Network Watcher Agent Extension"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_hwg" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "HybridWorkerExtension"
  publisher                  = "Microsoft.Azure.Automation.HybridWorker"
  type                       = "HybridWorkerForWindows"
  type_handler_version       = "1.1"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  settings = <<SETTINGS
  {
    "AutomationAccountURL": "${replace(azurerm_automation_account.rg_pri_auto.dsc_server_endpoint, local.auto_hwg_prv_feat.dsc_suffix, local.auto_hwg_prv_feat.hwg_suffix)}"
  }
  SETTINGS
  tags = {
    name = "Release HybridWorker Group Extension"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_aad_lgn" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "AADLoginForWindows"
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  type                       = "AADLoginForWindows"
  type_handler_version       = "2.0"
  auto_upgrade_minor_version = true

  lifecycle {
    ignore_changes = [
      virtual_machine_id
    ]
  }

  tags = {
    name = "AAD Login Extension"
  }
}


resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_gst_hlt" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "GuestHealthWindowsAgent"
  publisher                  = "Microsoft.Azure.Monitor.VirtualMachines.GuestHealth"
  type                       = "GuestHealthWindowsAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  tags = {
    name = "VM Guest Health Agent"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_dep" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "DependencyAgentWindows"
  publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                       = "DependencyAgentWindows"
  type_handler_version       = "9.10"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  tags = {
    name = "VM Insights Dependency Agent Extension"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_rls_vm_ext_gcfg" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  name                       = "GuestConfigurationExtension"
  publisher                  = "Microsoft.GuestConfiguration"
  type                       = "ConfigurationforWindows"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true
  tags = {
    name = "Guest Configuration Extension"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_ext_mon" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  name                       = "AzureMonitorWindowsAgent"
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.2"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true
  protected_settings         = <<PROTECTED_SETTINGS
  {
    "workspaceKey" : "${azurerm_log_analytics_workspace.rg_pri_mon_la_ws.primary_shared_key}"
  }
  PROTECTED_SETTINGS
  settings                   = <<SETTINGS
  {
    "workspaceId" : "${azurerm_log_analytics_workspace.rg_pri_mon_la_ws.workspace_id}"
  }
  SETTINGS
  tags = {
    name = "Log Analytics Data Source Connection"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_ext_ant_mal" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  name                       = "IaaSAntimalware"
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.5"
  auto_upgrade_minor_version = true


  settings = <<SETTINGS
  {
  "AntimalwareEnabled": "true",
  "RealtimeProtectionEnabled": "true",
  "ScheduledScanSettings": {
    "isEnabled": "true",
    "day": "1",
    "time": "120",
    "scanType": "Quick"
  },
  "Exclusions": {}
  }
  SETTINGS

  tags = {
    name = "Anti Malware"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_ext_dsk_enc" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  name                       = "AzureDiskEncryption"
  publisher                  = "Microsoft.Azure.Security"
  type                       = "AzureDiskEncryption"
  type_handler_version       = "2.2"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
  {
    "EncryptionOperation": "EnableEncryption",
    "KeyEncryptionKeyURL": "${azurerm_key_vault_key.rg_pri_cmk_enc_kv_rg_pri_jmb_vm_dsk_enc_key.id}",
    "KeyVaultResourceId":"${azurerm_key_vault.rg_pri_cmk_enc_kv.id}",
    "KekVaultResourceId":"${azurerm_key_vault.rg_pri_cmk_enc_kv.id}",
    "KeyVaultURL":"${azurerm_key_vault.rg_pri_cmk_enc_kv.vault_uri}",
    "KeyEncryptionAlgorithm": "RSA-OAEP",
    "VolumeType": "All"
  }
  SETTINGS
  tags = {
    name = "Disk Encryption Extension"
  }
}

data "template_file" "rg_pri_jmb_vm_ext_diag_config" {
  template = file("${local.configs_path}/vm-ext-diag-config.xml")
}

resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_ext_diag" {
  name                       = "IaaSDiagnostics"
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  publisher                  = "Microsoft.Azure.Diagnostics"
  type                       = "IaaSDiagnostics"
  type_handler_version       = "1.18"
  auto_upgrade_minor_version = true

  settings           = <<SETTINGS
  {
    "xmlCfg": "${base64encode(data.template_file.rg_pri_jmb_vm_ext_diag_config.rendered)}",
    "storageAccount": "${azurerm_storage_account.rg_pri_log_sa.name}"
  }
  SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
  {
    "storageAccountName": "${azurerm_storage_account.rg_pri_log_sa.name}",
    "storageAccountKey": "${azurerm_storage_account.rg_pri_log_sa.primary_access_key}"
  }
  PROTECTED_SETTINGS
  tags = {
    name = "VM Diagnostics Extention"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_ext_nww" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  name                       = "NetworkWatcherAgentWindows"
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentWindows"
  type_handler_version       = "1.4"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  lifecycle {
    ignore_changes = [
      virtual_machine_id
    ]
  }

  tags = {
    name = "Azure Network Watcher Agent Extension"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_ext_aad_lgn" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  name                       = "AADLoginForWindows"
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  type                       = "AADLoginForWindows"
  type_handler_version       = "2.0"
  auto_upgrade_minor_version = true

  lifecycle {
    ignore_changes = [
      virtual_machine_id
    ]
  }

  tags = {
    name = "AAD Login Extension"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_gst_hlt" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  name                       = "GuestHealthWindowsAgent"
  publisher                  = "Microsoft.Azure.Monitor.VirtualMachines.GuestHealth"
  type                       = "GuestHealthWindowsAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  tags = {
    name = "VM Guest Health Agent"
  }
}


resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_ext_dep" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  name                       = "DependencyAgentWindows"
  publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                       = "DependencyAgentWindows"
  type_handler_version       = "9.10"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true

  tags = {
    name = "VM Insights Dependency Agent Extension"
  }
}

resource "azurerm_virtual_machine_extension" "rg_pri_jmb_vm_ext_gcfg" {
  virtual_machine_id         = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  name                       = "GuestConfigurationExtension"
  publisher                  = "Microsoft.GuestConfiguration"
  type                       = "ConfigurationforWindows"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = true
  tags = {
    name = "Guest Configuration Extension"
  }
}