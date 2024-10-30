resource "azurerm_route_table" "rg_pri_hub_vn_jmb_sub_rt" {
  name                          = "${local.resource_prefix_rg_pri}-jmb-sub-rt-${var.product_unique}"
  location                      = var.rg_pri_location_long
  resource_group_name           = azurerm_resource_group.rg_pri.name
  disable_bgp_route_propagation = false

  dynamic "route" {
    for_each = local.vrp_agent_vm_ips
    content {
      name           = "VeriParkAgentVMIPs${index(local.vrp_agent_vm_ips, route.value) + 1}"
      address_prefix = "${route.value}/32"
      next_hop_type  = "Internet"
    }
  }

  route {
    name                   = "OutboundPublicInternetRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.rg_pri_frw.ip_configuration[0].private_ip_address
  }

}

resource "azurerm_route_table" "rg_pri_spk_vn_rls_sub_rt" {
  name                          = "${local.resource_prefix_rg_pri}-rls-sub-rt-${var.product_unique}"
  location                      = var.rg_pri_location_long
  resource_group_name           = azurerm_resource_group.rg_pri.name
  disable_bgp_route_propagation = false

  route {
    name                   = "OutboundPublicInternetRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.rg_pri_frw.ip_configuration[0].private_ip_address
  }

}

resource "azurerm_route_table" "rg_pri_spk_vn_wl_sub_rt" {
  name                          = "${local.resource_prefix_rg_pri}-wl-sub-rt-${var.product_unique}"
  location                      = var.rg_pri_location_long
  resource_group_name           = azurerm_resource_group.rg_pri.name
  disable_bgp_route_propagation = false

  route {
    name                   = "OutboundPublicInternetRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.rg_pri_frw.ip_configuration[0].private_ip_address
  }

  lifecycle {
    ignore_changes = [route]
  }
}

#--

resource "azurerm_route_table" "rg_sec_hub_vn_jmb_sub_rt" {
  name                          = "${local.resource_prefix_rg_sec}-jmb-sub-rt-${var.product_unique}"
  location                      = var.rg_sec_location_long
  resource_group_name           = azurerm_resource_group.rg_sec.name
  disable_bgp_route_propagation = false

  dynamic "route" {
    for_each = local.vrp_agent_vm_ips
    content {
      name           = "VeriParkAgentVMIPs${index(local.vrp_agent_vm_ips, route.value) + 1}"
      address_prefix = "${route.value}/32"
      next_hop_type  = "Internet"
    }
  }
  route {
    name                   = "OutboundPublicInternetRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.rg_sec_frw.ip_configuration[0].private_ip_address
  }

}


resource "azurerm_route_table" "rg_sec_spk_vn_rls_sub_rt" {
  name                          = "${local.resource_prefix_rg_sec}-rls-sub-rt-${var.product_unique}"
  location                      = var.rg_sec_location_long
  resource_group_name           = azurerm_resource_group.rg_sec.name
  disable_bgp_route_propagation = false

  route {
    name                   = "OutboundPublicInternetRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.rg_sec_frw.ip_configuration[0].private_ip_address
  }

}

resource "azurerm_route_table" "rg_sec_spk_vn_wl_sub_rt" {
  name                          = "${local.resource_prefix_rg_sec}-wl-sub-rt-${var.product_unique}"
  location                      = var.rg_sec_location_long
  resource_group_name           = azurerm_resource_group.rg_sec.name
  disable_bgp_route_propagation = false

  route {
    name                   = "OutboundPublicInternetRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.rg_sec_frw.ip_configuration[0].private_ip_address
  }

  lifecycle {
    ignore_changes = [route]
  }
}
