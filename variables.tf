# MAIN:START

variable "is_demo" {
  type        = string
  description = ""
  default     = false
}
variable "demo_prefix" {
  type        = string
  description = ""
}
variable "company_name_long" {
  type        = string
  description = ""
}
variable "company_name_short" {
  type        = string
  description = ""
}
variable "product_name_long" {
  type        = string
  description = ""
}
variable "product_name_short" {
  type        = string
  description = ""
}
variable "product_unique" {
  type        = string
  description = ""
}
variable "devops_organization_name" {
  type        = string
  description = ""
}

# MAIN:END

# MAIN:CONNECTION:START
variable "use_msi" {
  type        = string
  description = ""
  default     = false
}
variable "subscription_id" {
  type        = string
  description = ""
}
variable "client_id" {
  type        = string
  description = ""
}
variable "client_secret" {
  type        = string
  description = ""
}
variable "tenant_id" {
  type        = string
  description = ""
}
variable "tenant_name" {
  type        = string
  description = ""
}

variable "storage_account_name" {
  type        = string
  description = ""
}
variable "storage_container_name" {
  type        = string
  description = ""
}
variable "storage_access_key" {
  type        = string
  description = ""
}
variable "devops_user_name" {
  type        = string
  description = ""
}
variable "customer_d365_org_url" {
  type        = string
  description = ""
}

# MAIN:CONNECTION:END

# MAIN:ROTATION:START

variable "ops_sp_pass_rotation_id" {
  type        = number
  description = ""
}
variable "storage_account_rotation_key_id" {
  type        = number
  description = ""
}
variable "auto_run_as_account_cert_rotation_trigger" {
  type        = string
  description = ""
}
variable "relay_rotation_key_id" {
  type        = string
  description = ""
}
variable "devops_service_principal_password_rotation_id" {
  type        = string
  description = ""
}
variable "aad_user_password_rotation_id" {
  type        = string
  description = ""
}

# MAIN:ROTATION:END

# RESOURCE_GROUP:START
variable "environment_long" {
  type        = string
  description = ""
}

variable "environment_short" {
  type        = string
  description = ""
}

variable "rg_pri_location_short" {
  type        = string
  description = ""
}
variable "rg_pri_location_long" {
  type        = string
  description = ""
}

variable "rg_sec_location_short" {
  type        = string
  description = ""
}
variable "rg_sec_location_long" {
  type        = string
  description = ""
}

variable "rg_we_location_short" {
  type        = string
  description = ""
}

variable "rg_we_location_long" {
  type        = string
  description = ""
}

# RESOURCE_GROUP:END

variable "rg_pri_tfs_sa_account_replication_type" {
  type        = string
  description = ""
}
variable "rg_sec_tfs_sa_account_replication_type" {
  type        = string
  description = ""
}

# VIRTUAL_NETWORK:START

variable "rg_pri_spk_vn_address_space" {
  type        = string
  description = ""
}

variable "rg_pri_hub_vn_address_space" {
  type        = string
  description = ""
}

variable "rg_sec_spk_vn_address_space" {
  type        = string
  description = ""
}

variable "rg_sec_hub_vn_address_space" {
  type        = string
  description = ""
}

# VIRTUAL_NETWORK:END


# VIRTUAL_SUBNET:START

variable "rg_pri_hub_vn_frw_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_pri_hub_vn_jmb_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_pri_hub_vn_vng_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_pri_hub_vn_wef_agw_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_pri_spk_vn_wl_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_pri_spk_vn_sql_pe_int_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_pri_spk_vn_rls_sub_address_space" {
  type        = string
  description = ""
}


variable "rg_sec_hub_vn_frw_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_sec_hub_vn_jmb_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_sec_hub_vn_vng_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_sec_hub_vn_wef_agw_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_sec_spk_vn_wl_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_sec_spk_vn_sql_pe_int_sub_address_space" {
  type        = string
  description = ""
}

variable "rg_sec_spk_vn_rls_sub_address_space" {
  type        = string
  description = ""
}
# VIRTUAL_SUBNET:END

# VIRTUAL_MACHINE:START

variable "rg_pri_rls_vm_size" {
  type        = string
  description = ""
}

variable "rg_pri_rls_vm_os_disk_disk_size_gb" {
  type        = string
  description = ""
}

variable "rg_pri_rls_vm_os_profile_admin_username" {
  type        = string
  description = ""
}

variable "rg_pri_rls_vm_os_profile_admin_password" {
  type        = string
  description = ""
}

variable "rg_pri_jmb_vm_size" {
  type        = string
  description = ""
}

variable "rg_pri_jmb_vm_os_disk_disk_size_gb" {
  type        = string
  description = ""
}

variable "rg_pri_jmb_vm_os_profile_admin_username" {
  type        = string
  description = ""
}

variable "rg_pri_jmb_vm_os_profile_admin_password" {
  type        = string
  description = ""
}

variable "rg_sec_rls_vm_size" {
  type        = string
  description = ""
}

variable "rg_sec_rls_vm_os_disk_disk_size_gb" {
  type        = string
  description = ""
}

variable "rg_sec_rls_vm_os_profile_admin_username" {
  type        = string
  description = ""
}

variable "rg_sec_rls_vm_os_profile_admin_password" {
  type        = string
  description = ""
}

variable "rg_sec_jmb_vm_size" {
  type        = string
  description = ""
}

variable "rg_sec_jmb_vm_os_disk_disk_size_gb" {
  type        = string
  description = ""
}

variable "rg_sec_jmb_vm_os_profile_admin_username" {
  type        = string
  description = ""
}

variable "rg_sec_jmb_vm_os_profile_admin_password" {
  type        = string
  description = ""
}

# VIRTUAL_MACHINE:END


# APPLICATION_INSIGHTS:START

variable "rg_pri_mon_ai_sampling_percentage" {
  type        = string
  description = ""
}
variable "rg_pri_mon_ai_continuous_export_document_types" {
  type        = string
  description = ""
}

variable "rg_sec_mon_ai_sampling_percentage" {
  type        = string
  description = ""
}
variable "rg_sec_mon_ai_continuous_export_document_types" {
  type        = string
  description = ""
}

# APPLICATION_INSIGHTS:END


# LOG_ANALYTICS_WORKSPACE:START

variable "rg_pri_mon_la_ws_sku" {
  type        = string
  description = ""
}
variable "rg_pri_mon_la_ws_retention_in_days" {
  type        = string
  description = ""
}

variable "rg_sec_mon_la_ws_sku" {
  type        = string
  description = ""
}
variable "rg_sec_mon_la_ws_retention_in_days" {
  type        = string
  description = ""
}

# LOG_ANALYTICS_WORKSPACE:END


# RECOVERY_SERVICES_VAULT:START
variable "rg_pri_rsv_sku" {
  type        = string
  description = ""
}
variable "rg_sec_rsv_sku" {
  type        = string
  description = ""
}

# RECOVERY_SERVICES_VAULT:END


# BACKUP_POLICY:START
variable "rls_vm_bck_pol_instant_restore_retention_days" {
  type        = string
  description = ""
}
variable "rls_vm_bck_pol_backup_time" {
  type        = string
  description = ""
}
variable "rls_vm_bck_pol_daily_policy_retention_days" {
  type        = string
  description = ""
}
variable "rls_vm_bck_pol_weekly_policy_retention_weeks" {
  type        = string
  description = ""
}
variable "rls_vm_bck_pol_weekly_policy_retention_weekdays" {
  type        = list(any)
  description = ""
}

# BACKUP_POLICY:END

# SQL_SERVER:START

variable "rg_pri_sol_sql_administrator_login" {
  type        = string
  description = ""
}
variable "sql_admin_login_pass_rotation_id" {
  type        = string
  description = ""
}
variable "sql_aad_user_login_pass_rotation_id" {
  type        = string
  description = ""
}
variable "rg_pri_sql_admin_aad_user_01_password" {
  type        = string
  description = ""
}
variable "rg_pri_sql_admin_aad_user_01_username" {
  type        = string
  description = ""
}

variable "rg_sec_sol_sql_administrator_login" {
  type        = string
  description = ""
}
variable "rg_sec_sql_admin_aad_user_01_password" {
  type        = string
  description = ""
}
variable "rg_sec_sql_admin_aad_user_01_username" {
  type        = string
  description = ""
}

# SQL_SERVER:END

variable "monitor_autoscale_setting_profile_capacity_default" {
  type        = string
  description = ""
  default     = ""
}

variable "monitor_autoscale_setting_profile_capacity_minimum" {
  type        = string
  description = ""
  default     = ""
}

variable "monitor_autoscale_setting_profile_capacity_maximum" {
  type        = string
  description = ""
  default     = ""
}

# STORAGE_ACCOUNT_MANAGEMENT_POLICY:START
variable "cool_logs_after_modification_date_greater_than_in_days" {
  type        = number
  description = ""
}
variable "archive_logs_after_modification_date_greater_than_in_days" {
  type        = number
  description = ""
}
variable "delete_logs_after_modification_date_greater_than_in_days" {
  type        = number
  description = ""
}
variable "snapshot_delete_after_days_since_creation_greater_than" {
  type        = number
  description = ""
}

# STORAGE_ACCOUNT_MANAGEMENT_POLICY:END

variable "domain_name_suffix" {
  type        = string
  description = ""
}

variable "kub_mng_domain_name_suffix" {
  type        = string
  description = ""
}

variable "internal_domain_fqdn" {
  type        = string
  description = ""
}

# SQL_SERVER:START

variable "sql_contact_service_desk_email" {
  type        = string
  description = ""
}

variable "security_alert_policy_log_retention_period_in_days" {
  type        = string
  description = ""
}
variable "extended_auditing_policy_log_retention_period_in_days" {
  type        = string
  description = ""
}
# SQL_SERVER:END

# ELASTIC_POOL:START

variable "rg_pri_sol_sql_ep_max_size_gb" {
  type        = string
  description = ""
}
variable "rg_pri_sol_sql_ep_sku_name" {
  type        = string
  description = ""
}
variable "rg_pri_sol_sql_ep_sku_tier" {
  type        = string
  description = ""
}
variable "rg_pri_sol_sql_ep_sku_capacity" {
  type        = string
  description = ""
}
variable "rg_pri_sol_sql_ep_per_database_min_capacity" {
  type        = string
  description = ""
}
variable "rg_pri_sol_sql_ep_per_database_max_capacity" {
  type        = string
  description = ""
}

variable "rg_sec_sol_sql_ep_max_size_gb" {
  type        = string
  description = ""
}
variable "rg_sec_sol_sql_ep_sku_name" {
  type        = string
  description = ""
}
variable "rg_sec_sol_sql_ep_sku_tier" {
  type        = string
  description = ""
}
variable "rg_sec_sol_sql_ep_sku_capacity" {
  type        = string
  description = ""
}
variable "rg_sec_sol_sql_ep_per_database_min_capacity" {
  type        = string
  description = ""
}
variable "rg_sec_sol_sql_ep_per_database_max_capacity" {
  type        = string
  description = ""
}

# ELASTIC_POOL:END

# AUTOMATION_ACCOUNT:START

variable "rg_pri_auto_sku_name" {
  type        = string
  description = ""
}

variable "notification_email_username" {
  type        = string
  description = ""
  default     = ""
}

variable "notification_email_password" {
  type        = string
  description = ""
  default     = ""
}


variable "notification_email_description" {
  type        = string
  description = ""
  default     = ""
}

variable "auto_notification_contact_email_group" {
  type        = list(string)
  description = ""
}

variable "auto_chk_d365_avl_rb_01_log_verbose" {
  type        = string
  description = ""
  default     = ""
}

variable "auto_chk_d365_avl_rb_01_log_progress" {
  type        = string
  description = ""
  default     = ""
}

variable "auto_chk_d365_avl_rb_01_description" {
  type        = string
  description = ""
  default     = ""
}

variable "auto_chk_d365_avl_rb_01_runbook_type" {
  type        = string
  description = ""
  default     = ""
}

# AUTOMATION_ACCOUNT:END

variable "ziraatbank_servers" {
  type        = set(string)
  description = ""
}

variable "app_center_rest_api_token" {
  type        = string
  description = ""
  default     = ""
}

# APPLICATION_SERVICE:START

variable "log_retention_period_in_days" {
  type        = string
  description = ""
}
variable "app_log_retention_period_in_days" {
  type        = string
  description = ""
}
variable "metric_retention_period_in_days" {
  type        = string
  description = ""
}

# APPLICATION_SERVICE:END


# NOTIFICATION_HUB_NAMESPACE:START

variable "rg_pri_nhb_ns_mob_namespace_type" {
  type        = string
  description = ""
}
variable "rg_pri_nhb_ns_mob_sku_name" {
  type        = string
  description = ""
}
variable "rg_pri_nhb_ns_mob_nhb_gcm_credential_api_key" {
  type        = string
  description = ""
}
variable "rg_pri_nhb_ns_mob_nhb_apns_credential_application_mode" {
  type        = string
  description = ""
}
variable "rg_pri_nhb_ns_mob_nhb_apns_credential_bundle_id" {
  type        = string
  description = ""
}
variable "rg_pri_nhb_ns_mob_nhb_apns_credential_key_id" {
  type        = string
  description = ""
}
variable "rg_pri_nhb_ns_mob_nhb_apns_credential_team_id" {
  type        = string
  description = ""
}
variable "rg_pri_nhb_ns_mob_nhb_apns_credential_token" {
  type        = string
  description = ""
}

variable "rg_sec_nhb_ns_mob_namespace_type" {
  type        = string
  description = ""
}
variable "rg_sec_nhb_ns_mob_sku_name" {
  type        = string
  description = ""
}
variable "rg_sec_nhb_ns_mob_nhb_gcm_credential_api_key" {
  type        = string
  description = ""
}
variable "rg_sec_nhb_ns_mob_nhb_apns_credential_application_mode" {
  type        = string
  description = ""
}
variable "rg_sec_nhb_ns_mob_nhb_apns_credential_bundle_id" {
  type        = string
  description = ""
}
variable "rg_sec_nhb_ns_mob_nhb_apns_credential_key_id" {
  type        = string
  description = ""
}
variable "rg_sec_nhb_ns_mob_nhb_apns_credential_team_id" {
  type        = string
  description = ""
}
variable "rg_sec_nhb_ns_mob_nhb_apns_credential_token" {
  type        = string
  description = ""
}

# NOTIFICATION_HUB_NAMESPACE:END

# LOCAL_NETWORK_GATEWAY:START

variable "ziraatag_hq_prod_lng_gateway_address" {
  type        = string
  description = ""
}

variable "ziraatag_hq_prod_lng_address_space_array" {
  type        = list(any)
  description = ""
}

variable "ziraatag_hq_bck_lng_gateway_address" {
  type        = string
  description = ""
}

variable "ziraatag_hq_bck_lng_address_space_array" {
  type        = list(any)
  description = ""
}

variable "ziraatag_drc_lng_gateway_address" {
  type        = string
  description = ""
}

variable "ziraatag_drc_lng_address_space_array" {
  type        = list(any)
  description = ""
}

# LOCAL_NETWORK_GATEWAY:END

# VPN_GATEWAY_CONNECTION:START

variable "rg_pri_ziraatag_vngc_policy_dh_group" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_vngc_policy_ike_encryption" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_vngc_policy_ike_integrity" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_vngc_policy_ipsec_encryption" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_vngc_policy_ipsec_integrity" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_vngc_policy_pfs_group" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_vngc_policy_sa_lifetime_sec" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_vngc_policy_sa_datasize_kb" {
  type        = string
  description = ""
}

variable "rg_sec_ziraatag_vngc_policy_dh_group" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_vngc_policy_ike_encryption" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_vngc_policy_ike_integrity" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_vngc_policy_ipsec_encryption" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_vngc_policy_ipsec_integrity" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_vngc_policy_pfs_group" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_vngc_policy_sa_lifetime_sec" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_vngc_policy_sa_datasize_kb" {
  type        = string
  description = ""
}

variable "rg_pri_ziraatag_hq_prod_lng_vng_con_shared_secret_key" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_hq_bck_lng_vng_con_shared_secret_key" {
  type        = string
  description = ""
}
variable "rg_pri_ziraatag_drc_lng_vng_con_shared_secret_key" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_hq_prod_lng_vng_con_shared_secret_key" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_hq_bck_lng_vng_con_shared_secret_key" {
  type        = string
  description = ""
}
variable "rg_sec_ziraatag_drc_lng_vng_con_shared_secret_key" {
  type        = string
  description = ""
}

# VPN_GATEWAY_CONNECTION:END


#CERTIFICATE_SECRETS:START
variable "wef_cert_password" {
  type        = string
  description = ""
}
variable "wef_cert_value" {
  type        = string
  description = ""
}
variable "wif_cert_password" {
  type        = string
  description = ""
}
variable "wif_cert_value" {
  type        = string
  description = ""
}
variable "argo_cert_value" {
  type        = string
  description = ""
}
variable "argo_cert_password" {
  type        = string
  description = ""
}


#CERTIFICATE_SECRETS:END

#APPLICATION_GATEWAY:START

variable "rg_pri_wef_agw_sku_name" {
  type        = string
  description = ""
}

variable "rg_pri_wef_agw_sku_tier" {
  type        = string
  description = ""
}

variable "rg_pri_wef_agw_sku_capacity" {
  type        = string
  description = ""
}

variable "rg_pri_wef_agw_waf_configuration_firewall_mode" {
  type        = string
  description = ""
}

variable "rg_pri_wef_agw_autoscale_min_capacity" {
  type        = string
  description = ""
}

variable "rg_pri_wef_agw_autoscale_max_capacity" {
  type        = string
  description = ""
}

variable "rg_sec_wef_agw_sku_name" {
  type        = string
  description = ""
}

variable "rg_sec_wef_agw_sku_tier" {
  type        = string
  description = ""
}

variable "rg_sec_wef_agw_sku_capacity" {
  type        = string
  description = ""
}

variable "rg_sec_wef_agw_waf_configuration_firewall_mode" {
  type        = string
  description = ""
}

variable "rg_sec_wef_agw_autoscale_min_capacity" {
  type        = string
  description = ""
}

variable "rg_sec_wef_agw_autoscale_max_capacity" {
  type        = string
  description = ""
}

# APPLICATION_GATEWAY:END


# ACME_REGISTRATION: START

variable "acme_reg_email_address" {
  type        = string
  description = ""
}
# ACME_REGISTRATION: END

## AKS Variables Start ##



variable "wl_aks_default_pool_node_count" {
  type        = string
  description = ""
}

variable "wl_aks_worker_pool_node_count" {
  type        = string
  description = ""
}
variable "wl_aks_worker_pool_min_node_count" {
  type        = string
  description = ""
}
variable "wl_aks_worker_pool_max_node_count" {
  type        = string
  description = ""
}
variable "wl_aks_agent_pool_min_node_count" {
  type        = string
  description = ""
}
variable "wl_aks_agent_pool_max_node_count" {
  type        = string
  description = ""
}
variable "wl_aks_pod_count_per_node" {
  type        = string
  description = ""
}
variable "wl_aks_os_disk_size_gb" {
  type        = string
  description = ""
}

variable "wl_aks_vm_size" {
  type        = string
  description = ""
}
variable "wl_aks_pod_cidr" {
  type        = string
  description = ""
}
variable "wl_aks_service_cidr" {
  type        = string
  description = ""
}

variable "wl_aks_zones" {
  type        = list(any)
  description = ""
}

## AKS Variables End ##

variable "internal_domain_admin_user_name" {
  type        = string
  description = ""
}
variable "internal_domain_admin_user_pwd" {
  type        = string
  description = ""
}
variable "internal_domain_netbios_name" {
  type        = string
  description = ""
}
variable "rg_pri_spk_vn_wl_aks_ip" {
  type        = string
  description = ""
}
variable "rg_sec_spk_vn_wl_aks_ip" {
  type        = string
  description = ""
}
# AKS Variables End ##

# FIREWALL:START

variable "rg_pri_frw_sku_name" {
  type        = string
  description = ""
}
variable "rg_pri_frw_sku_tier" {
  type        = string
  description = ""
}

#--

variable "rg_sec_frw_sku_name" {
  type        = string
  description = ""
}
variable "rg_sec_frw_sku_tier" {
  type        = string
  description = ""
}

# FIREWALL:END


# PAT Secret for OPS

variable "ops_crd_deployment_client_pat_secret" {
  type        = string
  description = ""
  default     = ""
}

# PAT Secret for OPS 


# VeriChannel : START
variable "vc_app_d365_smtp_password_secret" {
  type        = string
  description = ""
}
variable "vc_app_pdf_converter_license_key_secret" {
  type        = string
  description = ""
}
variable "vc_app_rsa_private_key_secret" {
  type        = string
  description = ""
}
variable "vc_app_rsa_public_key_modulus_secret" {
  type        = string
  description = ""
}
variable "vc_app_soft_otp_rsa_private_key_secret" {
  type        = string
  description = ""
}
variable "vc_app_sinch_api_token_secret" {
  type        = string
  description = ""
}
variable "vc_app_azure_storage_token_secret" {
  type        = string
  description = ""
}
variable "vc_app_adcon_api_password_secret" {
  type        = string
  description = ""
}

# VeriChannel : END

#Ziraat Bank Hermes API IP 

variable "ziraat_de_hermes_api_ip" {
  type        = string
  description = ""
}

variable "maintenance_configuration_start_time" {
  type        = string
  description = "VM Update Management Configuration Start Time"
}