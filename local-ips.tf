locals {
  vrp_ist_new_ip_02    = "195.142.5.128/26"
  vrp_karachi_ip_02    = "103.53.44.42/32"
  vrp_bangalore_ip_03  = "14.98.177.252/32"
  vrp_london_ip_04     = "62.30.150.157/32"
  z5b_devops_org_ip_05 = "20.166.41.0/24"
  vrp_con_reg_ip_02    = "51.116.254.129/32"
  vrp_con_reg_ip_03    = "51.116.254.130/32"
  vrp_con_reg_ip_04    = "51.116.254.131/32"
  vrp_con_reg_ip_05    = "51.116.254.132/32"

  devops_svc_out_ip_01    = "13.107.6.0/24"
  devops_svc_out_ip_02    = "13.107.9.0/24"
  devops_svc_out_ip_03    = "13.107.42.0/24"
  devops_svc_out_ip_04    = "13.107.43.0/24"
  devops_svc_out_ip_05_ne = "20.166.41.0/24"
  #   saas_agent_vm_07_pip_01  = "40.127.185.172/32"
  #   saas_agent_vm_09_pip_01  = "40.127.190.241/32"

  vrp_infra_management_ips = [
    local.vrp_ist_new_ip_02,
    local.vrp_karachi_ip_02,
    local.vrp_bangalore_ip_03,
    local.vrp_london_ip_04
  ]

  vrp_ips = [

  ]

  vrp_devops_ips = [
    local.vrp_ist_new_ip_02,
  ]

  z5b_devops_org_ips = [
    local.z5b_devops_org_ip_05
  ]

  saas_agent_vm_01_pip_01 = "13.79.135.83"    # {"VMOwner":osman.shener@veripark.com,"VMNo":"1"} mng
  saas_agent_vm_02_pip_01 = "13.79.158.127"   # {"VMOwner":ognyan.marinov@veripark.com,"VMNo":"2"} mng
  saas_agent_vm_03_pip_01 = "137.135.223.124" # {"VMOwner":petar.raykovski@veripark.com,"VMNo":"3"} ag
  saas_agent_vm_04_pip_01 = "40.69.63.157"    # {"VMOwner":dimitar.amudzhev@veripark.com,"VMNo":"6"} ag
  #saas_agent_vm_05_pip_01 = "40.127.190.249"  # {"VMOwner":timucin.dursun@veripark.com,"VMNo":"8"} mng
  #saas_agent_vm_06_pip_01 = "40.127.187.251"  # {"VMOwner":gcakiroglu@veripark.com,"VMNo":"10"} mng
  saas_agent_vm_07_pip_01 = "40.115.110.4"    # {"VMOwner":boyan.georgiev@veripark.com,"VMNo":"12"} ag
  saas_agent_vm_08_pip_01 = "137.135.211.249" # {"VMOwner":shaik.jabbar@veripark.com,"VMNo":"16"} ag
  #saas_agent_vm_09_pip_01 = "52.178.185.101"  # {"VMOwner":mmarkaryan@veripark.com,"VMNo":"17"} mng
  saas_agent_vm_10_pip_01 = "40.127.185.172" # {"VMOwner":berkay.erkoy@veripark.com,"VMNo":"7"} mng
  saas_agent_vm_11_pip_01 = "40.127.190.241" # {"VMOwner":burak.gonuldas@veripark.com,"VMNo":"9"} mng
  saas_agent_vm_12_pip_01 = "20.223.185.78"  # {"VMOwner":Faheem.Ullah@veripark.com,"VMNo":"19"} mng
  #saas_agent_vm_13_pip_01 = "40.115.100.211"  #{"VMOwner":"Kamuran.Ersoy@veripark.com","VMNo":"13"}
  saas_agent_vm_14_pip_01 = "137.116.247.137" #{"VMOwner":"antonio.yordanov@veripark.com","VMNo":"14"}
  saas_agent_vm_15_pip_01 = "40.85.142.41"    #{"VMOwner":"nagaraju.nagula@veripark.com","VMNo":"15"}
  saas_agent_vm_16_pip_01 = "20.223.244.18"   #{"VMOwner":"nikola.georev@veripark.com","VMNo":"18"}
  saas_agent_vm_17_pip_01 = "20.223.135.247"  #{"VMOwner":"martin.hadzhiev@veripark.com","VMNo":"20"}
  #saas_agent_vm_18_pip_01 = "104.45.82.98"    #{"VMOwner":"musa.karakelle@veripark.com","VMNo":"21"}
  saas_agent_vm_19_pip_01 = "68.219.90.115"   #{"VMOwner":"kaan.ozkordag@veripark.com","VMNo":"22"}
  saas_agent_vm_20_pip_01 = "137.135.226.179" #{"VMOwner":"peycho.kostadinov@veripark.com","VMNo":"5"}
  saas_agent_vm_21_pip_01 = "13.79.244.83"    #{"VMOwner":"radoslav.dokuzov@veripark.com","VMNo":"11"}
  saas_agent_vm_23_pip_01 = "52.169.200.187"  #{"VMOwner":"gokhan.askin@veripark.com","VMNo":"23"}
  saas_agent_vm_24_pip_01 = "40.69.218.103"   #{"VMOwner":"alperen.yilmaz@veripark.com","VMNo":"24"}


  vrp_agent_vm_ips = [
    local.saas_agent_vm_01_pip_01,
    local.saas_agent_vm_02_pip_01,
    local.saas_agent_vm_03_pip_01,
    local.saas_agent_vm_04_pip_01,
    local.saas_agent_vm_07_pip_01,
    local.saas_agent_vm_08_pip_01,
    local.saas_agent_vm_10_pip_01,
    local.saas_agent_vm_11_pip_01,
    local.saas_agent_vm_12_pip_01,
    local.saas_agent_vm_14_pip_01,
    local.saas_agent_vm_15_pip_01,
    local.saas_agent_vm_16_pip_01,
    local.saas_agent_vm_17_pip_01,
    local.saas_agent_vm_19_pip_01,
    local.saas_agent_vm_20_pip_01,
    local.saas_agent_vm_21_pip_01,
    local.saas_agent_vm_23_pip_01,
    local.saas_agent_vm_24_pip_01
  ]


  devops_svc_out_ip_addresses = [
    local.devops_svc_out_ip_01,
    local.devops_svc_out_ip_02,
    local.devops_svc_out_ip_03,
    local.devops_svc_out_ip_04,
    local.devops_svc_out_ip_05_ne
  ]

  vrp_all_ips = concat(local.vrp_infra_management_ips, local.vrp_ips)

  vrp_infra_management_ips_for_sa = [for ip in local.vrp_infra_management_ips : replace(ip, "/32", "")]
  vrp_ips_for_sa                  = [for ip in local.vrp_ips : replace(ip, "/32", "")]
  vrp_all_ips_for_sa              = [for ip in local.vrp_all_ips : replace(ip, "/32", "")]

}
