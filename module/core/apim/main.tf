# main.tf for Azure API Management Module

resource "azurerm_api_management" "apim-jjfintech" {
  name                = "apim-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = "JJ Fintech"
  publisher_email     = "admin@jjfintech.com"
  sku_name            = var.api_management_sku
  tags                = var.common_tags

  identity {
    type = "SystemAssigned"
  }
}
