# variables.tf for storage module

variable "project_name" {
  description = "Prefixo dos nomes dos recursos"
  type        = string
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Região dos recursos"
  type        = string
}

variable "log_retention_days" {
  description = "Dias de retenção dos logs"
  type        = number
}

variable "common_tags" {
  description = "Tags padrão"
  type        = map(string)
}
