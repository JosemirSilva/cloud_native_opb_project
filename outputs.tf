# outputs.tf for raiz project

output "resource_group_name" {
  description = "Nome do Resource Group"
  value       = azurerm_resource_group.jjfintech.name
}

output "resource_group_location" {
  description = "Localização do Resource Group"
  value       = azurerm_resource_group.jjfintech.location
}

# Exemplo de como seriam os demais outputs corrigidos:
# Eles devem ser referenciados por module.<nome>.output_name (caso os módulos exponham esses outputs)

# Exemplo hipotético:
# output "aks_cluster_name" {
#   description = "Nome do cluster AKS"
#   value       = module.aks.cluster_name
# }

# Observação:
# Para que essas referências funcionem, é necessário que os respectivos módulos (aks, apim, eventhub, etc.)
# tenham seus próprios arquivos outputs.tf configurados com os atributos desejados.

# Você pode remover ou comentar os demais outputs até que os módulos exportem corretamente os valores,
# ou posso gerar os outputs.tf para os módulos agora mesmo.
