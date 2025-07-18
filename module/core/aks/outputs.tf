# Outputs for AKS Module

output "aks_cluster_name" {
  description = "Nome do cluster AKS"
  value       = azurerm_kubernetes_cluster.aks-jjfintech.name
}

output "aks_cluster_id" {
  description = "ID do cluster AKS"
  value       = azurerm_kubernetes_cluster.aks-jjfintech.id
}
