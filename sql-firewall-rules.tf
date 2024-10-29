# resource "azurerm_mssql_firewall_rule" "rg_pri_sol_sql_vrp_all_ips_fwr" {
#   count            = length(local.vrp_all_ips)
#   name             = format("frw-rule-%s", 1 + count.index)
#   server_id        = azurerm_mssql_server.rg_pri_sol_sql.id
#   start_ip_address = cidrhost(local.vrp_all_ips[count.index], 0)
#   end_ip_address   = cidrhost(local.vrp_all_ips[count.index], -1)
# }

# #--

# resource "azurerm_mssql_firewall_rule" "rg_sec_sol_sql_vrp_all_ips_fwr" {
#   count            = length(local.vrp_all_ips)
#   name             = format("frw-rule-%s", 1 + count.index)
#   server_id        = azurerm_mssql_server.rg_sec_sol_sql.id
#   start_ip_address = cidrhost(local.vrp_all_ips[count.index], 0)
#   end_ip_address   = cidrhost(local.vrp_all_ips[count.index], -1)
# }