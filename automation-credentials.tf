resource "azurerm_automation_credential" "rg_pri_auto_notification_email_crd" {
  name                    = "${local.resource_prefix_rg_pri}-notification-email-crd-${var.product_unique}"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  username                = var.notification_email_username
  password                = var.notification_email_password
  description             = var.notification_email_description
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
}

