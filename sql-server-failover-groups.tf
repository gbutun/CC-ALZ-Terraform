locals {
  sol_sql_failover_group = {
    name                  = "${local.resource_prefix_rg_pri}-sol-sql-fgp-${var.product_unique}"
    failover_grace_period = "60"
    failover_policy       = "Automatic"
  }

  sol_sql_failover_group_fqdns = {
    primary_fqdn   = "${local.sol_sql_failover_group.name}.database.windows.net"
    secondary_fqdn = "${local.sol_sql_failover_group.name}.secondary.database.windows.net"
  }
}

resource "azurerm_mssql_failover_group" "rg_pri_sol_sql_failover_group" {
  name      = local.sol_sql_failover_group.name
  server_id = azurerm_mssql_server.rg_pri_sol_sql.id
  databases = [
    azurerm_mssql_database.rg_pri_vc_db.id
  ]

  partner_server {
    id = azurerm_mssql_server.rg_sec_sol_sql.id
  }

  read_write_endpoint_failover_policy {
    mode          = local.sol_sql_failover_group.failover_policy
    grace_minutes = local.sol_sql_failover_group.failover_grace_period
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure SQL Server 1.1 Failover Group (VeriChannel)"
  }

}
