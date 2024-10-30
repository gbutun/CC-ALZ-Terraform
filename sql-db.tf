locals {
  sql_db = {
    tde_status = {
      enabled  = "Enabled"
      disabled = "Disabled"
    }

    short_term_retention_days = 35

    long_term_weekly_retention_policy  = "PT0S"
    long_term_monthly_retention_policy = "P4M"
    long_term_yearly_retention_policy  = "PT0S"

    collation = {
      latin1_general_ci_as = "SQL_Latin1_General_CP1_CI_AS"
    }

    create_mode = {
      default                = "Default"
      copt                   = "Copy"
      online_secondary       = "OnlineSecondary"
      non_readable_secondary = "NonReadableSecondary"
      point_in_time_restore  = "PointInTimeRestore"
      recovery               = "Recovery"
      restore                = "Restore"
      restore_ltr_backup     = "RestoreLongTermRetentionBackup"
    }
  }
}

resource "azurerm_mssql_database" "rg_pri_vc_db" {
  name            = "${local.resource_prefix_rg_pri}-vc-db-${var.product_unique}"
  server_id       = azurerm_mssql_server.rg_pri_sol_sql.id
  collation       = local.sql_db.collation.latin1_general_ci_as
  create_mode     = local.sql_db.create_mode.default
  elastic_pool_id = azurerm_mssql_elasticpool.rg_pri_sol_sql_ep.id
  max_size_gb     = var.rg_pri_sol_sql_ep_max_size_gb
  enclave_type    = "Default"

  short_term_retention_policy {
    retention_days = local.sql_db.short_term_retention_days
  }

  long_term_retention_policy {
    weekly_retention  = local.sql_db.long_term_weekly_retention_policy
    monthly_retention = local.sql_db.long_term_monthly_retention_policy
    week_of_year      = 1
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure SQL DB (VeriChannel Database)"
  }
}

resource "null_resource" "rg_pri_vc_db_role_member_provisioner" {
  triggers = {
    run_id = 3
  }

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}/azure-sql-server-execute-script.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      sql_scripts_path    = "${local.sql_scripts_path}/template-sql-server-create-ad-group-member.sql"
      resource_group_name = azurerm_resource_group.rg_pri.name
      azure_ad_group_name = azuread_group.sql_admin_aad_group.display_name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      sql_server_user     = local.sql_admin_aad_user_principal_name
      sql_server_password = nonsensitive(random_password.sql_admin_aad_user_login_01.result)
      is_logger_enabled   = true
    }
  }

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}/azure-sql-server-execute-script.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      sql_scripts_path    = "${local.sql_scripts_path}/template-sql-server-add-role-to-member.sql"
      resource_group_name = azurerm_resource_group.rg_pri.name
      azure_ad_group_name = azuread_group.sql_admin_aad_group.display_name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      sql_server_user     = local.sql_admin_aad_user_principal_name
      sql_server_password = nonsensitive(random_password.sql_admin_aad_user_login_01.result)
      is_logger_enabled   = true
    }
  }

  depends_on = [
    azurerm_mssql_server.rg_pri_sol_sql,
    azurerm_mssql_database.rg_pri_vc_db,
    azuread_group.sql_admin_aad_group
  ]
}

resource "null_resource" "rg_pri_vc_db_db_group_role_member_provisioner" {
  triggers = {
    run_id = 3
  }

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}/azure-sql-server-execute-script.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      sql_scripts_path    = "${local.sql_scripts_path}/template-sql-server-create-ad-group-member.sql"
      resource_group_name = azurerm_resource_group.rg_pri.name
      azure_ad_group_name = azuread_group.vc_db_app_aad_group.display_name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      sql_server_user     = local.sql_admin_aad_user_principal_name
      sql_server_password = nonsensitive(random_password.sql_admin_aad_user_login_01.result)
      is_logger_enabled   = true
    }
  }

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}/azure-sql-server-execute-script.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      sql_scripts_path    = "${local.sql_scripts_path}/template-sql-server-add-role-to-member.sql"
      resource_group_name = azurerm_resource_group.rg_pri.name
      azure_ad_group_name = azuread_group.vc_db_app_aad_group.display_name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      sql_server_user     = local.sql_admin_aad_user_principal_name
      sql_server_password = nonsensitive(random_password.sql_admin_aad_user_login_01.result)
      is_logger_enabled   = true
    }
  }

  depends_on = [
    azurerm_mssql_server.rg_pri_sol_sql,
    azurerm_mssql_database.rg_pri_vc_db,
    azuread_group.sql_admin_aad_group,
    #azuread_group.vc_db_app_aad_group_02
  ]
}

resource "null_resource" "rg_pri_vc_db_tde_set" {
  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-sql-server-db-tde-set.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      resource_group_name = azurerm_resource_group.rg_pri.name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      tde_status          = local.sql_db.tde_status.enabled
      is_logger_enabled   = true
    }
  }

  triggers = {
    run_id = 3
  }

  depends_on = [
    azurerm_mssql_server.rg_pri_sol_sql,
    azurerm_mssql_database.rg_pri_vc_db,
  ]
}


resource "null_resource" "rg_pri_vc_db_ro_pim_group_role_member_provisioner" {
  triggers = {
    run_id = 2
  }

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}/azure-sql-server-execute-script.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      sql_scripts_path    = "${local.sql_scripts_path}/template-sql-server-create-ad-group-member.sql"
      resource_group_name = azurerm_resource_group.rg_pri.name
      azure_ad_group_name = azuread_group.vc_db_app_aad_ro_pim_group.display_name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      sql_server_user     = local.sql_admin_aad_user_principal_name
      sql_server_password = nonsensitive(random_password.sql_admin_aad_user_login_01.result)
      is_logger_enabled   = true
    }
  }

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}/azure-sql-server-execute-script.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      sql_scripts_path    = "${local.sql_scripts_path}/template-sql-server-add-role-to-member-ro.sql"
      resource_group_name = azurerm_resource_group.rg_pri.name
      azure_ad_group_name = azuread_group.vc_db_app_aad_ro_pim_group.display_name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      sql_server_user     = local.sql_admin_aad_user_principal_name
      sql_server_password = nonsensitive(random_password.sql_admin_aad_user_login_01.result)
      is_logger_enabled   = true
    }
  }

  depends_on = [
    azurerm_mssql_server.rg_pri_sol_sql,
    azurerm_mssql_database.rg_pri_vc_db,
    azuread_group.vc_db_app_aad_ro_pim_group
  ]
}

resource "null_resource" "rg_pri_vc_db_rw_pim_group_role_member_provisioner" {
  triggers = {
    run_id = 2
  }

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}/azure-sql-server-execute-script.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      sql_scripts_path    = "${local.sql_scripts_path}/template-sql-server-create-ad-group-member.sql"
      resource_group_name = azurerm_resource_group.rg_pri.name
      azure_ad_group_name = azuread_group.vc_db_app_aad_rw_pim_group.display_name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      sql_server_user     = local.sql_admin_aad_user_principal_name
      sql_server_password = nonsensitive(random_password.sql_admin_aad_user_login_01.result)
      is_logger_enabled   = true
    }
  }

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}/azure-sql-server-execute-script.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      sql_scripts_path    = "${local.sql_scripts_path}/template-sql-server-add-role-to-member-rw.sql"
      resource_group_name = azurerm_resource_group.rg_pri.name
      azure_ad_group_name = azuread_group.vc_db_app_aad_rw_pim_group.display_name
      sql_server_name     = azurerm_mssql_server.rg_pri_sol_sql.name
      sql_server_db_name  = azurerm_mssql_database.rg_pri_vc_db.name
      sql_server_user     = local.sql_admin_aad_user_principal_name
      sql_server_password = nonsensitive(random_password.sql_admin_aad_user_login_01.result)
      is_logger_enabled   = true
    }
  }

  depends_on = [
    azurerm_mssql_server.rg_pri_sol_sql,
    azurerm_mssql_database.rg_pri_vc_db,
    azuread_group.vc_db_app_aad_rw_pim_group
  ]
}

#--

data "azurerm_mssql_database" "rg_sec_vc_db" {
  name      = "p-gwc-vc-db-z5b"
  server_id = azurerm_mssql_server.rg_sec_sol_sql.id
}