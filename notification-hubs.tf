resource "azurerm_notification_hub" "rg_pri_nhb_ns_mob_nhb" {
  name                = "${local.resource_prefix_rg_pri}-nhb-ns-nhb-${var.product_unique}"
  namespace_name      = azurerm_notification_hub_namespace.rg_pri_nhb_ns_mob.name
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location

  # apns_credential {
  #   application_mode = var.rg_pri_nhub_01_hb_01_apns_credential_application_mode
  #   bundle_id        = var.rg_pri_nhub_01_hb_01_apns_credential_bundle_id
  #   key_id           = var.rg_pri_nhub_01_hb_01_apns_credential_key_id
  #   team_id          = var.rg_pri_nhub_01_hb_01_apns_credential_team_id
  #   token            = var.rg_pri_nhub_01_hb_01_apns_credential_token
  # }

  #gcm_credential {
  #  api_key = var.rg_pri_nhub_hb_gcm_credential_api_key
  #}

  depends_on = [azurerm_notification_hub_namespace.rg_pri_nhb_ns_mob]

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Notification Hubs 1 Used for sending push notifications to Mobile Devices"
  }
}

#--

# Notification Hubs not available in Germany North 

# resource "azurerm_notification_hub" "rg_sec_nhb_ns_mob_nhb" {
#   name                = "${local.resource_prefix_rg_sec}-nhb-ns-nhb-${var.product_unique}"
#   namespace_name      = azurerm_notification_hub_namespace.rg_sec_nhb_ns_mob.name
#   resource_group_name = azurerm_resource_group.rg_sec.name
#   location            = azurerm_resource_group.rg_sec.location

#   # apns_credential {
#   #   application_mode = var.rg_sec_nhub_01_hb_01_apns_credential_application_mode
#   #   bundle_id        = var.rg_sec_nhub_01_hb_01_apns_credential_bundle_id
#   #   key_id           = var.rg_sec_nhub_01_hb_01_apns_credential_key_id
#   #   team_id          = var.rg_sec_nhub_01_hb_01_apns_credential_team_id
#   #   token            = var.rg_sec_nhub_01_hb_01_apns_credential_token
#   # }

#   #gcm_credential {
#   #  api_key = var.rg_sec_nhub_hb_gcm_credential_api_key
#   #}

#   depends_on = [azurerm_notification_hub_namespace.rg_sec_nhb_ns_mob]

#     tags = {
#     company                   = var.company_name_long
#     product                   = local.product_name_long
#     region                    = var.rg_sec_location_long
#     environment               = var.environment_long
#     enable_auto_diag_settings = true
#     name                      = "Azure Notification Hubs 1 Used for sending push notifications to Mobile Devices"
#   }
# }