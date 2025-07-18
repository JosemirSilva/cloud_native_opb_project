# outputs.tf for Application Insights module

output "instrumentation_key" {
  description = "Instrumentation Key do Application Insights"
  value       = azurerm_application_insights.appinsights.instrumentation_key
}

output "connection_string" {
  description = "Connection String do Application Insights"
  value       = azurerm_application_insights.appinsights.connection_string
}