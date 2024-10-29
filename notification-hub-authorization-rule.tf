locals {
  nhub_auth_rule_manager = {
    listen = true
    send   = true
    manage = false
  }
}

resource "azurerm_notification_hub_authorization_rule" "rg_pri_nhb_auth_mob_nhb" {
  name                  = "${local.resource_prefix_rg_pri}-nhb-auth-nhb-${var.product_unique}"
  notification_hub_name = azurerm_notification_hub.rg_pri_nhb_ns_mob_nhb.name
  namespace_name        = azurerm_notification_hub_namespace.rg_pri_nhb_ns_mob.name
  resource_group_name   = azurerm_resource_group.rg_pri.name
  listen                = local.nhub_auth_rule_manager.listen
  send                  = local.nhub_auth_rule_manager.send
  manage                = local.nhub_auth_rule_manager.manage

  depends_on = [
    azurerm_notification_hub_namespace.rg_pri_nhb_ns_mob,
    azurerm_notification_hub.rg_pri_nhb_ns_mob_nhb,
  ]

}

#--

# resource "azurerm_notification_hub_authorization_rule" "rg_sec_nhb_auth_mob_nhb" {
#   name                  = "${local.resource_prefix_rg_sec}-nhb-auth-nhb-${var.product_unique}"
#   notification_hub_name = azurerm_notification_hub.rg_sec_nhb_ns_mob_nhb.name
#   namespace_name        = azurerm_notification_hub_namespace.rg_sec_nhb_ns_mob.name
#   resource_group_name   = azurerm_resource_group.rg_sec.name
#   listen = local.nhub_auth_rule_manager.listen
#   send   = local.nhub_auth_rule_manager.send
#   manage = local.nhub_auth_rule_manager.manage

#   depends_on = [
#     azurerm_notification_hub_namespace.rg_sec_nhb_ns_mob,
#     azurerm_notification_hub.rg_sec_nhb_ns_mob_nhb,
#   ]

# }