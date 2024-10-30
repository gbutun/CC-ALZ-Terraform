resource "azurerm_virtual_network" "vn" {
    name = var.vn_name
    resource_group_name = var.resource_group_name 
    location = var.location
    address_space = [var.vn_address_space]

    tags = {
      company=var.company
      product=var.product
      environment=var.environment
      name=var.name
    }
  
}