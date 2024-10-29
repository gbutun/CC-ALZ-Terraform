resource "azurerm_resource_group" "rg_pri" {
  name     = "${local.resource_prefix_rg_pri}-rg-sol-${var.product_unique}"
  location = var.rg_pri_location_long

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "Resource Group (Primary Region)"
  }
}

#--

resource "azurerm_resource_group" "rg_sec" {
  name     = "${local.resource_prefix_rg_sec}-rg-sol-${var.product_unique}"
  location = var.rg_sec_location_long

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_sec_location_long
    environment = var.environment_long
    name        = "Resource Group (Secondary Region)"
  }
}

