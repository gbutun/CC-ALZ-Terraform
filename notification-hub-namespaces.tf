resource "azurerm_notification_hub_namespace" "rg_pri_nhb_ns_mob" {
  name                = "${local.resource_prefix_rg_pri}-nhb-ns-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location
  namespace_type      = var.rg_pri_nhb_ns_mob_namespace_type
  sku_name            = var.rg_pri_nhb_ns_mob_sku_name

  tags = {
    company                   = var.company_name_long
    product                   = var.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Notification Hub Workspace 1 Used for sending push notifications to Mobile Devices"
  }
}

#--

# Notification Hubs not available in Germany North 
# resource "azurerm_notification_hub_namespace" "rg_sec_nhb_ns_mob" {
#   name                = "${local.resource_prefix_rg_sec}-nhb-ns-${var.product_unique}"
#   resource_group_name = azurerm_resource_group.rg_sec.name
#   location            = azurerm_resource_group.rg_sec.location
#   namespace_type      = var.rg_sec_nhb_ns_mob_namespace_type
#   sku_name            = var.rg_sec_nhb_ns_mob_sku_name

#   tags = {
#     company                   = var.company_name_long
#     product                   = var.product_name_long
#     region                    = var.rg_sec_location_long
#     environment               = var.environment_long
#     enable_auto_diag_settings = true
#     name                      = "Azure Notification Hub Workspace 1 Used for sending push notifications to Mobile Devices"
#   }
# }