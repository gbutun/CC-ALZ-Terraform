resource "azuread_group_member" "sql_admin_aad_group_sql_admin_aad_user_grp_mmb_01" {
  group_object_id  = azuread_group.sql_admin_aad_group.object_id
  member_object_id = azuread_user.sql_admin_aad_user.object_id
}

resource "azuread_group_member" "jmb_vm_user_aad_group_members" {
  for_each = data.azuread_user.jmb_aad_users

  group_object_id  = azuread_group.jmb_vm_user_aad_group.object_id
  member_object_id = each.value.object_id
}

resource "azuread_group_member" "rls_vm_user_aad_group_members" {
  for_each = data.azuread_user.jmb_aad_users

  group_object_id  = azuread_group.rls_vm_user_aad_group.object_id
  member_object_id = each.value.object_id
}

resource "azuread_group_member" "aks_contributor_app_aad_group_members" {
  for_each = data.azuread_user.aks_contributors

  group_object_id  = azuread_group.aks_contributor_app_aad_group.object_id
  member_object_id = each.value.object_id
}

resource "azuread_group_member" "aks_user_app_aad_group_members" {
  for_each = data.azuread_user.aks_users

  group_object_id  = azuread_group.aks_user_app_aad_group.object_id
  member_object_id = each.value.object_id
}

resource "azuread_group_member" "aks_admin_aad_grp_ops_sp_grp_mmb_01" {
  group_object_id  = azuread_group.aks_admin_aad_group.object_id
  member_object_id = data.azurerm_client_config.current.object_id
}

resource "azuread_group_member" "argo_cd_admin_aad_group_member" {
  group_object_id  = azuread_group.argo_cd_admin_aad_group.object_id
  member_object_id = azuread_service_principal.aad_app_argo_cd_service_principal.object_id
}

resource "azuread_group_member" "argo_cd_user_aad_group_member" {
  group_object_id  = azuread_group.argo_cd_user_aad_group.object_id
  member_object_id = azuread_service_principal.aad_app_argo_cd_service_principal.object_id
}

resource "azuread_group_member" "rg_pri_vc_db_app_aad_group_aks_vc_ns_01_service_principal" {
  group_object_id  = azuread_group.vc_db_app_aad_group.object_id
  member_object_id = azuread_service_principal.aad_app_aks_vc_ns_01_service_principal.object_id
}

#-- 

resource "azuread_group_member" "rg_sec_vc_db_app_aad_group_aks_vc_ns_01_service_principal" {
  group_object_id  = azuread_group.vc_db_app_aad_group.object_id
  member_object_id = azuread_service_principal.rg_sec_aad_app_aks_vc_ns_01_service_principal.object_id
}