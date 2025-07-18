# variables.tf for application_insights module

variable "retention_in_days" {
  description = "Dias de retenção dos logs do Application Insights."
  type        = number
  default     = 30
}

variable "name" {
  description = "Nome do Application Insights."
  type        = string
}

variable "location" {
  description = "Região Azure."
  type        = string
}

variable "resource_group_name" {
  description = "Nome do resource group."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "ID do Log Analytics Workspace."
  type        = string
}

variable "tags" {
  description = "Tags padrão."
  type        = map(string)
}