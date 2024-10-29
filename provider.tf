provider "azurerm" {
  use_msi         = false
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
      purge_soft_delete_on_destroy    = true
    }

    virtual_machine {
      delete_os_disk_on_deletion = true
    }
  }
}

provider "null" {

}

provider "local" {

}

provider "azuread" {
  use_msi       = false
  client_id     = var.client_id
  client_secret = var.client_secret
  tenant_id     = var.tenant_id
}

provider "azapi" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

terraform {
  backend "azurerm" {

  }
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "~> 3.98.0"
    }

    null = {
      source  = "registry.terraform.io/hashicorp/null"
      version = "~> 3.2.1"
    }

    local = {
      source  = "registry.terraform.io/hashicorp/local"
      version = "~> 2.4.0"
    }

    azuread = {
      source  = "registry.terraform.io/hashicorp/azuread"
      version = "~> 2.50.0"
    }

    external = {
      source  = "registry.terraform.io/hashicorp/external"
      version = "~> 2.3.1"
    }

    random = {
      source  = "registry.terraform.io/hashicorp/random"
      version = "~> 3.5.1"
    }

    acme = {
      source  = "registry.terraform.io/vancluever/acme"
      version = "~> 2.21.0"
    }

    template = {
      source  = "registry.terraform.io/hashicorp/template"
      version = "~> 2.2.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.13.1"
    }
  }
}
