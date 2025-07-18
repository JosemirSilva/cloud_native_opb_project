# outputs.tf for Virtual Network and Subnets module

output "virtual_network_id" {
  description = "ID da Virtual Network"
  value       = azurerm_virtual_network.vnet-jjfintech.id
}

output "virtual_network_name" {
  description = "Nome da Virtual Network"
  value       = azurerm_virtual_network.vnet-jjfintech.name
}

output "aks_subnet_id" {
  description = "ID da subnet usada pelo AKS"
  value       = azurerm_subnet.subnet-aks-jjfintech.id
}

output "private_endpoints_subnet_id" {
  description = "ID da subnet usada por Private Endpoints"
  value       = azurerm_subnet.subnet-pe-jjfintech.id
}
