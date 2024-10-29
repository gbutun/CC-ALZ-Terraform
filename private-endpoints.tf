locals {
  private_link_types = {
    sql = {
      suffix            = "privatelink.database.windows.net"
      subresource_names = ["sqlServer"]
    }

    websites = {
      suffix            = "privatelink.azurewebsites.net"
      subresource_names = ["sites"]
    }

    synapse = {
      suffix            = "privatelink.sql.azuresynapse.net"
      subresource_names = ["sqlServer"]
    }
  }
}

resource "azurerm_private_endpoint" "rg_pri_sol_sql_pe" {
  name                = "${local.resource_prefix_rg_pri}-sol-sql-${local.resource_prefix_rg_pri}-pe-${var.product_unique}"
  location            = azurerm_resource_group.rg_pri.location
  resource_group_name = azurerm_resource_group.rg_pri.name
  subnet_id           = azurerm_subnet.rg_pri_spk_vn_sql_pe_int_sub.id

  private_service_connection {
    name                           = "${local.resource_prefix_rg_pri}-sol-sql-${local.resource_prefix_rg_pri}-pe-psc-${var.product_unique}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.rg_pri_sol_sql.id
    subresource_names              = local.private_link_types.sql.subresource_names
  }

  private_dns_zone_group {
    name = local.private_link_types.sql.suffix
    private_dns_zone_ids = [
      azurerm_private_dns_zone.rg_pri_prv_dns_zone_privatelink_database_windows_net.id
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Solution SQL Server - Private Endpoint"
  }
}

resource "azurerm_private_endpoint" "rg_pri_sol_sql_pe_02" {
  name                = "${local.resource_prefix_rg_pri}-sol-sql-${local.resource_prefix_rg_sec}-pe-02-${var.product_unique}"
  location            = azurerm_resource_group.rg_sec.location
  resource_group_name = azurerm_resource_group.rg_sec.name
  subnet_id           = azurerm_subnet.rg_sec_spk_vn_sql_pe_int_sub.id

  private_service_connection {
    name                           = "${local.resource_prefix_rg_pri}-sol-sql-${local.resource_prefix_rg_sec}-pe-02-psc-${var.product_unique}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.rg_pri_sol_sql.id
    subresource_names              = local.private_link_types.sql.subresource_names
  }

  private_dns_zone_group {
    name = local.private_link_types.sql.suffix
    private_dns_zone_ids = [
      azurerm_private_dns_zone.rg_sec_prv_dns_zone_privatelink_database_windows_net.id
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Solution SQL Server - Private Endpoint "
  }
}

#--


resource "azurerm_private_endpoint" "rg_sec_sol_sql_pe" {
  name                = "${local.resource_prefix_rg_sec}-sol-sql-${local.resource_prefix_rg_sec}-pe-${var.product_unique}"
  location            = azurerm_resource_group.rg_sec.location
  resource_group_name = azurerm_resource_group.rg_sec.name
  subnet_id           = azurerm_subnet.rg_sec_spk_vn_sql_pe_int_sub.id

  private_service_connection {
    name                           = "${local.resource_prefix_rg_sec}-sol-sql-${local.resource_prefix_rg_sec}-pe-psc-${var.product_unique}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.rg_sec_sol_sql.id
    subresource_names              = local.private_link_types.sql.subresource_names
  }

  private_dns_zone_group {
    name = local.private_link_types.sql.suffix
    private_dns_zone_ids = [
      azurerm_private_dns_zone.rg_sec_prv_dns_zone_privatelink_database_windows_net.id
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Solution SQL Server - Private Endpoint"
  }
}

resource "azurerm_private_endpoint" "rg_sec_sol_sql_pe_02" {
  name                = "${local.resource_prefix_rg_sec}-sol-sql-${local.resource_prefix_rg_pri}-pe-02-${var.product_unique}"
  location            = azurerm_resource_group.rg_pri.location
  resource_group_name = azurerm_resource_group.rg_pri.name
  subnet_id           = azurerm_subnet.rg_pri_spk_vn_sql_pe_int_sub.id

  private_service_connection {
    name                           = "${local.resource_prefix_rg_sec}-sol-sql-${local.resource_prefix_rg_pri}-pe-psc-${var.product_unique}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mssql_server.rg_sec_sol_sql.id
    subresource_names              = local.private_link_types.sql.subresource_names
  }

  private_dns_zone_group {
    name = local.private_link_types.sql.suffix
    private_dns_zone_ids = [
      azurerm_private_dns_zone.rg_pri_prv_dns_zone_privatelink_database_windows_net.id
    ]
  }

  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Solution SQL Server - Private Endpoint"
  }
}


