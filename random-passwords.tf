locals {
  aad_user_pwd = {
    length           = 16
    special          = true
    override_special = "=/:_%@"
  }
  cert_pwd = {
    length           = 16
    special          = true
    override_special = "=:"
  }
  sql_login_pwd = {
    length  = 16
    special = false
  }
}

resource "random_password" "sql_admin_aad_user_login_01" {
  length           = local.aad_user_pwd.length
  special          = local.aad_user_pwd.special
  override_special = local.aad_user_pwd.override_special

  keepers = {
    rotation_id = var.sql_aad_user_login_pass_rotation_id
  }
}

resource "random_password" "dep_cli_aad_user_pass_01" {
  length           = local.aad_user_pwd.length
  special          = local.aad_user_pwd.special
  override_special = local.aad_user_pwd.override_special

  keepers = {
    aad_user_password_rotation_id = var.aad_user_password_rotation_id
  }
}

resource "random_password" "mob_cli_aad_user_pass_01" {
  length           = local.aad_user_pwd.length
  special          = local.aad_user_pwd.special
  override_special = local.aad_user_pwd.override_special

  keepers = {
    aad_user_password_rotation_id = var.aad_user_password_rotation_id
  }
}

resource "random_password" "rg_pri_sol_sql_administrator_login" {
  length  = local.sql_login_pwd.length
  special = local.sql_login_pwd.special

  keepers = {
    rotation_id = var.sql_admin_login_pass_rotation_id
  }
}

resource "random_password" "rg_pri_vc_db_usr_login_pwd" {
  length  = local.sql_login_pwd.length
  special = local.sql_login_pwd.special

  keepers = {
    id = 1
  }
}

resource "random_password" "wef_acme_cert_pwd" {
  length           = local.cert_pwd.length
  special          = local.cert_pwd.special
  override_special = local.cert_pwd.override_special

  keepers = {
    id = 1
  }
}

resource "random_password" "wif_acme_cert_pwd" {
  length           = local.cert_pwd.length
  special          = local.cert_pwd.special
  override_special = local.cert_pwd.override_special

  keepers = {
    id = 1
  }
}


resource "random_password" "argo_cd_acme_cert_pwd" {
  length           = local.cert_pwd.length
  special          = local.cert_pwd.special
  override_special = local.cert_pwd.override_special

  keepers = {
    id = 1
  }
}

resource "random_password" "biz_acme_cert_pwd" {
  length           = local.cert_pwd.length
  special          = local.cert_pwd.special
  override_special = local.cert_pwd.override_special

  keepers = {
    id = 1
  }
}

resource "random_password" "jmb_aad_user_common_pass" {
  length           = local.cert_pwd.length
  special          = local.cert_pwd.special
  override_special = local.cert_pwd.override_special

  keepers = {
    id = 1
  }
}

