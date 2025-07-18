# Outputs for Event Hub Module


output "eventhub_namespace_id" {
  description = "ID do namespace do Event Hub"
  value       = azurerm_eventhub_namespace.evhns.id
}

output "eventhub_namespace_name" {
  description = "Nome do namespace do Event Hub"
  value       = azurerm_eventhub_namespace.evhns.name
}

output "eventhub_metrics_name" {
  description = "Nome do Event Hub para métricas"
  value       = azurerm_eventhub.evh_metrics.name
}

output "eventhub_logs_name" {
  description = "Nome do Event Hub para logs"
  value       = azurerm_eventhub.evh_logs.name
}
