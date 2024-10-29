# resource "null_resource" "rg_pri_wl_aks_cl_install_argo_cd" {
#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_pri.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
#       command_text        = "kubectl create -f 01-0-ArgoCD-2.8.4-namespace.yaml"
#       file_path           = abspath("${local.configs_path}//aks//01-0-ArgoCD-2.8.4-namespace.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_pri.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
#       command_text        = "kubectl apply -f 01-1-ArgoCD-2.8.4-install.yaml -n vrp-ns-gitops-01"
#       file_path           = abspath("${local.configs_path}//aks//01-1-ArgoCD-2.8.4-install.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   triggers = {
#     run_id = 1
#   }

#   depends_on = [
#     azurerm_role_assignment.devops_sp_rg_pri_wl_aks_cl_admin_role_assg_01,
#     azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
#   ]
# }



# resource "null_resource" "rg_pri_wl_aks_cl_install_rabbit_mq" {
#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_pri.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
#       command_text        = "kubectl create -f 02-0-RabbitMQ-2.5.0-cluster-operator-namespace.yaml"
#       file_path           = abspath("${local.configs_path}//aks//02-0-RabbitMQ-2.5.0-cluster-operator-namespace.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_pri.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
#       command_text        = "kubectl create -f 02-1-RabbitMQ-2.5.0-cluster-operator.yaml -n rabbitmq-system"
#       file_path           = abspath("${local.configs_path}//aks//02-1-RabbitMQ-2.5.0-cluster-operator.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   triggers = {
#     run_id = 1
#   }

#   depends_on = [
#     azurerm_role_assignment.devops_sp_rg_pri_wl_aks_cl_admin_role_assg_01,
#     azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
#   ]
# }



# below resource can be only installed via devops pipelines via native istioctl.exe. Azure Run Command can't execute istioctl.exe remotely. 
# resource "null_resource" "rg_pri_wl_aks_cl_install_istio_default" {

#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_pri.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
#       command_text        = "istioctl apply -f 03-1-Istio-default-profile-install.yaml"
#       file_path         = abspath("${local.configs_path}//aks//03-1-Istio-default-profile-install.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   triggers = {
#     run_id = 1
#   }

#   depends_on = [
#     azurerm_role_assignment.devops_sp_rg_pri_wl_aks_cl_admin_role_assg_01,
#     azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
#   ]
# }


# resource "null_resource" "rg_pri_wl_aks_cl_install_istio_kiali" {


#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_pri.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
#       command_text        = "kubectl apply -f 03-2-Istio-kiali-prometheus.yaml -n istio-system"
#       file_path           = abspath("${local.configs_path}//aks//03-2-Istio-kiali-prometheus.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_pri.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
#       command_text        = "kubectl apply -f 03-3-Istio-kiali.yaml -n istio-system"
#       file_path           = abspath("${local.configs_path}//aks//03-3-Istio-kiali.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   triggers = {
#     run_id = 2
#   }

#   depends_on = [
#     azurerm_role_assignment.devops_sp_rg_pri_wl_aks_cl_admin_role_assg_01,
#     azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
#   ]
# }

resource "null_resource" "rg_pri_wl_aks_cl_install_helm_workload_identity" {

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      resource_group_name = azurerm_resource_group.rg_pri.name
      aks_cluster_name    = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
      command_text        = "helm repo add azure-workload-identity https://azure.github.io/azure-workload-identity/charts && helm repo update && helm install workload-identity-webhook azure-workload-identity/workload-identity-webhook --namespace azure-workload-identity-system --create-namespace --set azureTenantID=\"${var.tenant_id}\""
      is_logger_enabled   = true
    }
  }
  triggers = {
    run_id = 3
  }

  depends_on = [
    azurerm_role_assignment.devops_sp_rg_pri_wl_aks_cl_admin_role_assg_01,
    azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
  ]
}

#--

# resource "null_resource" "rg_sec_wl_aks_cl_install_argo_cd" {
#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_sec.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
#       command_text        = "kubectl create -f 01-0-ArgoCD-2.8.4-namespace.yaml"
#       file_path           = abspath("${local.configs_path}//aks//01-0-ArgoCD-2.8.4-namespace.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_sec.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
#       command_text        = "kubectl apply -f 01-1-ArgoCD-2.8.4-install.yaml -n vrp-ns-gitops-01"
#       file_path           = abspath("${local.configs_path}//aks//01-1-ArgoCD-2.8.4-install.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   triggers = {
#     run_id = 3
#   }

#   depends_on = [
#     azurerm_role_assignment.rg_sec_devops_sp_wl_aks_cl_admin_role_assg_01,
#     azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
#   ]
# }



# resource "null_resource" "rg_sec_wl_aks_cl_install_rabbit_mq" {
#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_sec.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
#       command_text        = "kubectl create -f 02-0-RabbitMQ-2.5.0-cluster-operator-namespace.yaml"
#       file_path           = abspath("${local.configs_path}//aks//02-0-RabbitMQ-2.5.0-cluster-operator-namespace.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_sec.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
#       command_text        = "kubectl create -f 02-1-RabbitMQ-2.5.0-cluster-operator.yaml -n rabbitmq-system"
#       file_path           = abspath("${local.configs_path}//aks//02-1-RabbitMQ-2.5.0-cluster-operator.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   triggers = {
#     run_id = 1
#   }

#   depends_on = [
#     azurerm_role_assignment.rg_sec_devops_sp_wl_aks_cl_admin_role_assg_01,
#     azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
#   ]
# }



# # below resource can be only installed via devops pipelines via native istioctl.exe. Azure Run Command can't execute istioctl.exe remotely. 
# # resource "null_resource" "rg_sec_wl_aks_cl_install_istio_default" {

# #   provisioner "local-exec" {
# #     on_failure = fail

# #     interpreter = ["pwsh", "-File"]
# #     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

# #     environment = {
# #       use_msi             = var.use_msi
# #       subscription_id     = var.subscription_id
# #       client_id           = var.client_id
# #       client_secret       = var.client_secret
# #       tenant_id           = var.tenant_id
# #       resource_group_name = azurerm_resource_group.rg_sec.name
# #       aks_cluster_name    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
# #       command_text        = "istioctl apply -f 03-1-Istio-default-profile-install.yaml"
# #       file_path         = abspath("${local.configs_path}//aks//03-1-Istio-default-profile-install.yaml")
# #       is_logger_enabled   = true
# #     }
# #   }

# #   triggers = {
# #     run_id = 1
# #   }

# #   depends_on = [
# #     azurerm_role_assignment.rg_sec_devops_sp_wl_aks_cl_admin_role_assg_01,
# #     azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
# #   ]
# # }


# resource "null_resource" "rg_sec_wl_aks_cl_install_istio_kiali" {


#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_sec.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
#       command_text        = "kubectl apply -f 03-2-Istio-kiali-prometheus.yaml -n istio-system"
#       file_path           = abspath("${local.configs_path}//aks//03-2-Istio-kiali-prometheus.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   provisioner "local-exec" {
#     on_failure = fail

#     interpreter = ["pwsh", "-File"]
#     command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

#     environment = {
#       use_msi             = var.use_msi
#       subscription_id     = var.subscription_id
#       client_id           = var.client_id
#       client_secret       = var.client_secret
#       tenant_id           = var.tenant_id
#       resource_group_name = azurerm_resource_group.rg_sec.name
#       aks_cluster_name    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
#       command_text        = "kubectl apply -f 03-3-Istio-kiali.yaml -n istio-system"
#       file_path           = abspath("${local.configs_path}//aks//03-3-Istio-kiali.yaml")
#       is_logger_enabled   = true
#     }
#   }

#   triggers = {
#     run_id = 2
#   }

#   depends_on = [
#     azurerm_role_assignment.rg_sec_devops_sp_wl_aks_cl_admin_role_assg_01,
#     azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
#   ]
# }

resource "null_resource" "rg_sec_wl_aks_cl_install_helm_workload_identity" {

  provisioner "local-exec" {
    on_failure = fail

    interpreter = ["pwsh", "-File"]
    command     = "${local.ps_scripts_path}\\azure-aks-run-command.ps1"

    environment = {
      use_msi             = var.use_msi
      subscription_id     = var.subscription_id
      client_id           = var.client_id
      client_secret       = var.client_secret
      tenant_id           = var.tenant_id
      resource_group_name = azurerm_resource_group.rg_sec.name
      aks_cluster_name    = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
      command_text        = "helm repo add azure-workload-identity https://azure.github.io/azure-workload-identity/charts && helm repo update && helm install workload-identity-webhook azure-workload-identity/workload-identity-webhook --namespace azure-workload-identity-system --create-namespace --set azureTenantID=\"${var.tenant_id}\""
      is_logger_enabled   = true
    }
  }
  triggers = {
    run_id = 3
  }

  depends_on = [
    azurerm_role_assignment.rg_sec_devops_sp_wl_aks_cl_admin_role_assg_01,
    azuread_group_member.aks_admin_aad_grp_ops_sp_grp_mmb_01
  ]
}
