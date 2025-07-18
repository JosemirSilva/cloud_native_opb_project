# main.tf - monitor_analytics (integração de logs e métricas)

resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}
