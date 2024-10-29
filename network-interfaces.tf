locals {
  nic = {
    private_ip_address_allocation = {
      static  = "Static"
      dynamic = "Dynamic"
    }

    rls_nic_config_name = "rls-sub09-nic-ipconfig"
    jmb_nic_config_name = "jmb-sub02-nic-ipconfig"
  }
}

resource "azurerm_network_interface" "rg_pri_rls_vm_pvt_nic" {
  name                          = "${local.resource_prefix_rg_pri}-rls-vm-nic-${var.product_unique}"
  location                      = azurerm_resource_group.rg_pri.location
  resource_group_name           = azurerm_resource_group.rg_pri.name
  enable_accelerated_networking = false

  ip_configuration {
    name                          = local.nic.rls_nic_config_name
    subnet_id                     = azurerm_subnet.rg_pri_spk_vn_rls_sub.id
    private_ip_address_allocation = local.nic.private_ip_address_allocation.static
    private_ip_address            = cidrhost(var.rg_pri_spk_vn_rls_sub_address_space, 4)
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Release VM Network Interface"
  }
}

resource "azurerm_network_interface" "rg_pri_jmb_vm_pub_nic" {
  name                          = "${local.resource_prefix_rg_pri}-jmb-vm-nic-${var.product_unique}"
  location                      = azurerm_resource_group.rg_pri.location
  resource_group_name           = azurerm_resource_group.rg_pri.name
  enable_accelerated_networking = false

  ip_configuration {
    name                          = local.nic.jmb_nic_config_name
    subnet_id                     = azurerm_subnet.rg_pri_hub_vn_jmb_sub.id
    private_ip_address_allocation = local.nic.private_ip_address_allocation.static
    private_ip_address            = cidrhost(var.rg_pri_hub_vn_jmb_sub_address_space, 4)
    public_ip_address_id          = azurerm_public_ip.rg_pri_jmb_vm_pip.id
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Jumpbox VM 2.1 Network Interface"
  }
}