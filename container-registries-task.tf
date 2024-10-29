locals {
  con_reg_task_settings = {
    days_ago = 30
    keep_images = 30
    acr_cli_version = "mcr.microsoft.com/acr/acr-cli:0.5"
    agent_cpu = 2
    timeout = 3600

    platform_specs = {
      architecture = "amd64"
      os           = "Linux"
      variant      = null
    }
  }
}

resource "azurerm_container_registry_task" "rg_pri_sol_acr_daily_purge_task" {
  name                  = "sol-acr-daily-purge-task"
  container_registry_id = azurerm_container_registry.rg_pri_sol_acr.id

  identity {
    type = local.resource_identity_type.system_assigned
  }
  
  agent_setting {
    cpu = local.con_reg_task_settings.agent_cpu
  }

  registry_credential {
    custom {
      identity = "[system]"
      login_server = azurerm_container_registry.rg_pri_sol_acr.login_server
    }
  }

  platform {
    architecture = local.con_reg_task_settings.platform_specs.architecture
    os           = local.con_reg_task_settings.platform_specs.os
    variant      = local.con_reg_task_settings.platform_specs.variant
  }

  encoded_step {
    task_content = base64encode(yamlencode({
      version : "v1.1.0",
      steps : [
        {
          cmd : " ${local.con_reg_task_settings.acr_cli_version} purge --filter '.*:.*' --ago ${local.con_reg_task_settings.days_ago}d --untagged --keep ${local.con_reg_task_settings.keep_images}"
          disableWorkingDirectoryOverride : true,
          timeout : local.con_reg_task_settings.timeout
        }
      ]
    }))
    values = {}
  }

  timer_trigger {
    name     = "daily at 1AM"
    schedule = "0 1 * * *"
  }
}