locals {
  firewall_target_fqdns_devops                  = ["*.microsoft.com","*.windows.net","vstsagentpackage.azureedge.net","*.hashicorp.com","hashicorp.com","github.com","registry.terraform.io","office.com","login.microsoftonline.com","*.vssps.visualstudio.com","${var.devops_organization_name}.visualstudio.com","${var.devops_organization_name}.vsrm.visualstudio.com","${var.devops_organization_name}.pkgs.visualstudio.com","${var.devops_organization_name}.vssps.visualstudio.com","dev.azure.com","*.dev.azure.com","management.core.windows.net","*.blob.core.windows.net","api.appcenter.ms","rink.hockeyapp.net","onegetcdn.azureedge.net","powershellgallery.com","*.powershellgallery.com","psg-prod-eastus.azureedge.net","*.msauth.net","*.msftauth.net","*.blob.officehome.msocdn.com","management.azure.com","msftconnecttest.com","login.windows.net","www.nuget.org","*.nuget.org","acs-mirror.azureedge.net","*.azure.com","kubernetes.azure.com","*.data.mcr.microsoft.com","*.githubusercontent.com"]
  firewall_target_fqdns_certificate             = ["*.comodoca.com","*.sectigo.com","sectigo.com","*.digicert.com","*.microsoft.com","*.verisign.com","globalsign.com","*.letsencrypt.org","*.comodo.com","comodo.com","comodoca.com","crl.identrust.com","*.globalsign.com","usertrust.com","*.usertrust.com"]
  firewall_target_fqdns_vm                      = ["self.events.data.microsoft.com","umwatson.events.data.microsoft.com","scadvisorcontent.blob.core.windows.net","config.edge.skype.com","ecs.office.com","*.wdcp.microsoft.com","*.wdcpalt.microsoft.com","*.wd.microsoft.com","*.update.microsoft.com","*.delivery.mp.microsoft.com","*.windowsupdate.com","*.download.microsoft.com","*.download.windowsupdate.com","client.wns.windows.com","clients.config.office.net","business.bing.com","*.table.core.windows.net","eafc.nelreports.net","pas.windows.net","v20.events.data.microsoft.com","enterpriseregistration.windows.net","identity.nel.measure.office.net","outlook.office365.com","update.googleapis.com","*.microsoft.com","*.msftauth.net","*.msauth.net","nav.smartscreen.microsoft.com","bzib.nelreports.net","edge-consumer-static.azureedge.net","microsoft.com","afd-v2.hosting.portal.azure.net","xpaywalletcdn.azureedge.net","reactblade.portal.azure.net","*.reactblade.portal.azure.net","edge-mobile-static.azureedge.net","aadcdn.msauthimages.net","aadcdn.msftauthimages.net","www.bing.com","dl.k8s.io","ntp.msn.com","api.aadrm.com","edgeassetservice.azureedge.net","arc.msn.com","office365.com ","cxcs.microsoft.net","cdn.vsassets.io","nleditor.osi.office.net","ms.gallery.vsassets.io","*.azurecr.io","azure.github.io","*.portal.azure.net","login.microsoftonline.com","autologon.microsoftazuread-sso.com"]
  firewall_target_fqdns_verichannel_integration = ["service-afdirect.postdirekt.de", "y.postaguvercini.com", "rest.messagebird.com", "webid-gateway.de", "api.identify24.de","eu.sms.api.sinch.com","vt-zag.crm4.dynamics.com", "xmlapi.mobildev.com"]
  firewall_target_fqdns_kubernetes_operations   = ["quay.io","*.quay.io","registry.access.redhat.com","access.cdn.redhat.com","docker.io","github.io","azure.github.io","github.com","hub.docker.com","registry-1.docker.io","auth.docker.io","production.cloudflare.docker.com","ghcr.io","*.githubusercontent.com","identity.nel.measure.office.net","bzib.nelreports.net","edge-consumer-static.azureedge.net", "microsoft.com", "afd-v2.hosting.portal.azure.net","xpaywalletcdn.azureedge.net","reactblade.portal.azure.net","*.reactblade.portal.azure.net","edge-http.microsoft.com", "edge-mobile-static.azureedge.net", "aadcdn.msauthimages.net","aadcdn.msftauthimages.net", "www.bing.com"]
                                                  
  firewall_target_adcon_api_fqdns_verichannel_integration = ["api.ad-con.de"]
  firewall_target_smtp_fqdns                    = ["smtp.office365.com"]
}

resource "azurerm_firewall_application_rule_collection" "rg_pri_frw_app_rl_cl_01" {
  name                = "microsoft-based-app-rule-collection-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_pri_frw.name
  resource_group_name = azurerm_resource_group.rg_pri.name
  priority            = 100
  action              = "Allow"
  rule {
    name             = "windows-os-required-rules"
    source_addresses = [var.rg_pri_hub_vn_address_space, var.rg_pri_spk_vn_address_space]
    fqdn_tags        = ["WindowsUpdate", "WindowsDiagnostics", "MicrosoftActiveProtectionService"]
    description      = "Windows OS Required Application Rules"
  }

  rule {
    name             = "windows-vm-rules"
    source_addresses = [var.rg_pri_hub_vn_address_space, var.rg_pri_spk_vn_address_space]
    target_fqdns     = local.firewall_target_fqdns_vm
    protocol {
      port = "443"
      type = "Https"
    }
  }

  rule {
    name             = "k8s-rules"
    source_addresses = [var.rg_pri_spk_vn_wl_sub_address_space]
    target_fqdns     = local.firewall_target_fqdns_kubernetes_operations
    protocol {
      port = "443"
      type = "Https"
    }
  }

  rule {
    name             = "k8s-smtp-rules"
    source_addresses = [var.rg_pri_spk_vn_wl_sub_address_space]
    target_fqdns     = local.firewall_target_smtp_fqdns
    protocol {
      port = "587"
      type = "Https"
    }
  }

  rule {
    name             = "kubernetes-rules"
    source_addresses = [var.rg_pri_spk_vn_wl_sub_address_space]
    fqdn_tags        = ["AzureKubernetesService"]
    description      = "Kubernetes Required FQDN Tag Rules for AKS Cluster"
  }
}

resource "azurerm_firewall_application_rule_collection" "rg_pri_frw_app_rl_cl_02" {
  name                = "devops-based-app-rule-collection-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_pri_frw.name
  resource_group_name = azurerm_resource_group.rg_pri.name
  priority            = 110
  action              = "Allow"
  rule {
    name             = "microsoft-devops-rules"
    source_addresses = [var.rg_pri_spk_vn_rls_sub_address_space]
    target_fqdns     = local.firewall_target_fqdns_devops
    protocol {
      port = "443"
      type = "Https"
    }
  }
}

resource "azurerm_firewall_application_rule_collection" "rg_pri_frw_app_rl_cl_03" {
  name                = "certificate-based-app-rule-collection-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_pri_frw.name
  resource_group_name = azurerm_resource_group.rg_pri.name
  priority            = 130
  action              = "Allow"

  rule {
    name             = "certificate-http-rules"
    source_addresses = [var.rg_pri_hub_vn_address_space, var.rg_pri_spk_vn_address_space]
    target_fqdns     = local.firewall_target_fqdns_certificate
    protocol {
      port = "80"
      type = "Http"
    }
    
    protocol {
      port = "443"
      type = "Https"
    }
  }
}

resource "azurerm_firewall_application_rule_collection" "rg_pri_frw_app_rl_cl_04" {
  name                = "verichannel-integration-rule-collection-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_pri_frw.name
  resource_group_name = azurerm_resource_group.rg_pri.name
  priority            = 140
  action              = "Allow"
  rule {
    name             = "app-integration-https-rules"
    source_addresses = [var.rg_pri_hub_vn_address_space, var.rg_pri_spk_vn_address_space]
    target_fqdns     = local.firewall_target_fqdns_verichannel_integration
    protocol {
      port = "443"
      type = "Https"
    }
  }

  rule {
    name             = "adcon-api-integration-https-rules"
    source_addresses = [var.rg_pri_hub_vn_address_space, var.rg_pri_spk_vn_address_space]
    target_fqdns     = local.firewall_target_adcon_api_fqdns_verichannel_integration
    protocol {
      port = "9091"
      type = "Https"
    }
  }
}

#--

resource "azurerm_firewall_application_rule_collection" "rg_sec_frw_app_rl_cl_01" {
  name                = "microsoft-based-app-rule-collection-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_sec_frw.name
  resource_group_name = azurerm_resource_group.rg_sec.name
  priority            = 100
  action              = "Allow"
  rule {
    name             = "windows-os-required-rules"
    source_addresses = [var.rg_sec_hub_vn_address_space, var.rg_sec_spk_vn_address_space]
    fqdn_tags        = ["WindowsUpdate", "WindowsDiagnostics", "MicrosoftActiveProtectionService"]
    description      = "Windows OS Required Application Rules"
  }

  rule {
    name             = "windows-vm-rules"
    source_addresses = [var.rg_sec_hub_vn_address_space, var.rg_sec_spk_vn_address_space]
    target_fqdns     = local.firewall_target_fqdns_vm
    protocol {
      port = "443"
      type = "Https"
    }
  }

  rule {
    name             = "k8s-rules"
    source_addresses = [var.rg_sec_spk_vn_wl_sub_address_space]
    target_fqdns     = local.firewall_target_fqdns_kubernetes_operations
    protocol {
      port = "443"
      type = "Https"
    }
  }

  rule {
    name             = "k8s-smtp-rules"
    source_addresses = [var.rg_sec_spk_vn_wl_sub_address_space]
    target_fqdns     = local.firewall_target_smtp_fqdns
    protocol {
      port = "587"
      type = "Https"
    }
  }

  rule {
    name             = "kubernetes-rules"
    source_addresses = [var.rg_sec_spk_vn_wl_sub_address_space]
    fqdn_tags        = ["AzureKubernetesService"]
    description      = "Kubernetes Required FQDN Tag Rules for AKS Cluster"
  }
}

resource "azurerm_firewall_application_rule_collection" "rg_sec_frw_app_rl_cl_02" {
  name                = "devops-based-app-rule-collection-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_sec_frw.name
  resource_group_name = azurerm_resource_group.rg_sec.name
  priority            = 110
  action              = "Allow"
  rule {
    name             = "microsoft-devops-rules"
    source_addresses = [var.rg_sec_spk_vn_rls_sub_address_space]
    target_fqdns     = local.firewall_target_fqdns_devops
    protocol {
      port = "443"
      type = "Https"
    }
  }
}

resource "azurerm_firewall_application_rule_collection" "rg_sec_frw_app_rl_cl_03" {
  name                = "certificate-based-app-rule-collection-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_sec_frw.name
  resource_group_name = azurerm_resource_group.rg_sec.name
  priority            = 130
  action              = "Allow"

  rule {
    name             = "certificate-http-rules"
    source_addresses = [var.rg_sec_hub_vn_address_space, var.rg_sec_spk_vn_address_space]
    target_fqdns     = local.firewall_target_fqdns_certificate
    protocol {
      port = "80"
      type = "Http"
    }
    
    protocol {
      port = "443"
      type = "Https"
    }
  }

  rule {
    name             = "certificate-https-rules"
    source_addresses = [var.rg_sec_hub_vn_address_space, var.rg_sec_spk_vn_address_space]
    target_fqdns     = local.firewall_target_fqdns_certificate
    protocol {
      port = "443"
      type = "Https"
    }
  }
}

resource "azurerm_firewall_application_rule_collection" "rg_sec_frw_app_rl_cl_04" {
  name                = "verichannel-integration-rule-collection-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_sec_frw.name
  resource_group_name = azurerm_resource_group.rg_sec.name
  priority            = 140
  action              = "Allow"
  rule {
    name             = "app-integration-https-rules"
    source_addresses = [var.rg_sec_hub_vn_address_space, var.rg_sec_spk_vn_address_space]
    target_fqdns     = local.firewall_target_fqdns_verichannel_integration
    protocol {
      port = "443"
      type = "Https"
    }
  }
  
  rule {
    name             = "adcon-api-integration-https-rules"
    source_addresses = [var.rg_sec_hub_vn_address_space, var.rg_sec_spk_vn_address_space]
    target_fqdns     = local.firewall_target_adcon_api_fqdns_verichannel_integration
    protocol {
      port = "9091"
      type = "Https"
    }
  }
}