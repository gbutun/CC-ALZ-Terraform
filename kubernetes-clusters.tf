locals {
  aks = {
    rg_pri_node_resource_group_name = "${local.resource_prefix_rg_pri}-rg-aks-${var.product_unique}"
    rg_sec_node_resource_group_name = "${local.resource_prefix_rg_sec}-rg-aks-${var.product_unique}"
    sku_tier = {
      free     = "Free"
      standard = "Standard"
    }

    node_pool = {
      os_disk_type = {
        ephemeral = "Ephemeral"
        managed   = "Managed"
      }
      os_sku = {
        azure_linux  = "AzureLinux"
        ubuntu       = "Ubuntu"
        windows_2019 = "Windows2019"
        windows_2022 = "Windows2022"
      }
      scale_down_mode = {
        delete     = "Delete"
        deallocate = "Deallocate"
      }
      cluster_type = {
        availability_set = "AvailabilitySet"
        vmss             = "VirtualMachineScaleSets"
      }
      mode = {
        user   = "User"
        system = "System"
      }
    }

    storage_profile = {
      disk_driver_version = {
        v1 = "v1"
        v2 = "v2" #(preview)
      }
    }

    automatic_channel_upgrade = { # https://learn.microsoft.com/en-gb/azure/aks/auto-upgrade-cluster#use-cluster-auto-upgrade
      patch      = "patch"
      rapid      = "rapid"
      node-image = "node-image"
      stable     = "stable"
    }

    kubelet_disk_type = {
      os        = "OS"
      temporary = "Temporary"
    }

    key_vault_network_access = {
      public  = "Public"
      private = "Private"

    }

    network_profile = {
      network_plugin = {
        azure   = "azure"
        kubenet = "kubenet"
        none    = "none"
      }

      load_balancer_sku = {
        basic    = "basic"
        standard = "standard"
      }

      outbound_type = {
        load_balancer             = "loadBalancer"
        user_defined_routing      = "userDefinedRouting"
        managed_nat_gateway       = "managedNATGateway"
        user_assigned_nat_gateway = "userAssignedNATGateway"
      }
    }
  }
}

resource "azurerm_kubernetes_cluster" "rg_pri_wl_aks_cl" {
  name                       = "${local.resource_prefix_rg_pri}-wl-aks-cl-${var.product_unique}"
  resource_group_name        = azurerm_resource_group.rg_pri.name
  location                   = azurerm_resource_group.rg_pri.location
  sku_tier                   = local.aks.sku_tier.standard
  dns_prefix_private_cluster = "${local.resource_prefix_rg_pri}-wl-aks-cl-${var.product_unique}"
  node_resource_group        = local.aks.rg_pri_node_resource_group_name
  kubernetes_version         = data.azurerm_kubernetes_service_versions.current.latest_version
  #the below disk encryption will be used for both node OS disks and and persisten volumes. Use a generic resource and variable name(without node_dsk) in the generic architecture. 
  disk_encryption_set_id = azurerm_disk_encryption_set.rg_pri_aks_node_dsk_enc_set.id
  private_dns_zone_id    = azurerm_private_dns_zone.rg_pri_prv_dns_zone_privatelink_azmk8s_io.id
  #automatic_channel_upgrade (Omitting this field sets this value to none.)

  #key_management_service (this will be evaluated in the future projects)
  http_application_routing_enabled  = false
  local_account_disabled            = true
  private_cluster_enabled           = true
  role_based_access_control_enabled = true
  run_command_enabled               = true
  oidc_issuer_enabled               = true
  workload_identity_enabled         = false

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = [azuread_group.aks_admin_aad_group.object_id]
    azure_rbac_enabled     = false
  }

  default_node_pool {
    name                        = "agentpool"
    vm_size                     = var.wl_aks_vm_size
    temporary_name_for_rotation = "tmpagentpool"
    enable_auto_scaling         = true
    enable_node_public_ip       = false
    vnet_subnet_id              = azurerm_subnet.rg_pri_spk_vn_wl_sub.id
    orchestrator_version        = data.azurerm_kubernetes_service_versions.current.latest_version
    os_disk_type                = local.aks.node_pool.os_disk_type.managed
    os_sku                      = local.aks.node_pool.os_sku.azure_linux
    scale_down_mode             = local.aks.node_pool.scale_down_mode.delete
    type                        = local.aks.node_pool.cluster_type.vmss
    node_count                  = var.wl_aks_default_pool_node_count
    min_count                   = var.wl_aks_agent_pool_min_node_count
    max_count                   = var.wl_aks_agent_pool_max_node_count
    max_pods                    = var.wl_aks_pod_count_per_node
    zones                       = var.wl_aks_zones
    os_disk_size_gb             = var.wl_aks_os_disk_size_gb
    kubelet_disk_type           = local.aks.kubelet_disk_type.os
    node_labels = {
      "node.kubernetes.io/infra" = "true"
    }

    #fips_enabled (this will be evaluated in the future projects)    

    tags = {
      enable_auto_diag_settings = true
      name                      = "Azure Kubernetes Service Cluster Default Node Pool (Workload)"
    }
  }

  network_profile {
    network_plugin    = local.aks.network_profile.network_plugin.kubenet
    load_balancer_sku = local.aks.network_profile.load_balancer_sku.standard
    outbound_type     = local.aks.network_profile.outbound_type.user_defined_routing
    pod_cidr          = var.wl_aks_pod_cidr
    service_cidr      = var.wl_aks_service_cidr
    dns_service_ip    = cidrhost(var.wl_aks_service_cidr, 10)
  }

  storage_profile {
    blob_driver_enabled         = true
    disk_driver_enabled         = true
    disk_driver_version         = local.aks.storage_profile.disk_driver_version.v1
    file_driver_enabled         = true
    snapshot_controller_enabled = true
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }


  oms_agent {
    log_analytics_workspace_id      = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
    msi_auth_for_monitoring_enabled = true
  }

  # monitor_metrics {

  # }

  identity {
    type = local.resource_identity_type.user_assigned
    identity_ids = [
      azurerm_user_assigned_identity.rg_pri_wl_aks_cl_usr_asgn_id.id
    ]
  }
  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Kubernetes Service Cluster (Workload)"
  }

  depends_on = [
    azurerm_role_assignment.rg_pri_wl_aks_cl_usr_asgn_id_role_assg_01,
    azurerm_role_assignment.rg_pri_wl_aks_cl_usr_asgn_id_role_assg_02,
    azurerm_key_vault_access_policy.rg_pri_cmk_enc_kv_aks_node_dsk_enc_set_identity_principal
  ]
}

#--

resource "azurerm_kubernetes_cluster" "rg_sec_wl_aks_cl" {
  name                       = "${local.resource_prefix_rg_sec}-wl-aks-cl-${var.product_unique}"
  resource_group_name        = azurerm_resource_group.rg_sec.name
  location                   = azurerm_resource_group.rg_sec.location
  sku_tier                   = local.aks.sku_tier.standard
  dns_prefix_private_cluster = "${local.resource_prefix_rg_sec}-wl-aks-cl-${var.product_unique}"
  node_resource_group        = local.aks.rg_sec_node_resource_group_name
  kubernetes_version         = data.azurerm_kubernetes_service_versions.current.latest_version
  #the below disk encryption will be used for both node OS disks and and persisten volumes. Use a generic resource and variable name(without node_dsk) in the generic architecture. 
  disk_encryption_set_id = azurerm_disk_encryption_set.rg_sec_aks_node_dsk_enc_set.id
  private_dns_zone_id    = azurerm_private_dns_zone.rg_sec_prv_dns_zone_privatelink_azmk8s_io.id
  #automatic_channel_upgrade (Omitting this field sets this value to none.)

  #key_management_service (this will be evaluated in the future projects)
  http_application_routing_enabled  = false
  local_account_disabled            = true
  private_cluster_enabled           = true
  role_based_access_control_enabled = true
  run_command_enabled               = true
  oidc_issuer_enabled               = true
  workload_identity_enabled         = false

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = [azuread_group.aks_admin_aad_group.object_id]
    azure_rbac_enabled     = false
  }

  default_node_pool {
    name                        = "agentpool"
    vm_size                     = var.wl_aks_vm_size
    temporary_name_for_rotation = "tmpagentpool"
    enable_auto_scaling         = true
    enable_node_public_ip       = false
    vnet_subnet_id              = azurerm_subnet.rg_sec_spk_vn_wl_sub.id
    orchestrator_version        = data.azurerm_kubernetes_service_versions.current.latest_version
    os_disk_type                = local.aks.node_pool.os_disk_type.managed
    os_sku                      = local.aks.node_pool.os_sku.azure_linux
    scale_down_mode             = local.aks.node_pool.scale_down_mode.delete
    type                        = local.aks.node_pool.cluster_type.vmss
    node_count                  = var.wl_aks_default_pool_node_count
    min_count                   = var.wl_aks_agent_pool_min_node_count
    max_count                   = var.wl_aks_agent_pool_max_node_count
    max_pods                    = var.wl_aks_pod_count_per_node
    # zones                     = var.wl_aks_zones # Availability zone is not available in GermanyNorth
    os_disk_size_gb   = var.wl_aks_os_disk_size_gb
    kubelet_disk_type = local.aks.kubelet_disk_type.os
    node_labels = {
      "node.kubernetes.io/infra" = "true"
    }

    #fips_enabled (this will be evaluated in the future projects)    

    tags = {
      enable_auto_diag_settings = true
      name                      = "Azure Kubernetes Service Cluster Default Node Pool (Workload)"
    }
  }

  network_profile {
    network_plugin    = local.aks.network_profile.network_plugin.kubenet
    load_balancer_sku = local.aks.network_profile.load_balancer_sku.standard
    outbound_type     = local.aks.network_profile.outbound_type.user_defined_routing
    pod_cidr          = var.wl_aks_pod_cidr
    service_cidr      = var.wl_aks_service_cidr
    dns_service_ip    = cidrhost(var.wl_aks_service_cidr, 10)
  }

  storage_profile {
    blob_driver_enabled         = true
    disk_driver_enabled         = true
    disk_driver_version         = local.aks.storage_profile.disk_driver_version.v1
    file_driver_enabled         = true
    snapshot_controller_enabled = true
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }


  oms_agent {
    log_analytics_workspace_id      = azurerm_log_analytics_workspace.rg_pri_mon_la_ws.id
    msi_auth_for_monitoring_enabled = true
  }

  # monitor_metrics {

  # }

  identity {
    type = local.resource_identity_type.user_assigned
    identity_ids = [
      azurerm_user_assigned_identity.rg_sec_wl_aks_cl_usr_asgn_id.id
    ]
  }
  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_sec_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Kubernetes Service Cluster (Workload)"
  }

  depends_on = [
    azurerm_role_assignment.rg_sec_wl_aks_cl_usr_asgn_id_role_assg_01,
    azurerm_role_assignment.rg_sec_wl_aks_cl_usr_asgn_id_role_assg_02,
    azurerm_key_vault_access_policy.rg_sec_cmk_enc_kv_aks_node_dsk_enc_set_identity_principal
  ]
}
