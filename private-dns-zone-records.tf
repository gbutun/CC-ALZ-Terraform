locals {

    rg_pri_argo_cd_url = "${azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name}-argocd.${var.kub_mng_domain_name_suffix}"
    rg_sec_argo_cd_url = "${azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name}-argocd.${var.kub_mng_domain_name_suffix}"

}

data "azurerm_private_dns_a_record" "rg_pri_wl_aks_cl_internal_ip" {
  name                = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.name
  zone_name           = azurerm_private_dns_zone.rg_pri_prv_dns_zone_privatelink_azmk8s_io.name
  resource_group_name = azurerm_resource_group.rg_pri.name
}

resource "azurerm_private_dns_a_record" "rg_pri_pub_dns_zone_rg_pri_mb_app" {
  name                = replace(local.app_custom_domains.hermes_api, ".${azurerm_private_dns_zone.rg_pri_prv_dns_zone_ziraatbank_de.name}", "")
  zone_name           = azurerm_private_dns_zone.rg_pri_prv_dns_zone_ziraatbank_de.name
  resource_group_name = azurerm_resource_group.rg_pri.name
  ttl                 = local.zone_records.app.ttl
  records              = [var.ziraat_de_hermes_api_ip]
}

resource "azurerm_private_dns_a_record" "rg_pri_prv_dns_zone_octupus_saas_veripark_com_argo_cd_api" {
  name                = replace(local.rg_pri_argo_cd_url, ".${azurerm_private_dns_zone.rg_pri_prv_dns_zone_octupus_saas_veripark_com.name}", "")
  zone_name           = azurerm_private_dns_zone.rg_pri_prv_dns_zone_octupus_saas_veripark_com.name
  resource_group_name = azurerm_resource_group.rg_pri.name
  ttl                 = local.zone_records.app.ttl
  records             = [data.azurerm_lb.rg_pri_wl_aks_cl_pvt_lb.private_ip_address]
}


#RG-02

data "azurerm_private_dns_a_record" "rg_sec_wl_aks_cl_internal_ip" {
  name                = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.name
  zone_name           = azurerm_private_dns_zone.rg_sec_prv_dns_zone_privatelink_azmk8s_io.name
  resource_group_name = azurerm_resource_group.rg_sec.name
}


resource "azurerm_private_dns_a_record" "rg_sec_pub_dns_zone_rg_sec_mb_app" {
  name                = replace(local.app_custom_domains.hermes_api, ".${azurerm_private_dns_zone.rg_sec_prv_dns_zone_ziraatbank_de.name}", "")
  zone_name           = azurerm_private_dns_zone.rg_sec_prv_dns_zone_ziraatbank_de.name
  resource_group_name = azurerm_resource_group.rg_sec.name
  ttl                 = local.zone_records.app.ttl
  records              = [var.ziraat_de_hermes_api_ip]
}

resource "azurerm_private_dns_a_record" "rg_sec_prv_dns_zone_octupus_saas_veripark_com_argo_cd_api" {
  name                = replace(local.rg_sec_argo_cd_url, ".${azurerm_private_dns_zone.rg_sec_prv_dns_zone_octupus_saas_veripark_com.name}", "")
  zone_name           = azurerm_private_dns_zone.rg_sec_prv_dns_zone_octupus_saas_veripark_com.name
  resource_group_name = azurerm_resource_group.rg_sec.name
  ttl                 = local.zone_records.app.ttl
  records             = [data.azurerm_lb.rg_sec_wl_aks_cl_pvt_lb.private_ip_address]
}



