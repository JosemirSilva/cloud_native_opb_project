variable "subscription_id" {
  description = "ID da subscription Azure"
  type        = string
}
# variables.tf for raiz project

variable "location" {
  description = "Localização dos recursos Azure"
  type        = string
  default     = "East US 2"

  validation {
    condition = contains([
      "East US", "East US 2", "West US", "West US 2", "West US 3",
      "Central US", "South Central US", "West Central US",
      "Brazil South", "Canada Central", "North Europe", "West Europe"
    ], var.location)
    error_message = "Localização deve ser uma região Azure válida."
  }
}

variable "environment" {
  description = "Ambiente de deploy (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "O ambiente deve ser dev, staging ou prod."
  }
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "jjfintech"

  validation {
    condition     = can(regex("^[a-z0-9]{2,12}$", var.project_name))
    error_message = "O nome do projeto deve ter entre 2 e 12 caracteres, apenas letras minúsculas e números."
  }
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes para o AKS"
  type        = string
  default     = "1.27.7"
}

variable "aks_node_count" {
  description = "Número de nós no cluster AKS"
  type        = number
  default     = 2

  validation {
    condition     = var.aks_node_count >= 1 && var.aks_node_count <= 10
    error_message = "O número de nós deve estar entre 1 e 10."
  }
}

variable "aks_vm_size" {
  description = "Tamanho das VMs para os nós do AKS"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "common_tags" {
  description = "Tags comuns para todos os recursos"
  type        = map(string)
  default = {
    Project     = "JJ-Fintech-OpenBanking"
    Environment = "Laboratory"
    Owner       = "DevOps-Team"
    Purpose     = "Open-Finance-Learning"
    CreatedBy   = "Terraform"
    CostCenter  = "IT-Infrastructure"
  }
}

variable "admin_group_object_id" {
  description = "Object ID do grupo de administradores Azure AD"
  type        = string
  default     = ""
}

variable "developer_group_object_id" {
  description = "Object ID do grupo de desenvolvedores Azure AD"
  type        = string
  default     = ""
}

variable "enable_private_endpoints" {
  description = "Habilitar Private Endpoints para os serviços PaaS"
  type        = bool
  default     = true
}

variable "enable_defender" {
  description = "Habilitar Microsoft Defender para Cloud"
  type        = bool
  default     = true
}

variable "log_retention_days" {
  description = "Dias de retenção para logs no Log Analytics"
  type        = number
  default     = 30

  validation {
    condition     = var.log_retention_days >= 7 && var.log_retention_days <= 730
    error_message = "A retenção de logs deve estar entre 7 e 730 dias."
  }
}

variable "api_management_sku" {
  description = "SKU do API Management"
  type        = string
  default     = "Developer_1"

  validation {
    condition = contains([
      "Developer_1", "Basic_1", "Basic_2",
      "Standard_1", "Standard_2", "Premium_1"
    ], var.api_management_sku)
    error_message = "SKU deve ser um valor válido do API Management."
  }
}

variable "storage_replication_type" {
  description = "Tipo de replicação do Storage Account"
  type        = string
  default     = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS"], var.storage_replication_type)
    error_message = "Tipo de replicação deve ser LRS, GRS, RAGRS ou ZRS."
  }
}

variable "key_vault_sku" {
  description = "SKU do Key Vault"
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.key_vault_sku)
    error_message = "SKU do Key Vault deve ser standard ou premium."
  }
}

variable "event_hub_sku" {
  description = "SKU do Event Hub"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard"], var.event_hub_sku)
    error_message = "SKU do Event Hub deve ser Basic ou Standard."
  }
}

variable "allowed_ip_ranges" {
  description = "Ranges de IP permitidos para acesso aos recursos"
  type        = list(string)
  default     = []
}

variable "enable_monitoring" {
  description = "Habilitar monitoramento avançado"
  type        = bool
  default     = true
}

variable "backup_retention_days" {
  description = "Dias de retenção para backups"
  type        = number
  default     = 7

  validation {
    condition     = var.backup_retention_days >= 1 && var.backup_retention_days <= 35
    error_message = "A retenção de backup deve estar entre 1 e 35 dias."
  }
}