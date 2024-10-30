resource "azurerm_resource_group" "rg" {
  name      = var.resource_group_name
  location = var.location
  
  tags = {
    company     = var.company
    product     = var.product
    region      = var.location
    environment = var.environment
    name        = var.name
  }

}
