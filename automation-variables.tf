resource "azurerm_automation_variable_string" "rg_pri_auto_notification_contact_email_group_vr" {
  name                    = "notification-contact-email-group-vr"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  value                   = join(";", var.auto_notification_contact_email_group) #TODO: Put this to an array and add your email addresses (mohan - added into an array)
  encrypted               = true
}

resource "azurerm_automation_variable_string" "rg_pri_auto_ai_int_key_vr" {
  name                    = "ai-int-key-vr"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  value                   = azurerm_application_insights.rg_pri_mon_ai.instrumentation_key
  encrypted               = true
}

resource "azurerm_automation_variable_string" "rg_pri_auto_d365_url_vr" {
  name                    = "d365-url-vr"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  value                   = var.customer_d365_org_url
  encrypted               = true
}

resource "azurerm_automation_variable_string" "rg_pri_auto_d365_avl_chk_aad_client_id_secret_vr" {
  name                    = "d365-avl-chk-aad-client-id-secret-vr"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  value                   = azurerm_key_vault_secret.rg_pri_auto_kv_d365_availability_check_client_id_secret.id
  encrypted               = true
}

resource "azurerm_automation_variable_string" "rg_pri_auto_d365_avl_chk_aad_client_password_01_secret_vr" {
  name                    = "d365-avl-chk-aad-client-password-01-secret-vr"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  value                   = azurerm_key_vault_secret.rg_pri_auto_kv_d365_availability_check_client_secret_secret.id
  encrypted               = true
}