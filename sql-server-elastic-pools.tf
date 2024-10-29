resource "azurerm_mssql_elasticpool" "rg_pri_sol_sql_ep" {
  name                = "${local.resource_prefix_rg_pri}-sol-sql-ep-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location
  server_name         = azurerm_mssql_server.rg_pri_sol_sql.name
  max_size_gb         = var.rg_pri_sol_sql_ep_max_size_gb
  enclave_type        = "Default"

  sku {
    name     = var.rg_pri_sol_sql_ep_sku_name
    tier     = var.rg_pri_sol_sql_ep_sku_tier
    capacity = var.rg_pri_sol_sql_ep_sku_capacity
  }

  per_database_settings {
    min_capacity = var.rg_pri_sol_sql_ep_per_database_min_capacity
    max_capacity = var.rg_pri_sol_sql_ep_per_database_max_capacity
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Elastic Pool (VeriPark Azure SQL Server )"
  }
}

#--

resource "azurerm_mssql_elasticpool" "rg_sec_sol_sql_ep" {
  name                = "${local.resource_prefix_rg_pri}-sol-sql-ep-${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_sec.name
  location            = azurerm_resource_group.rg_sec.location
  server_name         = azurerm_mssql_server.rg_sec_sol_sql.name
  max_size_gb         = var.rg_sec_sol_sql_ep_max_size_gb
  enclave_type        = "Default"

  sku {
    name     = var.rg_sec_sol_sql_ep_sku_name
    tier     = var.rg_sec_sol_sql_ep_sku_tier
    capacity = var.rg_sec_sol_sql_ep_sku_capacity
  }

  per_database_settings {
    min_capacity = var.rg_sec_sol_sql_ep_per_database_min_capacity
    max_capacity = var.rg_sec_sol_sql_ep_per_database_max_capacity
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Elastic Pool (VeriPark Azure SQL Server )"
  }
}
