# Outputs for API Management Module


output "apim_resource_id" {
  description = "ID do recurso do API Management"
  value       = azurerm_api_management.apim-jjfintech.id
}

output "apim_resource_name" {
  description = "Nome do recurso do API Management"
  value       = azurerm_api_management.apim-jjfintech.name
}
