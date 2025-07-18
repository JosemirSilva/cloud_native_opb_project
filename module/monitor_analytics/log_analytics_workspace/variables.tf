# variables.tf - monitor_analytics

variable "resource_group_name" {
  description = "Nome do resource group."
  type        = string
}

variable "tags" {
  description = "Tags padrão."
  type        = map(string)
}

variable "name" {
  description = "Nome base para Application Insights."
  type        = string
}

variable "location" {
  description = "Região Azure."
  type        = string
}


