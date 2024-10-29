locals {
  sql = {
    version = {
      v12_0 = "12.0"
    }
    minimum_tls_version = {
      tls_10 = "1.0"
      tls_11 = "1.1"
      tls_12 = "1.2"
    }
  }
}

resource "azurerm_mssql_server" "rg_pri_sol_sql" {
  name                         = "${local.resource_prefix_rg_pri}-sol-sql-${var.product_unique}"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  location                     = azurerm_resource_group.rg_pri.location
  version                      = local.sql.version.v12_0
  administrator_login          = var.rg_pri_sol_sql_administrator_login
  administrator_login_password = random_password.rg_pri_sol_sql_administrator_login.result
  minimum_tls_version          = local.sql.minimum_tls_version.tls_12

  identity {
    type = local.resource_identity_type.system_assigned
  }

  azuread_administrator {
    tenant_id      = var.tenant_id
    login_username = azuread_group.sql_admin_aad_group.display_name
    object_id      = azuread_group.sql_admin_aad_group.id
  }

  lifecycle {
    ignore_changes = [transparent_data_encryption_key_vault_key_id]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure SQL Server (VeriChannel)"
  }
}

resource "azurerm_mssql_server_transparent_data_encryption" "rg_pri_sol_sql_tde_set" {
  server_id        = azurerm_mssql_server.rg_pri_sol_sql.id
  key_vault_key_id = azurerm_key_vault_key.rg_pri_cmk_enc_kv_sol_sql_tde_key_01.id
}

#--


resource "azurerm_mssql_server" "rg_sec_sol_sql" {
  name                         = "${local.resource_prefix_rg_sec}-sol-sql-${var.product_unique}"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  location                     = azurerm_resource_group.rg_sec.location
  version                      = local.sql.version.v12_0
  administrator_login          = var.rg_sec_sol_sql_administrator_login
  administrator_login_password = random_password.rg_pri_sol_sql_administrator_login.result
  minimum_tls_version          = local.sql.minimum_tls_version.tls_12

  identity {
    type = local.resource_identity_type.system_assigned
  }

  azuread_administrator {
    tenant_id      = var.tenant_id
    login_username = azuread_group.sql_admin_aad_group.display_name
    object_id      = azuread_group.sql_admin_aad_group.id
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure SQL Server (VeriChannel)"
  }

  lifecycle {
    ignore_changes = [transparent_data_encryption_key_vault_key_id]
  }
}

resource "azurerm_mssql_server_transparent_data_encryption" "rg_sec_sol_sql_tde_set" {
  server_id        = azurerm_mssql_server.rg_sec_sol_sql.id
  key_vault_key_id = data.azurerm_key_vault_key.rg_sec_cmk_enc_kv_sol_sql_tde_key_01.id
}
