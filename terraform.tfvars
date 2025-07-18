# terraform.tfvars for raiz project

location     = "East US 2"
project_name = "jjfintech"
# Preencha com o ID real da sua subscription Azure
subscription_id = "00000000-0000-0000-0000-000000000000"
environment     = "dev"

aks_node_count     = 3
aks_vm_size        = "Standard_D2s_v3"
kubernetes_version = "1.31.8"

api_management_sku = "Developer_1"
key_vault_sku      = "standard"
event_hub_sku      = "Standard"

admin_group_object_id     = "00000000-0000-0000-0000-000000000000"
developer_group_object_id = "11111111-1111-1111-1111-111111111111"

enable_private_endpoints = true
enable_defender          = true
enable_monitoring        = true

log_retention_days    = 30
backup_retention_days = 7

common_tags = {
  Project     = "jj-opb"
  Workload    = "core"
  Environment = "dev"
  Region      = "eus"
  Instance    = "01"
  Owner       = "DevOps-Team"
  CostCenter  = "IT-Research"
}