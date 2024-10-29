locals {
  resource_types_tiers = {
    "AppServices"                   = "Free",
    "ContainerRegistry"             = "Standard",
    "KeyVaults"                     = "Standard",
    "KubernetesService"             = "Standard",
    "SqlServers"                    = "Standard",
    "SqlServerVirtualMachines"      = "Free",
    "VirtualMachines"               = "Standard",
    "Arm"                           = "Free",
    "Dns"                           = "Standard",
    "OpenSourceRelationalDatabases" = "Free",
    "CloudPosture"                  = "Free"
  }
}


resource "azurerm_security_center_subscription_pricing" "security_center_sub_pricing" {
  for_each      = local.resource_types_tiers
  resource_type = each.key
  tier          = each.value
}

# Just a sample markup, not to execute until confirmed for Malware Scanning Feature for Storage Account

resource "azurerm_security_center_subscription_pricing" "DefenderForStorage" {
  tier          = "Standard"
  resource_type = "StorageAccounts"
  subplan       = "DefenderForStorageV2"

  extension {
    name = "OnUploadMalwareScanning"
  }

  extension {
    name = "SensitiveDataDiscovery"
  }

  lifecycle {
    ignore_changes = [extension]
  }
}

# Just a sample markup, not to execute until confirmed for Malware Scanning Feature for Storage Account
