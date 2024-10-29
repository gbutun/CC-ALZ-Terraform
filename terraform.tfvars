# MAIN:START

is_demo = false

demo_prefix = "x"

environment_long = "prod"

environment_short = "p"

company_name_long = "Ziraat Bank International AG"

company_name_short = "zag"

product_name_long = "Digital Transformation"

product_name_short = "dt"

product_unique = "z5b"

tenant_name = "WMLYYWFGQUD0WZXJ.onmicrosoft.com"

devops_organization_name = "cm-ops-09-z5b"

customer_d365_org_url = "https://vt-zag.crm4.dynamics.com/"

# MAIN:END


# MAIN:ROTATION:START

aad_user_password_rotation_id = 1

ops_sp_pass_rotation_id = 1

storage_account_rotation_key_id = 1

sql_admin_login_pass_rotation_id = 1

sql_aad_user_login_pass_rotation_id = 1

auto_run_as_account_cert_rotation_trigger = 1

relay_rotation_key_id = 1

devops_service_principal_password_rotation_id = 1

# MAIN:ROTATION:END

# RESOURCE_GROUP:START

rg_pri_location_long = "germanywestcentral"

rg_pri_location_short = "gwc"

rg_sec_location_long = "germanynorth"

rg_sec_location_short = "gn"

rg_we_location_long = "westeurope"

rg_we_location_short = "we"

rg_pri_tfs_sa_account_replication_type = "LRS"

rg_sec_tfs_sa_account_replication_type = "LRS"

# RESOURCE_GROUP:END

# VIRTUAL_NETWORK:START

rg_pri_hub_vn_address_space = "192.168.112.0/24"

rg_pri_spk_vn_address_space = "192.168.113.0/24"

rg_sec_hub_vn_address_space = "192.168.114.0/24"

rg_sec_spk_vn_address_space = "192.168.115.0/24"

# VIRTUAL_NETWORK:END

# VIRTUAL_SUBNET:START

# HUB VNET 1
#REG01
rg_pri_hub_vn_frw_sub_address_space = "192.168.112.0/26"

rg_pri_hub_vn_jmb_sub_address_space = "192.168.112.64/28"

rg_pri_hub_vn_vng_sub_address_space = "192.168.112.96/27"

rg_pri_hub_vn_wef_agw_sub_address_space = "192.168.112.128/26"

# SPOKE VNET 2

#REG01
rg_pri_spk_vn_wl_sub_address_space = "192.168.113.0/26"

rg_pri_spk_vn_sql_pe_int_sub_address_space = "192.168.113.64/28"

rg_pri_spk_vn_rls_sub_address_space = "192.168.113.80/28"

rg_pri_spk_vn_wl_aks_ip = "192.168.113.15"


#REG02
rg_sec_hub_vn_frw_sub_address_space = "192.168.114.0/26"

rg_sec_hub_vn_jmb_sub_address_space = "192.168.114.64/28"

rg_sec_hub_vn_vng_sub_address_space = "192.168.114.96/27"

rg_sec_hub_vn_wef_agw_sub_address_space = "192.168.114.128/26"

# SPOKE VNET 2

#REG02
rg_sec_spk_vn_wl_sub_address_space = "192.168.115.0/26"

rg_sec_spk_vn_sql_pe_int_sub_address_space = "192.168.115.64/28"

rg_sec_spk_vn_rls_sub_address_space = "192.168.115.80/28"

rg_sec_spk_vn_wl_aks_ip = "192.168.115.15"

# VIRTUAL_SUBNET:END

monitor_autoscale_setting_profile_capacity_default = 1
monitor_autoscale_setting_profile_capacity_minimum = 1
monitor_autoscale_setting_profile_capacity_maximum = 2


# VIRTUAL_MACHINE:START

rg_pri_rls_vm_size = "Standard_B2ms"

rg_pri_rls_vm_os_disk_disk_size_gb = 128

rg_pri_jmb_vm_size = "Standard_B2ms"

rg_pri_jmb_vm_os_disk_disk_size_gb = 128

rg_sec_rls_vm_size = "Standard_B2ms"

rg_sec_rls_vm_os_disk_disk_size_gb = 128

rg_sec_jmb_vm_size = "Standard_B2ms"

rg_sec_jmb_vm_os_disk_disk_size_gb = 128

# VIRTUAL_MACHINE:END

# APPLICATION_INSIGHTS:START

rg_pri_mon_ai_sampling_percentage = "100"

rg_pri_mon_ai_continuous_export_document_types = "Request,Exception,Custom Event,Trace,Metric,Page Load,Page View,Dependency,Availability,Performance Counter"

rg_sec_mon_ai_sampling_percentage = "100"

rg_sec_mon_ai_continuous_export_document_types = "Request,Exception,Custom Event,Trace,Metric,Page Load,Page View,Dependency,Availability,Performance Counter"

# APPLICATION_INSIGHTS:END

# LOG_ANALYTICS_WORKSPACE:START

rg_pri_mon_la_ws_sku = "PerGB2018"

rg_pri_mon_la_ws_retention_in_days = 90

rg_sec_mon_la_ws_sku = "PerGB2018"

rg_sec_mon_la_ws_retention_in_days = 90

# LOG_ANALYTICS_WORKSPACE:END

# RECOVERY_SERVICES_VAULT:START

rg_pri_rsv_sku = "Standard"
rg_sec_rsv_sku = "Standard"

# RECOVERY_SERVICES_VAULT:END

# BACKUP_POLICY:START

rls_vm_bck_pol_instant_restore_retention_days   = 1
rls_vm_bck_pol_backup_time                      = "03:00"
rls_vm_bck_pol_daily_policy_retention_days      = 7
rls_vm_bck_pol_weekly_policy_retention_weeks    = 4
rls_vm_bck_pol_weekly_policy_retention_weekdays = ["Saturday"]

# BACKUP_POLICY:END

#STORAGE_ACCOUNT_MANAGEMENT_POLICY:START
cool_logs_after_modification_date_greater_than_in_days = 60

archive_logs_after_modification_date_greater_than_in_days = 180

delete_logs_after_modification_date_greater_than_in_days = 2557

snapshot_delete_after_days_since_creation_greater_than = 60

#STORAGE_ACCOUNT_MANAGEMENT_POLICY:END

# DNS_ZONE: START

domain_name_suffix = "ziraatbank.de"

internal_domain_admin_user_name = ""

internal_domain_admin_user_pwd = ""

internal_domain_netbios_name = "zag"

internal_domain_fqdn = "ziraatbank.de"

kub_mng_domain_name_suffix = "oktopus.saas.veripark.com"

# DNS_ZONE: END

# SQL_SERVER:START

sql_contact_service_desk_email = "bgonuldas@veripark.com;berkay.erkoy@veripark.com"

security_alert_policy_log_retention_period_in_days = 0

extended_auditing_policy_log_retention_period_in_days = 0

# SQL_SERVER:END

# ELASTIC_POOL:START

rg_pri_sol_sql_ep_max_size_gb = 500 # GB

rg_pri_sol_sql_ep_sku_name = "StandardPool" # DTU_BASED: BasicPool, StandardPool, or PremiumPool /// VCORE_BASED: {tier_family}

rg_pri_sol_sql_ep_sku_tier = "Standard" # GeneralPurpose, BusinessCritical, Basic, Standard, or Premium

rg_pri_sol_sql_ep_sku_capacity = 100 # eDTU

rg_pri_sol_sql_ep_per_database_min_capacity = 0

rg_pri_sol_sql_ep_per_database_max_capacity = 100


rg_sec_sol_sql_ep_max_size_gb = 500 # GB

rg_sec_sol_sql_ep_sku_name = "StandardPool" # DTU_BASED: BasicPool, StandardPool, or PremiumPool /// VCORE_BASED: {tier_family}

rg_sec_sol_sql_ep_sku_tier = "Standard" # GeneralPurpose, BusinessCritical, Basic, Standard, or Premium

rg_sec_sol_sql_ep_sku_capacity = 100 # eDTU

rg_sec_sol_sql_ep_per_database_min_capacity = 0

rg_sec_sol_sql_ep_per_database_max_capacity = 100

# ELASTIC_POOL:END

# AUTOMATION_ACCOUNT:START

rg_pri_auto_sku_name = "Basic"

notification_email_description                 = "Veripark Notifications Email Credentials"

auto_notification_contact_email_group = ["mohan.g@veripark.com", "faheem.ullah@veripark.com"]

auto_chk_d365_avl_rb_01_log_verbose = true
auto_chk_d365_avl_rb_01_log_progress = true
auto_chk_d365_avl_rb_01_description = "The script for checking availabilty of D365 and sending availabilty telemetry to Application Insights"
auto_chk_d365_avl_rb_01_runbook_type = "PowerShell"

# AUTOMATION_ACCOUNT:END

# ziraatbank Source IP Blocks for Internal Services
ziraatbank_servers = ["213.61.186.100", "93.240.163.74"]

# APPLICATION_SERVICE:START

log_retention_period_in_days = 30

metric_retention_period_in_days = 30

app_log_retention_period_in_days = 30

# APPLICATION_SERVICE:END


# NOTIFICATION_HUB:START

rg_pri_nhb_ns_mob_namespace_type = "NotificationHub" # Messaging, NotificationHub

rg_pri_nhb_ns_mob_sku_name = "Basic" # Free, Basic or Standard

rg_pri_nhb_ns_mob_nhb_apns_credential_application_mode = "Production" # Production or Sandbox

rg_sec_nhb_ns_mob_namespace_type = "NotificationHub" # Messaging, NotificationHub

rg_sec_nhb_ns_mob_sku_name = "Basic" # Free, Basic or Standard

rg_sec_nhb_ns_mob_nhb_apns_credential_application_mode = "Production" # Production or Sandbox

# NOTIFICATION_HUB:END

# LOCAL_NETWORK_GATEWAY:START

ziraatag_hq_prod_lng_gateway_address     = "213.61.186.100"
ziraatag_hq_prod_lng_address_space_array = ["10.10.120.0/24","10.10.120.121/32"]
ziraatag_hq_bck_lng_gateway_address      = "93.240.163.74"
ziraatag_hq_bck_lng_address_space_array  = ["10.10.120.0/24","10.10.120.121/32"]
ziraatag_drc_lng_gateway_address         = "212.185.105.154"
ziraatag_drc_lng_address_space_array     = ["10.10.210.0/24","10.10.210.121/32"]

# LOCAL_NETWORK_GATEWAY:END

# VPN_GATEWAY_CONNECTION:START

rg_pri_ziraatag_vngc_policy_dh_group       = "DHGroup14"
rg_pri_ziraatag_vngc_policy_ike_encryption = "AES256"
rg_pri_ziraatag_vngc_policy_ike_integrity  = "SHA256"

rg_pri_ziraatag_vngc_policy_ipsec_encryption = "AES256"
rg_pri_ziraatag_vngc_policy_ipsec_integrity  = "SHA256"
rg_pri_ziraatag_vngc_policy_pfs_group        = "PFS2048"

rg_pri_ziraatag_vngc_policy_sa_lifetime_sec = "28800"
rg_pri_ziraatag_vngc_policy_sa_datasize_kb  = "102400000"

rg_sec_ziraatag_vngc_policy_dh_group       = "DHGroup14"
rg_sec_ziraatag_vngc_policy_ike_encryption = "AES256"
rg_sec_ziraatag_vngc_policy_ike_integrity  = "SHA256"

rg_sec_ziraatag_vngc_policy_ipsec_encryption = "AES256"
rg_sec_ziraatag_vngc_policy_ipsec_integrity  = "SHA256"
rg_sec_ziraatag_vngc_policy_pfs_group        = "PFS2048"

rg_sec_ziraatag_vngc_policy_sa_lifetime_sec = "28800"
rg_sec_ziraatag_vngc_policy_sa_datasize_kb  = "102400000"

# VPN_GATEWAY_CONNECTION:END


# APPLICATION_GATEWAY:START 

rg_pri_wef_agw_sku_name = "WAF_v2"

rg_pri_wef_agw_sku_tier = "WAF_v2"

rg_pri_wef_agw_sku_capacity = 4

rg_pri_wef_agw_waf_configuration_firewall_mode = "Detection"

rg_pri_wef_agw_autoscale_min_capacity = 1

rg_pri_wef_agw_autoscale_max_capacity = 7

rg_sec_wef_agw_sku_name = "WAF_v2"

rg_sec_wef_agw_sku_tier = "WAF_v2"

rg_sec_wef_agw_sku_capacity = 4

rg_sec_wef_agw_waf_configuration_firewall_mode = "Detection"

rg_sec_wef_agw_autoscale_min_capacity = 1

rg_sec_wef_agw_autoscale_max_capacity = 7

# APPLICATION_GATEWAY:END

# ACME_REGISTRATION: START

acme_reg_email_address = "ssladmin@veripark.com"

# ACME_REGISTRATION: END

## AKS Start ##
wl_aks_default_pool_node_count    = "3"
wl_aks_worker_pool_node_count     = "2"
wl_aks_worker_pool_min_node_count = "2"
wl_aks_worker_pool_max_node_count = "3"
wl_aks_agent_pool_min_node_count  = "3"
wl_aks_agent_pool_max_node_count  = "4"
wl_aks_pod_cidr                   = "10.244.0.0/16"
wl_aks_service_cidr               = "10.0.0.0/16"
wl_aks_pod_count_per_node         = "250"
wl_aks_os_disk_size_gb            = "128"
wl_aks_vm_size                    = "Standard_D4s_v5"
wl_aks_zones                      = [1, 2, 3] #this will be [1, 2, 3] in the production environment
## AKS End ##


# FIREWALL:START

rg_pri_frw_sku_name = "AZFW_VNet"
rg_pri_frw_sku_tier = "Standard"

#--

rg_sec_frw_sku_name = "AZFW_VNet"
rg_sec_frw_sku_tier = "Standard"

# FIREWALL:END

#Ziraat Bank Hermes API IP 

ziraat_de_hermes_api_ip = "10.10.120.121"

# MAINTENANCE_CONFIGURATION:START
  
maintenance_configuration_start_time = "2024-08-30 02:00"
 
# MAINTENANCE_CONFIGURATION:END