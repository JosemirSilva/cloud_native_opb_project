# variables.tf for Virtual Network and Subnets module

variable "location" {
  description = "Região dos recursos"
  type        = string
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "project_name" {
  description = "Prefixo para nomeação dos recursos"
  type        = string
}

variable "common_tags" {
  description = "Tags comuns aplicadas aos recursos"
  type        = map(string)
}
