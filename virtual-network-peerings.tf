# PROD HUB VNET 1.1 to PROD SPOKE VNET 2.1
resource "azurerm_virtual_network_peering" "rg_pri_hub_vn_rg_pri_spk_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_pri_hub_vn.name}-${azurerm_virtual_network.rg_pri_spk_vn.name}-vnp"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  virtual_network_name         = azurerm_virtual_network.rg_pri_hub_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_pri_spk_vn.id
  allow_virtual_network_access = true
  allow_gateway_transit        = true
}

# PROD SPOKE VNET 2.1 to PROD HUB VNET 1.1
resource "azurerm_virtual_network_peering" "rg_pri_spk_vn_rg_pri_hub_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_pri_spk_vn.name}-${azurerm_virtual_network.rg_pri_hub_vn.name}-vnp"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  virtual_network_name         = azurerm_virtual_network.rg_pri_spk_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_pri_hub_vn.id
  allow_virtual_network_access = true
  use_remote_gateways          = true
}

# PROD HUB VNET 1.2 to PROD SPOKE VNET 2.2
resource "azurerm_virtual_network_peering" "rg_sec_hub_vn_rg_sec_spk_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_sec_hub_vn.name}-${azurerm_virtual_network.rg_sec_spk_vn.name}-vnp"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  virtual_network_name         = azurerm_virtual_network.rg_sec_hub_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_sec_spk_vn.id
  allow_virtual_network_access = true
  allow_gateway_transit        = true
}

# PROD SPOKE VNET 2.2 to PROD HUB VNET 1.2
resource "azurerm_virtual_network_peering" "rg_sec_spk_vn_rg_sec_hub_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_sec_spk_vn.name}-${azurerm_virtual_network.rg_sec_hub_vn.name}-vnp"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  virtual_network_name         = azurerm_virtual_network.rg_sec_spk_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_sec_hub_vn.id
  allow_virtual_network_access = true
  use_remote_gateways          = true
}

# PROD SPOKE VNET 2.1 to PROD HUB VNET 1.2
resource "azurerm_virtual_network_peering" "rg_pri_spk_vn_rg_sec_hub_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_pri_spk_vn.name}-${azurerm_virtual_network.rg_sec_hub_vn.name}-vnp-glob"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  virtual_network_name         = azurerm_virtual_network.rg_pri_spk_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_sec_hub_vn.id
  allow_virtual_network_access = true
  allow_gateway_transit        = false
}

# PROD HUB VNET 1.2 to PROD SPOKE VNET 2.1
resource "azurerm_virtual_network_peering" "rg_sec_hub_vn_rg_pri_spk_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_sec_hub_vn.name}-${azurerm_virtual_network.rg_pri_spk_vn.name}-vnp-glob"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  virtual_network_name         = azurerm_virtual_network.rg_sec_hub_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_pri_spk_vn.id
  allow_virtual_network_access = true
  allow_gateway_transit        = false
}

# PROD HUB VNET 1.1 to PROD SPOKE VNET 2.2
resource "azurerm_virtual_network_peering" "rg_pri_hub_vn_rg_sec_spk_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_pri_hub_vn.name}-${azurerm_virtual_network.rg_sec_spk_vn.name}-vnp-glob"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  virtual_network_name         = azurerm_virtual_network.rg_pri_hub_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_sec_spk_vn.id
  allow_virtual_network_access = true
  allow_gateway_transit        = false
}

# PROD SPOKE VNET 2.2 to PROD HUB VNET 1.1
resource "azurerm_virtual_network_peering" "rg_sec_spk_vn_rg_pri_hub_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_sec_spk_vn.name}-${azurerm_virtual_network.rg_pri_hub_vn.name}-vnp-glob"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  virtual_network_name         = azurerm_virtual_network.rg_sec_spk_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_pri_hub_vn.id
  allow_virtual_network_access = true
  allow_gateway_transit        = false
}

# PROD SPOKE VNET 2.1 to PROD SPOKE VNET 2.2
resource "azurerm_virtual_network_peering" "rg_pri_spk_vn_rg_sec_spk_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_pri_spk_vn.name}-${azurerm_virtual_network.rg_sec_spk_vn.name}-vnp-glob"
  resource_group_name          = azurerm_resource_group.rg_pri.name
  virtual_network_name         = azurerm_virtual_network.rg_pri_spk_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_sec_spk_vn.id
  allow_virtual_network_access = true
  allow_gateway_transit        = false
}

# PROD SPOKE VNET 2.2 to PROD SPOKE VNET 2.1
resource "azurerm_virtual_network_peering" "rg_sec_spk_vn_rg_pri_spk_vn_vnp" {
  name                         = "${azurerm_virtual_network.rg_sec_spk_vn.name}-${azurerm_virtual_network.rg_pri_spk_vn.name}-vnp-glob"
  resource_group_name          = azurerm_resource_group.rg_sec.name
  virtual_network_name         = azurerm_virtual_network.rg_sec_spk_vn.name
  remote_virtual_network_id    = azurerm_virtual_network.rg_pri_spk_vn.id
  allow_virtual_network_access = true
  allow_gateway_transit        = false
}
