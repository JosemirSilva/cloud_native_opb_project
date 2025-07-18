# main.tf for Azure Key Vault module

resource "azurerm_key_vault" "kv-jjfintech" {
  name                       = "kv-${var.project_name}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = false
  soft_delete_retention_days = 7
  enable_rbac_authorization  = true
  tags                       = var.common_tags
}

data "azurerm_client_config" "current" {}
