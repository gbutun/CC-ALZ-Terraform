resource "azurerm_automation_account" "rg_pri_auto" {
  name                = "${local.resource_prefix_rg_pri}-auto-${var.product_unique}"
  location            = azurerm_resource_group.rg_pri.location
  resource_group_name = azurerm_resource_group.rg_pri.name
  sku_name            = var.rg_pri_auto_sku_name

  identity {
    type = local.resource_identity_type.system_assigned
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Automation 1 Used for Azure Resource Automation"
  }
}