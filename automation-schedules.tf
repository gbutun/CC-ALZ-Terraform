locals {
  azurerm_automation_schedule_description_daily = "Daily Schedule"

  azurerm_automation_schedule_description_hourly = "Hourly Schedule"
}
resource "azurerm_automation_schedule" "rg_pri_auto_daily_sch" {
  name                    = "daily-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Day"
  interval                = 1
  description             = local.azurerm_automation_schedule_description_daily
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_sch" {
  name                    = "hourly-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  description             = local.azurerm_automation_schedule_description_hourly
}


resource "azurerm_automation_schedule" "rg_pri_auto_hourly_05_min_sch" {
  name                    = "hourly-05-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "10m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_10_min_sch" {
  name                    = "hourly-10-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "15m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_15_min_sch" {
  name                    = "hourly-15-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "20m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_20_min_sch" {
  name                    = "hourly-20-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "25m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_25_min_sch" {
  name                    = "hourly-25-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "30m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_30_min_sch" {
  name                    = "hourly-30-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "35m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_35_min_sch" {
  name                    = "hourly-35-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "40m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_40_min_sch" {
  name                    = "hourly-40-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "45m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_45_min_sch" {
  name                    = "hourly-45-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "50m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_50_min_sch" {
  name                    = "hourly-50-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "55m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}

resource "azurerm_automation_schedule" "rg_pri_auto_hourly_55_min_sch" {
  name                    = "hourly-55-min-sch"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  frequency               = "Hour"
  interval                = 1
  start_time              = timeadd(timestamp(), "60m")
  description             = local.azurerm_automation_schedule_description_hourly

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }
}
