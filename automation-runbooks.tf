resource "azurerm_automation_runbook" "rg_pri_auto_chk_d365_avl_rb" {
  name                            = "check-d365-avl-rb"
  resource_group_name             = azurerm_resource_group.rg_pri.name
  location                        = azurerm_resource_group.rg_pri.location
  automation_account_name         = azurerm_automation_account.rg_pri_auto.name
  log_verbose                     = var.auto_chk_d365_avl_rb_01_log_verbose
  log_progress                    = var.auto_chk_d365_avl_rb_01_log_progress
  description                     = var.auto_chk_d365_avl_rb_01_description
  runbook_type                    = var.auto_chk_d365_avl_rb_01_runbook_type

  publish_content_link {
    uri = "https://www.office.com/"
  }


  content = file("${local.ps_scripts_path}\\template-file-automation-check-d365-avl-rb-07.ps1")

  lifecycle {
    #ignore_changes = [publish_content_link]
  }

  tags = {
    company     = var.company_name_long
    product     = local.product_name_long
    region      = var.rg_pri_location_long
    environment = var.environment_long
    name        = "The script for checking availabilty of D365 and sending availabilty telemetry to Application Insights (Azure Automation 1)"
  }

  depends_on = [
    azurerm_automation_account.rg_pri_auto
  ]
}