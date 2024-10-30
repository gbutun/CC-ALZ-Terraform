resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = {
    company                   = var.company
    product                   = var.product
    region                    = var.location
    environment               = var.environment
    enable_auto_diag_settings = true
    tag_name                      = var.tag_name
  }
}
