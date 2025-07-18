# variables.tf for Event Hub Module

variable "location" {
  description = "Região dos recursos"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group destino"
  type        = string
}

variable "project_name" {
  description = "Nome do projeto para compor nomes de recursos"
  type        = string
}

variable "event_hub_sku" {
  description = "SKU do Event Hub"
  type        = string
}

variable "common_tags" {
  description = "Tags padrão"
  type        = map(string)
}
