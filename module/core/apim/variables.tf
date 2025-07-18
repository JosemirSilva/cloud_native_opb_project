## vairables.tf for Azure API Management Module

variable "location" {
  description = "Região dos recursos"
  type        = string
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "project_name" {
  description = "Nome do projeto para nomeação dos recursos"
  type        = string
}

variable "api_management_sku" {
  description = "SKU do API Management"
  type        = string
}

variable "common_tags" {
  description = "Tags comuns aplicadas aos recursos"
  type        = map(string)
}
