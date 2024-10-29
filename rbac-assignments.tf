resource "azurerm_role_assignment" "rg_pri_wl_aks_cl_usr_asgn_id_role_assg_01" {
  scope                = azurerm_private_dns_zone.rg_pri_prv_dns_zone_privatelink_azmk8s_io.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.rg_pri_wl_aks_cl_usr_asgn_id.principal_id
}

resource "azurerm_role_assignment" "rg_pri_wl_aks_cl_usr_asgn_id_role_assg_02" {
  scope                = azurerm_virtual_network.rg_pri_spk_vn.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.rg_pri_wl_aks_cl_usr_asgn_id.principal_id
}

resource "azurerm_role_assignment" "rg_pri_wl_aks_cl_usr_asgn_id_role_assg_03" {
  scope                = azurerm_resource_group.rg_pri.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.rg_pri_wl_aks_cl_usr_asgn_id.principal_id
}

resource "azurerm_role_assignment" "rg_pri_rls_vm_admin_aad_group_role_assg_01" {
  scope                = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = azuread_group.rls_vm_admin_aad_group.object_id
}

resource "azurerm_role_assignment" "rg_pri_rls_vm_user_aad_group_role_assg_01" {
  scope                = azurerm_windows_virtual_machine.rg_pri_rls_vm.id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = azuread_group.rls_vm_user_aad_group.object_id
}

resource "azurerm_role_assignment" "rg_pri_jmb_vm_admin_aad_group_role_assg_01" {
  scope                = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = azuread_group.jmb_vm_admin_aad_group.object_id
}

resource "azurerm_role_assignment" "rg_pri_jmb_vm_user_aad_group_role_assg_01" {
  scope                = azurerm_windows_virtual_machine.rg_pri_jmb_vm.id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = azuread_group.jmb_vm_user_aad_group.object_id
}


resource "azurerm_role_assignment" "devops_sp_rg_pri_wl_aks_cl_admin_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "aks_user_app_aad_group_wl_aks_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = azuread_group.aks_user_app_aad_group.object_id
}

resource "azurerm_role_assignment" "aks_contributor_app_aad_group_wl_aks_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.id
  role_definition_name = "Azure Kubernetes Service Contributor Role"
  principal_id         = azuread_group.aks_contributor_app_aad_group.object_id
}

resource "azurerm_role_assignment" "rg_pri_aks_user_app_aad_group_rg_aks_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.node_resource_group_id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = azuread_group.aks_user_app_aad_group.object_id
}

resource "azurerm_role_assignment" "rg_pri_aks_contributor_app_aad_group_rg_aks_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.node_resource_group_id
  role_definition_name = "Azure Kubernetes Service Contributor Role"
  principal_id         = azuread_group.aks_contributor_app_aad_group.object_id
}


resource "azurerm_role_assignment" "aad_app_acr_push_service_principal_role_assg_01" {
  scope                = azurerm_container_registry.rg_pri_sol_acr.id
  role_definition_name = "AcrPush"
  principal_id         = azuread_service_principal.aad_app_acr_push_service_principal.object_id
}

resource "azurerm_role_assignment" "aad_app_acr_pull_service_principal_role_assg_01" {
  scope                = azurerm_container_registry.rg_pri_sol_acr.id
  role_definition_name = "AcrPull"
  principal_id         = azuread_service_principal.aad_app_acr_pull_service_principal.object_id
}

resource "azurerm_role_assignment" "rg_pri_wl_aks_cl_acr_pull_role_assg_01" {
  principal_id         = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.rg_pri_sol_acr.id
}

resource "azurerm_role_assignment" "rg_pri_wl_aks_cl_dsk_enc_set_role_assg_01" {
  principal_id         = azurerm_user_assigned_identity.rg_pri_wl_aks_cl_usr_asgn_id.principal_id
  role_definition_name = "Contributor"
  scope                = azurerm_disk_encryption_set.rg_pri_aks_node_dsk_enc_set.id
}

resource "azurerm_role_assignment" "rg_pri_log_sarg_pri_sol_sql_mng_id_role_assg_01" {
  principal_id         = azurerm_mssql_server.rg_pri_sol_sql.identity[0].principal_id
  role_definition_name = "Storage Blob Data Contributor"
  scope                = azurerm_storage_account.rg_pri_log_sa.id
}
resource "azurerm_role_assignment" "rg_pri_log_sarg_pri_sol_sql_mng_id_role_assg_02" {
  principal_id         = azurerm_mssql_server.rg_pri_sol_sql.identity[0].principal_id
  role_definition_name = "Role Based Access Control Administrator"
  scope                = azurerm_storage_account.rg_pri_log_sa.id
}

resource "azurerm_role_assignment" "rg_pri_mal_scn_sa_role_aad_app_aks_vc_ns_assg_01" {
  principal_id                     = azuread_service_principal.aad_app_aks_vc_ns_01_service_principal.id
  role_definition_name             = "Storage Blob Data Owner"
  scope                            = azurerm_storage_account.rg_pri_mal_scn_sa.id
}

resource "azurerm_role_assignment" "rg_pri_acr_acr_task_role_assg_01" {
  principal_id                     = azurerm_container_registry_task.rg_pri_sol_acr_daily_purge_task.identity[0].principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.rg_pri_sol_acr.id
}

resource "azurerm_role_assignment" "rg_pri_acr_acr_task_role_assg_02" {
  principal_id                     = azurerm_container_registry_task.rg_pri_sol_acr_daily_purge_task.identity[0].principal_id
  role_definition_name             = "AcrDelete"
  scope                            = azurerm_container_registry.rg_pri_sol_acr.id
}

resource "azurerm_role_assignment" "rg_pri_aad_app_auto_role_assg_01" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_automation_account.rg_pri_auto.identity[0].principal_id

  depends_on = [
    azurerm_automation_account.rg_pri_auto
  ]
}

#--

resource "azurerm_role_assignment" "rg_sec_wl_aks_cl_usr_asgn_id_role_assg_01" {
  scope                = azurerm_private_dns_zone.rg_sec_prv_dns_zone_privatelink_azmk8s_io.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.rg_sec_wl_aks_cl_usr_asgn_id.principal_id
}

resource "azurerm_role_assignment" "rg_sec_wl_aks_cl_usr_asgn_id_role_assg_02" {
  scope                = azurerm_virtual_network.rg_sec_spk_vn.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.rg_sec_wl_aks_cl_usr_asgn_id.principal_id
}

resource "azurerm_role_assignment" "rg_sec_wl_aks_cl_usr_asgn_id_role_assg_03" {
  scope                = azurerm_resource_group.rg_sec.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.rg_sec_wl_aks_cl_usr_asgn_id.principal_id
}

# resource "azurerm_role_assignment" "rg_sec_rls_vm_admin_aad_group_role_assg_01" {
#   scope                = azurerm_windows_virtual_machine.rg_sec_rls_vm.id
#   role_definition_name = "Virtual Machine Administrator Login"
#   principal_id         = azuread_group.rls_vm_admin_aad_group.object_id
# }

# resource "azurerm_role_assignment" "rg_sec_rls_vm_user_aad_group_role_assg_01" {
#   scope                = azurerm_windows_virtual_machine.rg_sec_rls_vm.id
#   role_definition_name = "Virtual Machine User Login"
#   principal_id         = azuread_group.rls_vm_user_aad_group.object_id
# }

# resource "azurerm_role_assignment" "rg_sec_jmb_vm_admin_aad_group_role_assg_01" {
#   scope                = azurerm_windows_virtual_machine.rg_sec_jmb_vm.id
#   role_definition_name = "Virtual Machine Administrator Login"
#   principal_id         = azuread_group.jmb_vm_admin_aad_group.object_id
# }

# resource "azurerm_role_assignment" "rg_sec_jmb_vm_user_aad_group_role_assg_01" {
#   scope                = azurerm_windows_virtual_machine.rg_sec_jmb_vm.id
#   role_definition_name = "Virtual Machine User Login"
#   principal_id         = azuread_group.jmb_vm_user_aad_group.object_id
# }


resource "azurerm_role_assignment" "rg_sec_devops_sp_wl_aks_cl_admin_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "rg_sec_aks_user_app_aad_group_wl_aks_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = azuread_group.aks_user_app_aad_group.object_id
}

resource "azurerm_role_assignment" "rg_sec_aks_contributor_app_aad_group_wl_aks_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.id
  role_definition_name = "Azure Kubernetes Service Contributor Role"
  principal_id         = azuread_group.aks_contributor_app_aad_group.object_id
}

resource "azurerm_role_assignment" "rg_sec_aks_user_app_aad_group_rg_aks_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.node_resource_group_id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = azuread_group.aks_user_app_aad_group.object_id
}

resource "azurerm_role_assignment" "rg_sec_aks_contributor_app_aad_group_rg_aks_role_assg_01" {
  scope                = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.node_resource_group_id
  role_definition_name = "Azure Kubernetes Service Contributor Role"
  principal_id         = azuread_group.aks_contributor_app_aad_group.object_id
}


# resource "azurerm_role_assignment" "rg_sec_aad_app_acr_push_service_principal_role_assg_01" {
#   scope                = azurerm_container_registry.rg_sec_sol_acr.id
#   role_definition_name = "AcrPush"
#   principal_id         = azuread_service_principal.aad_app_acr_push_service_principal.object_id
# }

# resource "azurerm_role_assignment" "rg_sec_aad_app_acr_pull_service_principal_role_assg_01" {
#   scope                = azurerm_container_registry.rg_pri_sol_acr.id
#   role_definition_name = "AcrPull"
#   principal_id         = azuread_service_principal.reg_sec_aad_app_argo_cd_service_principal.object_id
# }

resource "azurerm_role_assignment" "rg_sec_wl_aks_cl_acr_pull_role_assg_01" {
  principal_id         = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.rg_pri_sol_acr.id
}

resource "azurerm_role_assignment" "rg_sec_wl_aks_cl_dsk_enc_set_role_assg_01" {
  principal_id         = azurerm_user_assigned_identity.rg_sec_wl_aks_cl_usr_asgn_id.principal_id
  role_definition_name = "Contributor"
  scope                = azurerm_disk_encryption_set.rg_sec_aks_node_dsk_enc_set.id
}

resource "azurerm_role_assignment" "rg_sec_log_sarg_sec_sol_sql_mng_id_role_assg_01" {
  principal_id         = azurerm_mssql_server.rg_sec_sol_sql.identity[0].principal_id
  role_definition_name = "Storage Blob Data Contributor"
  scope                = azurerm_storage_account.rg_sec_log_sa.id
}
resource "azurerm_role_assignment" "rg_sec_log_sarg_sec_sol_sql_mng_id_role_assg_02" {
  principal_id         = azurerm_mssql_server.rg_sec_sol_sql.identity[0].principal_id
  role_definition_name = "Role Based Access Control Administrator"
  scope                = azurerm_storage_account.rg_sec_log_sa.id
}

resource "azurerm_role_assignment" "rg_pri_mal_scn_sa_role_rg_sec_aad_app_aks_vc_ns_assg_01" {
  principal_id                     = azuread_service_principal.rg_sec_aad_app_aks_vc_ns_01_service_principal.id
  role_definition_name             = "Storage Blob Data Owner"
  scope                            = azurerm_storage_account.rg_pri_mal_scn_sa.id
}