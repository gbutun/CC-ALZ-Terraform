locals {
  acr = {
    sku = {
      basic    = "Basic"
      standard = "Standard"
      premium  = "Premium"
    }

    network_rule_set = {
      action = {
        allow = "Allow"
        deny  = "Deny"
      }

    }
  }
}

resource "azurerm_container_registry" "rg_pri_sol_acr" {
  name                = "${local.resource_prefix_rg_pri_only_environment_and_location}solacr${var.product_unique}"
  resource_group_name = azurerm_resource_group.rg_pri.name
  location            = azurerm_resource_group.rg_pri.location
  sku                 = local.acr.sku.premium
  admin_enabled       = false

  identity {
    type = local.resource_identity_type.user_assigned
    identity_ids = [
      azurerm_user_assigned_identity.rg_pri_sol_acr_usr_asgn_id.id
    ]
  }
  georeplications {
    location = "Germany North"
  }

  encryption {
    enabled            = true
    key_vault_key_id   = azurerm_key_vault_key.rg_pri_cmk_enc_kv_acr_enc_sse_key.id
    identity_client_id = azurerm_user_assigned_identity.rg_pri_sol_acr_usr_asgn_id.client_id
  }

  network_rule_set {
    default_action = local.acr.network_rule_set.action.deny


    ip_rule {
      action   = local.acr.network_rule_set.action.allow
      ip_range = local.vrp_ist_new_ip_02
    }

    ip_rule {
      action   = local.acr.network_rule_set.action.allow
      ip_range = azurerm_public_ip.rg_pri_frw_pip.ip_address
    }

    ip_rule {
      action   = local.acr.network_rule_set.action.allow
      ip_range = azurerm_public_ip.rg_sec_frw_pip.ip_address
    }

    ip_rule {
      action   = local.acr.network_rule_set.action.allow
      ip_range = local.vrp_con_reg_ip_02
    }

    ip_rule {
      action   = local.acr.network_rule_set.action.allow
      ip_range = local.vrp_con_reg_ip_03
    }

    ip_rule {
      action   = local.acr.network_rule_set.action.allow
      ip_range = local.vrp_con_reg_ip_04
    }

    ip_rule {
      action   = local.acr.network_rule_set.action.allow
      ip_range = local.vrp_con_reg_ip_05
    }
  }


  tags = {
    company                   = var.company_name_long
    product                   = local.product_name_long
    region                    = var.rg_pri_location_long
    environment               = var.environment_long
    enable_auto_diag_settings = true
    name                      = "Azure Container Registry"
  }
}

#--

# resource "azurerm_container_registry" "rg_sec_sol_acr" {
#   name                = "${local.resource_prefix_rg_sec_only_environment_and_location}solacr${var.product_unique}"
#   resource_group_name = azurerm_resource_group.rg_sec.name
#   location            = azurerm_resource_group.rg_sec.location
#   sku                 = local.acr.sku.premium
#   admin_enabled       = false

#   identity {
#     type = local.resource_identity_type.user_assigned
#     identity_ids = [
#       azurerm_user_assigned_identity.rg_sec_sol_acr_usr_asgn_id.id
#     ]
#   }

#   encryption {
#     enabled            = true
#     key_vault_key_id   = data.azurerm_key_vault_key.rg_sec_cmk_enc_kv_acr_enc_sse_key.id
#     identity_client_id = azurerm_user_assigned_identity.rg_sec_sol_acr_usr_asgn_id.client_id
#   }

#   network_rule_set {
#     default_action = local.acr.network_rule_set.action.deny


#     ip_rule {
#       action   = local.acr.network_rule_set.action.allow
#       ip_range = azurerm_public_ip.rg_sec_frw_pip.ip_address
#     }
#   }

#   lifecycle {
#     ignore_changes = [
#       network_rule_set
#     ]
#   }


#   tags = {
#     company                   = var.company_name_long
#     product                   = local.product_name_long
#     region                    = var.rg_sec_location_long
#     environment               = var.environment_long
#     enable_auto_diag_settings = true
#     name                      = "Azure Container Registry"
#   }
# }
