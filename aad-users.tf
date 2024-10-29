locals {
  sql_admin_aad_user_principal_name = "${lower(var.environment_short)}sqladmin1${var.product_unique}@${var.tenant_name}"

  aad_user = {
    deployment_client_upn = "deployment.client.p@${var.tenant_name}"
    mobile_client_upn     = "mobile.client.p@${var.tenant_name}"
  }

  jumpbox_users = [
    "osman.shener",
    "petar.raykovski",
    "ognyan.marinov",
    "dimitar.amudzhev",
    "boyan.georgiev",
    "shaik.jabbar",
    "berkay.erkoy",
    "burak.gonuldas",
    "Faheem.ullah",
    "antonio.yordanov",
    "nagaraju.nagula",
    "nikola.georev",
    "martin.hadzhiev",
    "kaan.ozkordag",
    "peycho.kostadinov",
    "radoslav.dokuzov",
    "waseem.khan",
    "hammad.hamid",
    "hakan.gurdal",
    "ufuk.ahmetoglu",
    "martin.tashev",
    "muhammet.kara",
    "mohan.kumar"
  ]

  rls_vm_admin_users = [
    "berkay.erkoy",
    "hakan.gurdal",
    "Faheem.ullah",
    "burak.gonuldas",
    "waseem.khan",
    "hammad.hamid",
    "mohan.kumar"
  ]

  aks_users = [
    "waseem.khan",
    "hammad.hamid"
  ]

  aks_contributors = [
    "waseem.khan",
    "hammad.hamid"
  ]
}

resource "azuread_user" "sql_admin_aad_user" {
  display_name        = format("SQL Server Admin User 1 (%s)", var.environment_long)
  password            = random_password.sql_admin_aad_user_login_01.result
  user_principal_name = local.sql_admin_aad_user_principal_name
}

resource "azuread_user" "dep_cli_aad_user" {
  display_name        = "Deployment Client Prod"
  password            = random_password.dep_cli_aad_user_pass_01.result
  user_principal_name = local.aad_user.deployment_client_upn
}

resource "azuread_user" "mob_cli_aad_user" {
  display_name        = "Mobile Client Prod"
  password            = random_password.mob_cli_aad_user_pass_01.result
  user_principal_name = local.aad_user.mobile_client_upn
}

data "azuread_user" "jmb_aad_users" {
  for_each = toset(local.jumpbox_users)
  user_principal_name = "${each.value}@${var.tenant_name}"
}

data "azuread_user" "rls_vm_admin_users" {
  for_each = toset(local.rls_vm_admin_users)
  user_principal_name = "${each.value}@${var.tenant_name}"
}

data "azuread_user" "aks_users" {
  for_each = toset(local.aks_users)
  user_principal_name = "${each.value}@${var.tenant_name}"
}

data "azuread_user" "aks_contributors" {
  for_each = toset(local.aks_contributors)
  user_principal_name = "${each.value}@${var.tenant_name}"
}