resource "azurerm_automation_module" "rg_pri_auto_module_az_accounts" {
  name                    = "Az.Accounts"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name

  module_link {
    uri = "https://psg-prod-eastus.azureedge.net/packages/az.accounts.2.1.2.nupkg"
  }

  depends_on = [
    azurerm_automation_account.rg_pri_auto,
  ]
}

resource "azurerm_automation_module" "rg_pri_auto_module_az_keyvault" {
  name                    = "Az.KeyVault"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name

  module_link {
    uri = "https://psg-prod-eastus.azureedge.net/packages/az.keyvault.3.0.0.nupkg"
  }

  depends_on = [
    azurerm_automation_account.rg_pri_auto,
    azurerm_automation_module.rg_pri_auto_module_az_accounts,
  ]
}

resource "azurerm_automation_module" "rg_pri_auto_module_az_resources" {
  name                    = "Az.Resources"
  resource_group_name     = azurerm_resource_group.rg_pri.name
  automation_account_name = azurerm_automation_account.rg_pri_auto.name

  module_link {
    uri = "https://psg-prod-eastus.azureedge.net/packages/az.resources.3.0.0.nupkg"
  }

  depends_on = [
    azurerm_automation_account.rg_pri_auto,
    azurerm_automation_module.rg_pri_auto_module_az_accounts,
  ]
}