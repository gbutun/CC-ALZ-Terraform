
resource "azurerm_network_security_rule" "rg_pri_hub_vn_jmb_sub_nsg_agent_vm_rdp_inbound_rule" {
  name                        = "vrp-agent-vm-jmp-box-rdp-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_jmb_sub_nsg.name
  description                 = "Allow VeriPark Agent VM IPs RDP Inbound Rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = local.vrp_agent_vm_ips
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_hub_vn_jmb_sub_nsg_vnet_deny_inbound_rule" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_jmb_sub_nsg.name
  description                 = "Deny VNET Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}

# TODO : Restrict the inbound traffic to Gateway Subnet as Destination in future when VPN is in use.
resource "azurerm_network_security_rule" "rg_pri_hub_vn_wef_agw_sub_nsg_vnet_internet_inbound_rule" {
  name                        = "wef-agw-int-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW Inbound for Internet"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefix     = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_hub_vn_wef_agw_sub_nsg_vnet_bank_server_inbound_rule" {
  name                        = "wef-agw-bank-pe-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW Inbound for ziraatbank App Servers"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["4443","8443"]
  source_address_prefixes     = var.ziraatbank_servers
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_hub_vn_wef_agw_sub_nsg_vnet_mng_inbound_rule" {
  name                        = "wef-agw-mng-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW GatewayManager Inbound"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["65200-65535"]
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_hub_vn_wef_agw_sub_nsg_vnet_alb_inbound_rule" {
  name                        = "wef-agw-alb-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW AzureLoadBalancer Inbound"
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_hub_vn_wef_agw_sub_nsg_vnet_vrp_inbound_rule" {
  name                        = "wef-agw-vrp-pe-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW Inbound for VeriPark"
  priority                    = 500
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["4443"]
  source_address_prefixes     = local.vrp_infra_management_ips
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_hub_vn_wef_agw_sub_nsg_vnet_atm_inbound_rule" {
  name                        = "wef-agw-atm-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW AzureTrafficManager Inbound"
  priority                    = 600
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureTrafficManager"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_hub_vn_wef_agw_sub_nsg_vnet_deny_inbound_rule" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_hub_vn_wef_agw_sub_nsg.name
  description                 = "Deny WEF AGW All Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_sql_pe_int_sub_nsg_vnet_workload_inbound_rule" {
  name                         = "pe-int-sub-wl-ir"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  network_security_group_name  = azurerm_network_security_group.rg_pri_spk_vn_sql_pe_int_sub_nsg.name
  description                  = "SQL PE Integration Subnet Inbound Rule"
  priority                     = 100
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "1433"
  source_address_prefix        = azurerm_subnet.rg_pri_spk_vn_wl_sub.address_prefixes[0]
  destination_address_prefix = azurerm_subnet.rg_pri_spk_vn_sql_pe_int_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_sql_pe_int_sub_nsg_vnet_rls_inbound_rule" {
  name                         = "pe-int-sub-rls-ir"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  network_security_group_name  = azurerm_network_security_group.rg_pri_spk_vn_sql_pe_int_sub_nsg.name
  description                  = "SQL PE Integration Subnet Inbound Rule"
  priority                     = 200
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "1433"
  source_address_prefix        = azurerm_subnet.rg_pri_spk_vn_rls_sub.address_prefixes[0]
  destination_address_prefix = azurerm_subnet.rg_pri_spk_vn_sql_pe_int_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_sql_pe_int_sub_nsg_vnet_deny_inbound_rule" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_sql_pe_int_sub_nsg.name
  description                 = "Deny VNET Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_rls_sub_nsg_jmb_rdp_inbound_rule" {
  name                        = "rls-vm-rdp-jmb-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_rls_sub_nsg.name
  description                 = "Release Subnet RDP Inbound Rule for Jumpbox"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = azurerm_network_interface.rg_pri_jmb_vm_pub_nic.private_ip_address
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_rls_sub_nsg_vnet_deny_inbound_rules" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_rls_sub_nsg.name
  description                 = "Deny VNET Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_wl_sub_nsg_internal_inbound_rule" {
  name                        = "wl-sub-internal-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for internal communication for AKS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = azurerm_subnet.rg_pri_spk_vn_wl_sub.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.rg_pri_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_wl_sub_nsg_rls_inbound_rule" {
  name                        = "wl-sub-rls-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for Release server on specific ports"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges      = ["80", "443", "6443", "8080", "9090", "15672", "20001"]
  source_address_prefix       = azurerm_subnet.rg_pri_spk_vn_rls_sub.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.rg_pri_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_wl_sub_nsg_lb_inbound_rule" {
  name                        = "wl-sub-lb-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for Load Balancer"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range     = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = azurerm_subnet.rg_pri_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_wl_sub_nsg_aks_required_inbound_rule" {
  name                        = "pod-cidr-wl-sub-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for AKS CIDR "
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.wl_aks_pod_cidr
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_wl_sub_nsg_pod_cidr_inbound_rule" {
  name                        = "wl-sub-pod-cidr-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for AKS CIDR "
  priority                    = 500
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = azurerm_subnet.rg_pri_spk_vn_wl_sub.address_prefixes[0]
  destination_address_prefix  = var.wl_aks_pod_cidr
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_agw_sub_wl_sub_inbound_rule" {
  name                        = "agw-sub-wl-sub-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for AGW Subnet "
  priority                    = 600
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefix       = azurerm_subnet.rg_pri_hub_vn_wef_agw_sub.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.rg_pri_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_wl_sub_nsg_sec_rls_inbound_rule" {
  name                        = "wl-sub-sec-rls-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for Release server on specific ports"
  priority                    = 700
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges      = ["80", "443", "6443", "8080", "9090", "15672", "20001"]
  source_address_prefix       = azurerm_subnet.rg_sec_spk_vn_rls_sub.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.rg_pri_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_pri_spk_vn_wl_sub_nsg_vnet_deny_inbound_rules" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_pri.name
  network_security_group_name = azurerm_network_security_group.rg_pri_spk_vn_wl_sub_nsg.name
  description                 = "Deny VNET Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}

#--

resource "azurerm_network_security_rule" "rg_sec_hub_vn_jmb_sub_nsg_agent_vm_rdp_inbound_rule" {
  name                        = "vrp-agent-vm-jmp-box-rdp-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_jmb_sub_nsg.name
  description                 = "Allow VeriPark Agent VM IPs RDP Inbound Rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = local.vrp_agent_vm_ips
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_hub_vn_jmb_sub_nsg_vnet_deny_inbound_rule" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_jmb_sub_nsg.name
  description                 = "Deny VNET Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}

# TODO : Restrict the inbound traffic to Gateway Subnet as Destination in future when VPN is in use.
resource "azurerm_network_security_rule" "rg_sec_hub_vn_wef_agw_sub_nsg_vnet_internet_inbound_rule" {
  name                        = "wef-agw-int-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW Inbound for Internet"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefix     = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_hub_vn_wef_agw_sub_nsg_vnet_bank_server_inbound_rule" {
  name                        = "wef-agw-bank-pe-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW Inbound for ziraatbank App Servers"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["4443","8443"]
  source_address_prefixes     = var.ziraatbank_servers
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_hub_vn_wef_agw_sub_nsg_vnet_mng_inbound_rule" {
  name                        = "wef-agw-mng-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW GatewayManager Inbound"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["65200-65535"]
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_hub_vn_wef_agw_sub_nsg_vnet_alb_inbound_rule" {
  name                        = "wef-agw-alb-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW AzureLoadBalancer Inbound"
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_hub_vn_wef_agw_sub_nsg_vnet_vrp_inbound_rule" {
  name                        = "wef-agw-vrp-pe-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW Inbound for VeriPark"
  priority                    = 500
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["4443"]
  source_address_prefixes     = local.vrp_infra_management_ips
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_hub_vn_wef_agw_sub_nsg_vnet_atm_inbound_rule" {
  name                        = "wef-agw-atm-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.name
  description                 = "Allow WEF AGW AzureTrafficManager Inbound"
  priority                    = 600
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureTrafficManager"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_hub_vn_wef_agw_sub_nsg_vnet_deny_inbound_rule" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_hub_vn_wef_agw_sub_nsg.name
  description                 = "Deny WEF AGW All Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_sql_pe_int_sub_nsg_vnet_workload_inbound_rule" {
  name                         = "pe-int-sub-wl-ir"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  network_security_group_name  = azurerm_network_security_group.rg_sec_spk_vn_sql_pe_int_sub_nsg.name
  description                  = "SQL PE Integration Subnet Inbound Rule"
  priority                     = 100
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "1433"
  source_address_prefix        = azurerm_subnet.rg_sec_spk_vn_wl_sub.address_prefixes[0]
  destination_address_prefix = azurerm_subnet.rg_sec_spk_vn_sql_pe_int_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_sql_pe_int_sub_nsg_vnet_rls_inbound_rule" {
  name                         = "pe-int-sub-rls-ir"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  network_security_group_name  = azurerm_network_security_group.rg_sec_spk_vn_sql_pe_int_sub_nsg.name
  description                  = "SQL PE Integration Subnet Inbound Rule"
  priority                     = 200
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "1433"
  source_address_prefix        = azurerm_subnet.rg_sec_spk_vn_rls_sub.address_prefixes[0]
  destination_address_prefix = azurerm_subnet.rg_sec_spk_vn_sql_pe_int_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_sql_pe_int_sub_nsg_vnet_deny_inbound_rule" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_sql_pe_int_sub_nsg.name
  description                 = "Deny VNET Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_rls_sub_nsg_vnet_deny_inbound_rules" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_rls_sub_nsg.name
  description                 = "Deny VNET Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_wl_sub_nsg_internal_inbound_rule" {
  name                        = "wl-sub-internal-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for internal communication for AKS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = azurerm_subnet.rg_sec_spk_vn_wl_sub.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.rg_sec_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_wl_sub_nsg_rls_inbound_rule" {
  name                        = "wl-sub-rls-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for Release server on specific ports"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges      = ["80", "443", "6443", "8080", "9090", "15672", "20001"]
  source_address_prefix       = azurerm_subnet.rg_pri_spk_vn_rls_sub.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.rg_sec_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_wl_sub_nsg_sec_rls_inbound_rule" {
  name                        = "wl-sub-sec-rls-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for Secondary Release server on specific ports"
  priority                    = 700
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges      = ["80", "443", "6443", "8080", "9090", "15672", "20001"]
  source_address_prefix       = azurerm_subnet.rg_sec_spk_vn_rls_sub.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.rg_sec_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_wl_sub_nsg_lb_inbound_rule" {
  name                        = "wl-sub-lb-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for Load Balancer"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range     = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = azurerm_subnet.rg_sec_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_wl_sub_nsg_aks_required_inbound_rule" {
  name                        = "pod-cidr-wl-sub-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for AKS CIDR "
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.wl_aks_pod_cidr
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_wl_sub_nsg_pod_cidr_inbound_rule" {
  name                        = "wl-sub-pod-cidr-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for AKS CIDR "
  priority                    = 500
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = azurerm_subnet.rg_sec_spk_vn_wl_sub.address_prefixes[0]
  destination_address_prefix  = var.wl_aks_pod_cidr
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_agw_sub_wl_sub_inbound_rule" {
  name                        = "agw-sub-wl-sub-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.name
  description                 = "Allow inbound rule for AGW Subnet "
  priority                    = 600
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefix       = azurerm_subnet.rg_sec_hub_vn_wef_agw_sub.address_prefixes[0]
  destination_address_prefix  = azurerm_subnet.rg_sec_spk_vn_wl_sub.address_prefixes[0]
}

resource "azurerm_network_security_rule" "rg_sec_spk_vn_wl_sub_nsg_vnet_deny_inbound_rules" {
  name                        = "deny-ir"
  resource_group_name         = azurerm_resource_group.rg_sec.name
  network_security_group_name = azurerm_network_security_group.rg_sec_spk_vn_wl_sub_nsg.name
  description                 = "Deny VNET Inbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}