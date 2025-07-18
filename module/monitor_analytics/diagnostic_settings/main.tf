# main.tf for diagnostic_settings module

resource "azurerm_monitor_diagnostic_setting" "apim" {
  name                       = "diag-apim"
  target_resource_id         = var.apim_resource_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "GatewayLogs"
  }
  enabled_metric {
    category = "AllMetrics"
  }
}

resource "azurerm_monitor_diagnostic_setting" "eventhub" {
  name                       = "diag-eventhub"
  target_resource_id         = var.eventhub_namespace_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "OperationalLogs"
  }
  enabled_metric {
    category = "AllMetrics"
  }
}

resource "azurerm_monitor_diagnostic_setting" "keyvault" {
  name                       = "diag-keyvault"
  target_resource_id         = var.keyvault_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditEvent"
  }
  enabled_metric {
    category = "AllMetrics"
  }
}

resource "azurerm_monitor_diagnostic_setting" "aks" {
  name                       = "diag-aks"
  target_resource_id         = var.aks_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "kube-apiserver"
  }
  enabled_metric {
    category = "AllMetrics"
  }
}
