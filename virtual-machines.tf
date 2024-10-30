locals {
  vm = {
    os_disk_caching = {
      none       = "None"
      read_only  = "ReadOnly"
      read_write = "ReadWrite"
    }
    os_disk_storage_account_type = {
      standard_LRS     = "Standard_LRS"
      standard_SSD_LRS = "StandardSSD_LRS"
      premium_LRS      = "Premium_LRS"
    }

    source_image_reference = {
      release = {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2022-Datacenter"
        version   = "latest"
      }
    }
  }
}

resource "azurerm_windows_virtual_machine" "rg_pri_rls_vm" {
  name                                                   = "${local.resource_prefix_rg_pri}-rls-vm-${var.product_unique}"
  location                                               = azurerm_resource_group.rg_pri.location
  resource_group_name                                    = azurerm_resource_group.rg_pri.name
  network_interface_ids                                  = [azurerm_network_interface.rg_pri_rls_vm_pvt_nic.id]
  size                                                   = var.rg_pri_rls_vm_size
  admin_username                                         = var.rg_pri_rls_vm_os_profile_admin_username
  admin_password                                         = var.rg_pri_rls_vm_os_profile_admin_password
  computer_name                                          = "${local.resource_prefix_rg_pri_only_environment_and_location}rlsvm${var.product_unique}"
  provision_vm_agent                                     = true
  enable_automatic_updates                               = false
  patch_mode                                             = "AutomaticByPlatform"
  patch_assessment_mode                                  = "AutomaticByPlatform"
  bypass_platform_safety_checks_on_user_schedule_enabled = true

  source_image_reference {
    publisher = local.vm.source_image_reference.release.publisher
    offer     = local.vm.source_image_reference.release.offer
    sku       = local.vm.source_image_reference.release.sku
    version   = local.vm.source_image_reference.release.version
  }

  identity {
    type = local.resource_identity_type.system_assigned
  }

  os_disk {
    name                 = "${local.resource_prefix_rg_pri}-rls-vm-os-disk-${var.product_unique}"
    caching              = local.vm.os_disk_caching.read_write
    storage_account_type = local.vm.os_disk_storage_account_type.premium_LRS
    disk_size_gb         = var.rg_pri_rls_vm_os_disk_disk_size_gb
  }

  #   boot_diagnostics {
  #     storage_account_uri = var.storage_account_rotation_key_id == "1" ? azurerm_storage_account.rg_pri_log_sa.primary_blob_endpoint : azurerm_storage_account.rg_pri_log_sa.secondary_blob_endpoint
  #   }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "VM Release Server Runs Deployments and Automation Tasks"
  }
}


resource "azurerm_windows_virtual_machine" "rg_pri_jmb_vm" {
  name                                                   = "${local.resource_prefix_rg_pri}-jmb-vm-${var.product_unique}"
  location                                               = azurerm_resource_group.rg_pri.location
  resource_group_name                                    = azurerm_resource_group.rg_pri.name
  network_interface_ids                                  = [azurerm_network_interface.rg_pri_jmb_vm_pub_nic.id]
  size                                                   = var.rg_pri_jmb_vm_size
  admin_username                                         = var.rg_pri_jmb_vm_os_profile_admin_username
  admin_password                                         = var.rg_pri_jmb_vm_os_profile_admin_password
  computer_name                                          = "${local.resource_prefix_rg_pri_only_environment_and_location}jmbvm${var.product_unique}"
  provision_vm_agent                                     = true
  enable_automatic_updates                               = false
  patch_mode                                             = "AutomaticByPlatform"
  patch_assessment_mode                                  = "AutomaticByPlatform"
  bypass_platform_safety_checks_on_user_schedule_enabled = true

  source_image_reference {
    publisher = local.vm.source_image_reference.release.publisher
    offer     = local.vm.source_image_reference.release.offer
    sku       = local.vm.source_image_reference.release.sku
    version   = local.vm.source_image_reference.release.version
  }

  identity {
    type = local.resource_identity_type.system_assigned
  }

  os_disk {
    name                 = "${local.resource_prefix_rg_pri}-jmb-vm-os-disk-${var.product_unique}"
    caching              = local.vm.os_disk_caching.read_write
    storage_account_type = local.vm.os_disk_storage_account_type.premium_LRS
    disk_size_gb         = var.rg_pri_jmb_vm_os_disk_disk_size_gb
  }

  #   boot_diagnostics {
  #     storage_account_uri = var.storage_account_rotation_key_id == "1" ? azurerm_storage_account.rg_pri_log_sa.primary_blob_endpoint : azurerm_storage_account.rg_pri_log_sa.secondary_blob_endpoint
  #   }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "VM Jumpbox for Secure RDP Connection"
  }
}

#-- 

