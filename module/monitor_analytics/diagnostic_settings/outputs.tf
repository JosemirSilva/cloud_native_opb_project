# outputs.tf for diagnostic_settings module

output "apim_diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.apim.id
}

output "eventhub_diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.eventhub.id
}

output "keyvault_diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.keyvault.id
}

output "aks_diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.aks.id
}