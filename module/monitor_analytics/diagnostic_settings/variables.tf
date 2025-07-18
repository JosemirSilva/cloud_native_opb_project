# variables.tf for diagnostic_settings module

variable "apim_resource_id" {
  description = "ID do recurso API Management para diagnóstico."
  type        = string
}

variable "eventhub_namespace_id" {
  description = "ID do namespace do Event Hub para diagnóstico."
  type        = string
}

variable "keyvault_id" {
  description = "ID do Key Vault para diagnóstico."
  type        = string
}

variable "aks_id" {
  description = "ID do AKS para diagnóstico."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "ID do Log Analytics Workspace."
  type        = string
}

variable "resource_group_name" {
  description = "Nome do resource group."
  type        = string
}

variable "tags" {
  description = "Tags padrão."
  type        = map(string)
}