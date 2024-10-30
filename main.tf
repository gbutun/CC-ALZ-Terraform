data "azurerm_kubernetes_service_versions" "current" {
  location        = azurerm_resource_group.rg_pri.location
  include_preview = false
}
# TODO: Add new data resources, diagnostic configuration etc. for the new type of services such as kubernetes, container reg. etc

data "azurerm_resources" "rg_pri_auto_diag_enabled_key_vaults" {
  type                = local.resource_types.key_vault
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_sql_servers" {
  type                = local.resource_types.sql_server
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_sql_databases" {
  type                = local.resource_types.sql_database
  resource_group_name = azurerm_resource_group.rg_pri.name
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_storage_accounts" {
  type                = local.resource_types.storage_account
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_network_security_groups" {
  type                = local.resource_types.network_security_group
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "aks_rg_pri_auto_diag_enabled_network_security_groups" {
  type                = local.resource_types.network_security_group
  resource_group_name = local.aks.rg_pri_node_resource_group_name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_virtual_networks" {
  type                = local.resource_types.virtual_network
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_virtual_machines" {
  type                = local.resource_types.virtual_machine
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_network_interfaces" {
  type                = local.resource_types.network_interface
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "aks_rg_pri_auto_diag_enabled_network_interfaces" {
  type                = local.resource_types.network_interface
  resource_group_name = local.aks.rg_pri_node_resource_group_name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_public_ips" {
  type                = local.resource_types.public_ip
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_automation_accounts" {
  type                = local.resource_types.automation_account
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_application_gateways" {
  type                = local.resource_types.application_gateway
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_data_factorys" {
  type                = local.resource_types.data_factory
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_load_balancers" {
  type                = local.resource_types.load_balancer
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_ddos" {
  type                = local.resource_types.ddos
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_virtual_network_gateways" {
  type                = local.resource_types.virtual_network_gateway
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_log_machine_learning_workspaces" {
  type                = local.resource_types.machine_leaning_workspace
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_azure_firwalls" {
  type                = local.resource_types.azure_firwall
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_relay_namespaces" {
  type                = local.resource_types.relay_namespace
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_traffic_managers" {
  type                = local.resource_types.traffic_manager
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_event_hubs" {
  type                = local.resource_types.event_hub
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_notification_hubs" {
  type                = local.resource_types.notification_hub
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_recovery_services_vaults" {
  type                = local.resource_types.recovery_services_vault
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_dns_zones" {
  type                = local.resource_types.dns_zone
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_elastic_pools" {
  type                = local.resource_types.elastic_pool
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_vpn_gateways" {
  type                = local.resource_types.virtual_network_gateway
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_log_analytics_workspaces" {
  type                = local.resource_types.log_analytics_workspace
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_aks_cl" {
  type                = local.resource_types.kubernetes_containerservice
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_sol_acr" {
  type                = local.resource_types.container_registry
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_pri_auto_diag_enabled_mon_ai" {
  type                = local.resource_types.application_insights
  resource_group_name = azurerm_resource_group.rg_pri.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

#--


data "azurerm_resources" "rg_sec_auto_diag_enabled_key_vaults" {
  type                = local.resource_types.key_vault
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_sql_servers" {
  type                = local.resource_types.sql_server
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_sql_databases" {
  type                = local.resource_types.sql_database
  resource_group_name = azurerm_resource_group.rg_sec.name
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_storage_accounts" {
  type                = local.resource_types.storage_account
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_network_security_groups" {
  type                = local.resource_types.network_security_group
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "aks_rg_sec_auto_diag_enabled_network_security_groups" {
  type                = local.resource_types.network_security_group
  resource_group_name = local.aks.rg_sec_node_resource_group_name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_virtual_networks" {
  type                = local.resource_types.virtual_network
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_virtual_machines" {
  type                = local.resource_types.virtual_machine
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_network_interfaces" {
  type                = local.resource_types.network_interface
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "aks_rg_sec_auto_diag_enabled_network_interfaces" {
  type                = local.resource_types.network_interface
  resource_group_name = local.aks.rg_sec_node_resource_group_name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_public_ips" {
  type                = local.resource_types.public_ip
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_automation_accounts" {
  type                = local.resource_types.automation_account
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_application_gateways" {
  type                = local.resource_types.application_gateway
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_data_factorys" {
  type                = local.resource_types.data_factory
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_load_balancers" {
  type                = local.resource_types.load_balancer
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_ddos" {
  type                = local.resource_types.ddos
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_virtual_network_gateways" {
  type                = local.resource_types.virtual_network_gateway
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_log_machine_learning_workspaces" {
  type                = local.resource_types.machine_leaning_workspace
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_azure_firwalls" {
  type                = local.resource_types.azure_firwall
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_relay_namespaces" {
  type                = local.resource_types.relay_namespace
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_traffic_managers" {
  type                = local.resource_types.traffic_manager
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_event_hubs" {
  type                = local.resource_types.event_hub
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_notification_hubs" {
  type                = local.resource_types.notification_hub
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_recovery_services_vaults" {
  type                = local.resource_types.recovery_services_vault
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_dns_zones" {
  type                = local.resource_types.dns_zone
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_elastic_pools" {
  type                = local.resource_types.elastic_pool
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_vpn_gateways" {
  type                = local.resource_types.virtual_network_gateway
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_log_analytics_workspaces" {
  type                = local.resource_types.log_analytics_workspace
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_aks_cl" {
  type                = local.resource_types.kubernetes_containerservice
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_sol_acr" {
  type                = local.resource_types.container_registry
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}

data "azurerm_resources" "rg_sec_auto_diag_enabled_mon_ai" {
  type                = local.resource_types.application_insights
  resource_group_name = azurerm_resource_group.rg_sec.name

  required_tags = {
    enable_auto_diag_settings = true
  }
}
data "azurerm_client_config" "current" {
}
data "azurerm_resources" "rg_pri_key_vaults" {
  type                = local.resource_types.key_vault
  resource_group_name = azurerm_resource_group.rg_pri.name
}

# data "azurerm_resources" "rg_pri_sql_servers" {
#   type                = local.resource_types.sql_server
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_sql_databases" {
#   type                = local.resource_types.sql_database
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_storage_accounts" {
#   type                = local.resource_types.storage_account
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_network_security_groups" {
#   type                = local.resource_types.network_security_group
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_virtual_networks" {
#   type                = local.resource_types.virtual_network
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

data "azurerm_resources" "rg_pri_virtual_machines" {
  type                = local.resource_types.virtual_machine
  resource_group_name = azurerm_resource_group.rg_pri.name
}

# data "azurerm_resources" "rg_pri_network_interfaces" {
#   type                = local.resource_types.network_interface
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_public_ips" {
#   type                = local.resource_types.public_ip
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_automation_accounts" {
#   type                = local.resource_types.automation_account
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_application_gateways" {
#   type                = local.resource_types.application_gateway
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_data_factorys" {
#   type                = local.resource_types.data_factory
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_load_balancers" {
#   type                = local.resource_types.load_balancer
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_ddos" {
#   type                = local.resource_types.ddos
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_virtual_network_gateways" {
#   type                = local.resource_types.virtual_network_gateway
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_azure_firwalls" {
#   type                = local.resource_types.azure_firwall
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_relay_namespaces" {
#   type                = local.resource_types.relay_namespace
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_traffic_managers" {
#   type                = local.resource_types.traffic_manager
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_event_hubs" {
#   type                = local.resource_types.event_hub
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_notification_hubs" {
#   type                = local.resource_types.notification_hub
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_recovery_services_vaults" {
#   type                = local.resource_types.recovery_services_vault
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

# data "azurerm_resources" "rg_pri_dns_zones" {
#   type                = local.resource_types.dns_zone
#   resource_group_name = azurerm_resource_group.rg_pri.name
# }

data "azurerm_resources" "all_virtual_machines" {
  type = local.resource_types.virtual_machine
}

#--

data "azurerm_resources" "rg_sec_key_vaults" {
  type                = local.resource_types.key_vault
  resource_group_name = azurerm_resource_group.rg_sec.name
}

# data "azurerm_resources" "rg_sec_sql_servers" {
#   type                = local.resource_types.sql_server
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_sql_databases" {
#   type                = local.resource_types.sql_database
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_storage_accounts" {
#   type                = local.resource_types.storage_account
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_network_security_groups" {
#   type                = local.resource_types.network_security_group
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_virtual_networks" {
#   type                = local.resource_types.virtual_network
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_virtual_machines" {
#   type                = local.resource_types.virtual_machine
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_network_interfaces" {
#   type                = local.resource_types.network_interface
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_public_ips" {
#   type                = local.resource_types.public_ip
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_automation_accounts" {
#   type                = local.resource_types.automation_account
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_application_gateways" {
#   type                = local.resource_types.application_gateway
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_data_factorys" {
#   type                = local.resource_types.data_factory
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_load_balancers" {
#   type                = local.resource_types.load_balancer
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_ddos" {
#   type                = local.resource_types.ddos
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_virtual_network_gateways" {
#   type                = local.resource_types.virtual_network_gateway
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_azure_firwalls" {
#   type                = local.resource_types.azure_firwall
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_relay_namespaces" {
#   type                = local.resource_types.relay_namespace
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_traffic_managers" {
#   type                = local.resource_types.traffic_manager
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_event_hubs" {
#   type                = local.resource_types.event_hub
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_notification_hubs" {
#   type                = local.resource_types.notification_hub
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_recovery_services_vaults" {
#   type                = local.resource_types.recovery_services_vault
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }

# data "azurerm_resources" "rg_sec_dns_zones" {
#   type                = local.resource_types.dns_zone
#   resource_group_name = azurerm_resource_group.rg_sec.name
# }
data "azurerm_subscription" "current" {
}
