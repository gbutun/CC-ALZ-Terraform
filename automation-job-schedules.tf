locals {
  auto_rls_hwg = "p-gwc-auto-hwg-z5b"
}


resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_daily_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_daily_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_05_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_05_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_10_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_10_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_15_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_15_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_20_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_20_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_25_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_25_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_30_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_30_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_35_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_35_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_40_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_40_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_45_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_45_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_50_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_50_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}

resource "azurerm_automation_job_schedule" "rg_pri_auto_chk_d365_avl_rb_auto_hourly_55_min_sch" {
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name
  schedule_name           = azurerm_automation_schedule.rg_pri_auto_hourly_55_min_sch.name
  runbook_name            = azurerm_automation_runbook.rg_pri_auto_chk_d365_avl_rb.name
  run_on                  = local.auto_rls_hwg
}