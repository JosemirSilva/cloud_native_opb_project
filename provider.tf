# provider.tf for raiz project

terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.31.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.46"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# Provider Azure Resource Manager (única definição permitida)
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = false
    }

    api_management {
      purge_soft_delete_on_destroy = true
      recover_soft_deleted         = true
    }
  }
}

# Provider Azure Active Directory (Entra ID)
provider "azuread" {
  # Utiliza autenticação via Azure CLI ou variáveis de ambiente
}

# Provider Random para geração de valores únicos
provider "random" {
  # Sem configuração adicional
}
