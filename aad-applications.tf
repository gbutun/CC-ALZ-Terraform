locals {
  service_principal_password_start_datetime = "-24h"
  service_principal_password_end_datetime   = "175200h"

  aad_app = {

    svc_name = "${local.resource_prefix_rg_pri}-aad-app-svc-${var.product_unique}"
    resource_access_type = {
      scope = "Scope"
      role  = "Role"
    }
    sign_in_audiences = {
      azuread_my_org        = "AzureADMyOrg"        # single-tenant applications
      azuread_multiple_orgs = "AzureADMultipleOrgs" # multi-tenant applications
    }
    group_membership_claims = {
      none              = "None"
      security_group    = "SecurityGroup"
      directory_role    = "DirectoryRole"
      application_group = "ApplicationGroup"
      all               = "All"
    }

    resource_access_id = {
      sign_and_read_user_profile_perm_id = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      aad_permission_api_id              = "00000003-0000-0000-c000-000000000000"

      microsoft_graph_api_resource_app_id = "00000003-0000-0000-c000-000000000000"
      graph = {
        view_user_email = "64a6cdd6-aab1-4aaf-94b8-3cc8405e90d0"
      }
    }
  }

  ms_app_ids = {
    backup_service_application_id = "74cf451d-8f48-4421-86cd-15c3d3ea816d"
  }
}

# DevOps AAD Application - Service Principal:START

data "azuread_service_principal" "current" {
  client_id = data.azurerm_client_config.current.client_id
}

resource "azuread_service_principal_password" "aad_app_devops_service_principal_password_01" {
  display_name         = "infra-key-01"
  service_principal_id = data.azuread_service_principal.current.object_id
  end_date_relative    = "72000h"

  rotate_when_changed = {
    rotation = var.devops_service_principal_password_rotation_id
  }
}

resource "azuread_service_principal_password" "aad_app_devops_service_principal_password_02" {
  display_name         = "infra-key-02"
  service_principal_id = data.azuread_service_principal.current.object_id
  end_date_relative    = "72000h"

  rotate_when_changed = {
    rotation = var.devops_service_principal_password_rotation_id
  }
}

# # DevOps AAD Application - Service Principal:END



resource "azuread_application" "aad_app_acr_pull" {
  display_name     = "${var.environment_short}-aad-app-acr-pull-${var.product_unique}"
  sign_in_audience = local.aad_app.sign_in_audiences.azuread_my_org
}

resource "azuread_service_principal" "aad_app_acr_pull_service_principal" {
  client_id                    = azuread_application.aad_app_acr_pull.client_id
  app_role_assignment_required = false
  tags                         = ["ACR Push Service Principal"]
  depends_on                   = [azuread_application.aad_app_acr_pull]
}

resource "azuread_service_principal_password" "aad_app_acr_pull_service_principal_pwd_01" {
  display_name         = "key-01"
  service_principal_id = azuread_service_principal.aad_app_acr_pull_service_principal.object_id
  end_date_relative    = "72000h"
}

resource "azuread_service_principal_password" "aad_app_acr_pull_service_principal_pwd_02" {
  display_name         = "key-02"
  service_principal_id = azuread_service_principal.aad_app_acr_pull_service_principal.object_id
  end_date_relative    = "87000h"
}

resource "azuread_application" "aad_app_acr_push" {
  display_name     = "${var.environment_short}-aad-app-acr-push-${var.product_unique}"
  sign_in_audience = local.aad_app.sign_in_audiences.azuread_my_org
}

resource "azuread_service_principal" "aad_app_acr_push_service_principal" {
  client_id                    = azuread_application.aad_app_acr_push.client_id
  app_role_assignment_required = false
  tags                         = ["ACR Push Service Principal"]
  depends_on                   = [azuread_application.aad_app_acr_push]
}

resource "azuread_service_principal_password" "aad_app_acr_push_service_principal_pwd_01" {
  display_name         = "key-01"
  service_principal_id = azuread_service_principal.aad_app_acr_push_service_principal.object_id
  end_date_relative    = "72000h"
}

resource "azuread_service_principal_password" "aad_app_acr_push_service_principal_pwd_02" {
  display_name         = "key-02"
  service_principal_id = azuread_service_principal.aad_app_acr_push_service_principal.object_id
  end_date_relative    = "87000h"
}


resource "random_uuid" "aad_app_argo_cd_user_impersonation_permission_scope_id" {}

resource "azuread_application" "aad_app_argo_cd" {
  display_name = "${local.resource_prefix_rg_pri}-aad-app-argo-cd-${var.product_unique}"

  group_membership_claims = [local.aad_app.group_membership_claims.application_group]
  sign_in_audience        = local.aad_app.sign_in_audiences.azuread_my_org

  web {
    homepage_url  = "https://${local.rg_pri_argo_cd_url}/"
    redirect_uris = ["https://${local.rg_pri_argo_cd_url}/auth/callback", "https://${local.rg_sec_argo_cd_url}/auth/callback"]

    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled     = true
    }
  }

  required_resource_access {
    resource_app_id = local.aad_app.resource_access_id.aad_permission_api_id

    resource_access {
      id   = local.aad_app.resource_access_id.sign_and_read_user_profile_perm_id
      type = local.aad_app.resource_access_type.scope
    }
  }

  api {
    known_client_applications      = []
    mapped_claims_enabled          = false
    requested_access_token_version = 1

    oauth2_permission_scope {
      admin_consent_description  = "Allow the application to access AKS on behalf of the signed-in user."
      admin_consent_display_name = "Access ArgoCD Dashboard"
      enabled                    = true
      id                         = random_uuid.aad_app_argo_cd_user_impersonation_permission_scope_id.result
      type                       = "User"
      user_consent_description   = "Allow the application to access AKS on behalf of the signed-in user."
      user_consent_display_name  = "Access AKS"
      value                      = "user_impersonation"
    }
  }

  optional_claims {

    access_token {
      name = "groups"
    }

    id_token {
      name = "groups"
    }

    saml2_token {
      name = "groups"
    }
  }

}

resource "azuread_service_principal" "aad_app_argo_cd_service_principal" {
  client_id                    = azuread_application.aad_app_argo_cd.client_id
  app_role_assignment_required = false
  tags                         = ["ARGO CD AD App Service Principal"]
  depends_on                   = [azuread_application.aad_app_argo_cd]
}

resource "azuread_application_password" "aad_app_argo_cd_pwd_01" {
  application_id = azuread_application.aad_app_argo_cd.id
  display_name   = "key-01"
}

resource "azuread_application" "aad_app_aks_vc_ns_01" {
  display_name     = "${local.resource_prefix_rg_pri}-aad-app-aks-vc-ns-01-${var.product_unique}"
  sign_in_audience = local.aad_app.sign_in_audiences.azuread_my_org

  api {
    requested_access_token_version = 2
  }
}

resource "azuread_application_federated_identity_credential" "aad_app_aks_vc_ns_01_fed_id_cred" {
  application_id = azuread_application.aad_app_aks_vc_ns_01.id
  display_name   = "aks-fed-cred"
  description    = "AKS Workload Identity Federated Identity Credential"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.oidc_issuer_url
  subject        = "system:serviceaccount:vrp-ns-${var.company_name_short}-${var.environment_long}-vc-01:sa-verichannel-workload-identity"
}

resource "azuread_service_principal" "aad_app_aks_vc_ns_01_service_principal" {
  client_id  = azuread_application.aad_app_aks_vc_ns_01.client_id
  depends_on = [azuread_application.aad_app_aks_vc_ns_01]
}


resource "azuread_application_password" "aad_app_aks_vc_ns_01_sp_pwd_01" {
  display_name      = "client-secret-01"
  application_id    = azuread_application.aad_app_aks_vc_ns_01.id
  end_date_relative = local.service_principal_password_end_datetime
}

resource "random_uuid" "aad_app_vc_bo_user_impersonation_permission_scope_id" {}

resource "azuread_application" "aad_app_vc_bo" {
  display_name = "${local.resource_prefix_rg_pri}-aad-app-vc-bo-${var.product_unique}"

  group_membership_claims = [local.aad_app.group_membership_claims.security_group]
  sign_in_audience        = local.aad_app.sign_in_audiences.azuread_my_org

  required_resource_access {
    resource_app_id = local.aad_app.resource_access_id.aad_permission_api_id

    resource_access {
      id   = local.aad_app.resource_access_id.sign_and_read_user_profile_perm_id
      type = local.aad_app.resource_access_type.scope
    }
  }
  web {
    redirect_uris = ["https://${local.app_custom_domains.bo_app}:4443/signin-oidc", "https://${local.app_custom_domains.bo_app}:443/signin-oidc"]
    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled     = true
    }
  }

  api {
    known_client_applications      = []
    mapped_claims_enabled          = false
    requested_access_token_version = 1

    oauth2_permission_scope {
      admin_consent_description  = "Allow the application to access ${local.resource_prefix_rg_pri}-aad-app-vc-bo-${var.product_unique} on behalf of the signed-in user."
      admin_consent_display_name = "Access ${local.resource_prefix_rg_pri}-aad-app-vc-bo-${var.product_unique}"
      enabled                    = true
      id                         = random_uuid.aad_app_vc_bo_user_impersonation_permission_scope_id.result
      type                       = "User"
      user_consent_description   = "Allow the application to access VeriChannel BackOffice application on your behalf."
      user_consent_display_name  = "Access VeriChannel BackOffice application"
      value                      = "user_impersonation"
    }
  }

  lifecycle {
    ignore_changes = [
    ]
  }
}

resource "azuread_service_principal" "aad_app_vc_bo_service_principal" {
  client_id                    = azuread_application.aad_app_vc_bo.client_id
  app_role_assignment_required = false
  tags                         = ["BackOffice AD App Service Principal"]
  depends_on                   = [azuread_application.aad_app_vc_bo]
}



resource "random_uuid" "aad_app_vt_d365_01_user_impersonation_permission_scope_id" {}

resource "azuread_application" "aad_app_vt_d365_01" {
  display_name     = "${local.resource_prefix_rg_pri}-aad-app-vt-d365-01-${var.product_unique}"
  sign_in_audience = local.aad_app.sign_in_audiences.azuread_my_org

  required_resource_access {
    resource_app_id = local.aad_app.resource_access_id.aad_permission_api_id

    resource_access {
      id   = local.aad_app.resource_access_id.sign_and_read_user_profile_perm_id
      type = local.aad_app.resource_access_type.scope
    }
  }
  api {
    known_client_applications      = []
    mapped_claims_enabled          = false
    requested_access_token_version = 1

    oauth2_permission_scope {
      admin_consent_description  = "Allow the application to access D365 on behalf of the signed-in user."
      admin_consent_display_name = "Access D365"
      enabled                    = true
      id                         = random_uuid.aad_app_vt_d365_01_user_impersonation_permission_scope_id.result
      type                       = "User"
      user_consent_description   = "Allow the application to access D365 on your behalf."
      user_consent_display_name  = "Access D365"
      value                      = "user_impersonation"
    }
  }
}


resource "azuread_service_principal" "aad_app_vt_d365_01_service_principal" {
  client_id  = azuread_application.aad_app_vt_d365_01.client_id
  depends_on = [azuread_application.aad_app_vt_d365_01]
}

resource "azuread_application_password" "aad_app_vt_d365_01_service_principal_pwd_01" {
  application_id = azuread_application.aad_app_vt_d365_01.id
  display_name   = "key-01"
}


resource "random_uuid" "aad_app_vt_d365_02_user_impersonation_permission_scope_id" {}

resource "azuread_application" "aad_app_vt_d365_02" {
  display_name     = "${local.resource_prefix_rg_pri}-aad-app-vt-d365-02-${var.product_unique}"
  sign_in_audience = local.aad_app.sign_in_audiences.azuread_my_org

  required_resource_access {
    resource_app_id = local.aad_app.resource_access_id.aad_permission_api_id

    resource_access {
      id   = local.aad_app.resource_access_id.sign_and_read_user_profile_perm_id
      type = local.aad_app.resource_access_type.scope
    }
  }
  api {
    known_client_applications      = []
    mapped_claims_enabled          = false
    requested_access_token_version = 1

    oauth2_permission_scope {
      admin_consent_description  = "Allow the application to access D365 on behalf of the signed-in user."
      admin_consent_display_name = "Access D365"
      enabled                    = true
      id                         = random_uuid.aad_app_vt_d365_02_user_impersonation_permission_scope_id.result
      type                       = "User"
      user_consent_description   = "Allow the application to access D365 on your behalf."
      user_consent_display_name  = "Access D365"
      value                      = "user_impersonation"
    }
  }
}


resource "azuread_service_principal" "aad_app_vt_d365_02_service_principal" {
  client_id  = azuread_application.aad_app_vt_d365_02.client_id
  depends_on = [azuread_application.aad_app_vt_d365_02]
}

resource "azuread_application_password" "aad_app_vt_d365_02_service_principal_pwd_01" {
  application_id = azuread_application.aad_app_vt_d365_02.id
  display_name   = "key-01"
}

#-- 


# resource "random_uuid" "reg_sec_aad_app_argo_cd_user_impersonation_permission_scope_id" {}

# resource "azuread_application" "reg_sec_aad_app_argo_cd" {
#   display_name = "${local.resource_prefix_rg_sec}-aad-app-argo-cd-${var.product_unique}"

#   group_membership_claims = [local.aad_app.group_membership_claims.application_group]
#   sign_in_audience        = local.aad_app.sign_in_audiences.azuread_my_org

#   web {
#         homepage_url  = "https://${local.rg_sec_argo_cd_url}/"
#         redirect_uris = ["https://${local.rg_sec_argo_cd_url}/auth/callback"]

#     implicit_grant {
#       access_token_issuance_enabled = false
#       id_token_issuance_enabled     = true
#     }
#   }

#   required_resource_access {
#     resource_app_id = local.aad_app.resource_access_id.aad_permission_api_id

#     resource_access {
#       id   = local.aad_app.resource_access_id.sign_and_read_user_profile_perm_id
#       type = local.aad_app.resource_access_type.scope
#     }
#   }

#   api {
#     known_client_applications      = []
#     mapped_claims_enabled          = false
#     requested_access_token_version = 1

#     oauth2_permission_scope {
#       admin_consent_description  = "Allow the application to access AKS on behalf of the signed-in user."
#       admin_consent_display_name = "Access ArgoCD Dashboard"
#       enabled                    = true
#       id                         = random_uuid.reg_sec_aad_app_argo_cd_user_impersonation_permission_scope_id.result
#       type                       = "User"
#       user_consent_description   = "Allow the application to access AKS on behalf of the signed-in user."
#       user_consent_display_name  = "Access AKS"
#       value                      = "user_impersonation"
#     }
#   }

#   optional_claims {

#     access_token {
#       name = "groups"
#     }

#     id_token {
#       name = "groups"
#     }

#     saml2_token {
#       name = "groups"
#     }
#   }

# }

# resource "azuread_service_principal" "reg_sec_aad_app_argo_cd_service_principal" {
#   client_id                    = azuread_application.reg_sec_aad_app_argo_cd.client_id
#   app_role_assignment_required = false
#   tags                         = ["ARGO CD AD App Service Principal"]
#   depends_on                   = [azuread_application.reg_sec_aad_app_argo_cd]
# }

# resource "azuread_application_password" "reg_sec_aad_app_argo_cd_pwd_01" {
#   application_id = azuread_application.reg_sec_aad_app_argo_cd.id
#   display_name   = "key-01"
# }

resource "azuread_application" "rg_sec_aad_app_aks_vc_ns_01" {
  display_name     = "${local.resource_prefix_rg_sec}-aad-app-aks-vc-ns-01-${var.product_unique}"
  sign_in_audience = local.aad_app.sign_in_audiences.azuread_my_org

  api {
    requested_access_token_version = 2
  }
}

resource "azuread_application_federated_identity_credential" "rg_sec_aad_app_aks_vc_ns_01_fed_id_cred" {
  application_id = azuread_application.rg_sec_aad_app_aks_vc_ns_01.id
  display_name   = "aks-fed-cred"
  description    = "AKS Workload Identity Federated Identity Credential"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.oidc_issuer_url
  subject        = "system:serviceaccount:vrp-ns-${var.company_name_short}-${var.environment_long}-vc-01:sa-verichannel-workload-identity"
}

resource "azuread_service_principal" "rg_sec_aad_app_aks_vc_ns_01_service_principal" {
  client_id  = azuread_application.rg_sec_aad_app_aks_vc_ns_01.client_id
  depends_on = [azuread_application.aad_app_aks_vc_ns_01]
}


resource "azuread_application_password" "rg_sec_aad_app_aks_vc_ns_01_sp_pwd_01" {
  display_name      = "client-secret-01"
  application_id    = azuread_application.rg_sec_aad_app_aks_vc_ns_01.id
  end_date_relative = local.service_principal_password_end_datetime
}
