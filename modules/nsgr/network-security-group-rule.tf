
resource "azurerm_network_security_rule" "nsg_rules" {
  name                        = var.nsg_rule_name
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_name
  description                 = var.nsg_description
  priority                    = var.nsg_priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.spr
  destination_port_range      = var.dpr
  source_address_prefixes     = [var.s_address_prefix]
  destination_address_prefix  = [var.d_address_prefix]
}