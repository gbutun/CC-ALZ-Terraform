resource "azuread_group" "sql_admin_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-sql-admin-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "rls_vm_admin_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-rls-vm-admin-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "jmb_vm_admin_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-jmb-vm-admin-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "rls_vm_user_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-rls-vm-user-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "jmb_vm_user_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-jmb-vm-user-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "aks_admin_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-aks-admin-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "argo_cd_admin_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-argo-cd-admin-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "argo_cd_user_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-argo-cd-user-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "vc_db_app_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-vc-db-app-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "aks_user_app_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-aks-user-app-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "aks_contributor_app_aad_group" {
  display_name     = "${local.resource_prefix_only_environment}-aks-contributor-app-aad-grp-${var.product_unique}"
  security_enabled = true
}

resource "azuread_group" "vc_db_app_aad_ro_pim_group" {
  display_name       = "${local.resource_prefix_only_environment}-vc-db-app-aad-ro-pim-grp-${var.product_unique}"
  security_enabled   = true
  assignable_to_role = true
  description        = "VeriChannel DB ReadOnly AD Group for PIM"
}

resource "azuread_group" "vc_db_app_aad_rw_pim_group" {
  display_name       = "${local.resource_prefix_only_environment}-vc-db-app-aad-rw-pim-grp-${var.product_unique}"
  security_enabled   = true
  assignable_to_role = true
  description        = "VeriChannel DB ReadWrite AD Group for PIM"
}