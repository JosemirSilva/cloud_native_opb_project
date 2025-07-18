## variables.tf for AKS Module

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

variable "aks_node_count" {
  description = "Número de nós do cluster AKS"
  type        = number
}

variable "aks_vm_size" {
  description = "Tamanho da VM dos nós do AKS"
  type        = string
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes"
  type        = string
}

variable "common_tags" {
  description = "Tags padrão"
  type        = map(string)
}
