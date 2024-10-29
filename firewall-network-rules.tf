locals {
  asp_monitoring_ips = []
}

resource "azurerm_firewall_network_rule_collection" "rg_pri_frw_nr_01" {
  name                = "allow-ntp-nr-01-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_pri_frw.name
  resource_group_name = azurerm_resource_group.rg_pri.name
  priority            = 100
  action              = "Allow"

  rule {
    name                  = "ntp-rules"
    source_addresses      = ["*"]
    destination_ports     = ["123"]
    destination_addresses = ["*"]
    protocols             = ["Any"]
  }

  rule {
    name                  = "devops-rules-westeurope"
    source_addresses      = ["*"]
    destination_ports     = ["*"]
    destination_addresses = ["40.74.28.0/23"]
    protocols             = ["Any"]
  }

  rule {
    name                  = "auto-update-rules"
    source_addresses      = ["*"]
    destination_ports     = ["443"]
    destination_addresses = ["GuestAndHybridManagement", "AzureMonitor"]
    protocols             = ["Any"]
  }
}

#--

resource "azurerm_firewall_network_rule_collection" "rg_sec_frw_nr_01" {
  name                = "allow-ntp-nr-01-${var.product_unique}"
  azure_firewall_name = azurerm_firewall.rg_sec_frw.name
  resource_group_name = azurerm_resource_group.rg_sec.name
  priority            = 100
  action              = "Allow"

  rule {
    name                  = "ntp-rules"
    source_addresses      = ["*"]
    destination_ports     = ["123"]
    destination_addresses = ["*"]
    protocols             = ["Any"]
  }

  rule {
    name                  = "devops-rules-northeurope"
    source_addresses      = ["*"]
    destination_ports     = ["*"]
    destination_addresses = ["40.74.28.0/23"]
    protocols             = ["Any"]
  }

  rule {
    name                  = "auto-update-rules"
    source_addresses      = ["*"]
    destination_ports     = ["443"]
    destination_addresses = ["GuestAndHybridManagement", "AzureMonitor"]
    protocols             = ["Any"]
  }
}