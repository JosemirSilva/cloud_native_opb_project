# outputs.tf for  Key Vault module


output "key_vault_id" {
  description = "ID do Key Vault"
  value       = azurerm_key_vault.kv-jjfintech.id
}

output "key_vault_name" {
  description = "Nome do Key Vault"
  value       = azurerm_key_vault.kv-jjfintech.name
}

output "key_vault_uri" {
  description = "URI do Key Vault"
  value       = azurerm_key_vault.kv-jjfintech.vault_uri
}
