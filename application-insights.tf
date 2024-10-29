locals {
  ai = {
    application_type = {
      ios           = "ios"
      java          = "java"
      mobile_center = "MobileCenter"
      nodejs        = "Node.JS"
      other         = "other"
      phone         = "phone"
      store         = "store"
      web           = "web"
    }
  }
}

resource "azurerm_application_insights" "rg_pri_mon_ai" {
  name                = "${local.resource_prefix_rg_pri}-mon-ai-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location
  workspace_id        = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
  application_type    = local.ai.application_type.web
  sampling_percentage = var.rg_pri_mon_ai_sampling_percentage

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Using for APM and diagnostic logging. (Azure Monitor 1 - Application Insights)"
  }
}
