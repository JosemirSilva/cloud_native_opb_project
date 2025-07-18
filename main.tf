# main.tf for root project

## 1. Resource Group principal
resource "random_id" "suffix" {
  byte_length = 3
}

resource "azurerm_resource_group" "jjfintech" {
  name     = "${var.project_name}-rg-${random_id.suffix.hex}"
  location = var.location
  tags     = var.common_tags
}

## 2. Rede Virtual (VNet)
module "vnet" {
  source              = "./module/core/vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.jjfintech.name
  project_name        = "${var.project_name}-${random_id.suffix.hex}"
  common_tags         = var.common_tags
  depends_on          = [azurerm_resource_group.jjfintech]
}

## 3. Key Vault
module "keyvault" {
  source              = "./module/core/keyvault"
  location            = var.location
  resource_group_name = azurerm_resource_group.jjfintech.name
  project_name        = "${var.project_name}-${random_id.suffix.hex}"
  common_tags         = var.common_tags
  depends_on          = [azurerm_resource_group.jjfintech, module.vnet]
}

## 4. Event Hub
module "eventhub" {
  source              = "./module/core/eventhub"
  location            = var.location
  resource_group_name = azurerm_resource_group.jjfintech.name
  project_name        = "${var.project_name}-${random_id.suffix.hex}"
  event_hub_sku       = var.event_hub_sku
  common_tags         = var.common_tags
  depends_on          = [azurerm_resource_group.jjfintech, module.vnet]
}

## 5. API Management (APIM)
module "apim" {
  source              = "./module/core/apim"
  location            = var.location
  resource_group_name = azurerm_resource_group.jjfintech.name
  project_name        = "${var.project_name}-${random_id.suffix.hex}"
  api_management_sku  = var.api_management_sku
  common_tags         = var.common_tags
  depends_on          = [azurerm_resource_group.jjfintech, module.vnet]
}

## 6. AKS (Azure Kubernetes Service)
module "aks" {
  source              = "./module/core/aks"
  location            = var.location
  resource_group_name = azurerm_resource_group.jjfintech.name
  project_name        = "${var.project_name}-${random_id.suffix.hex}"
  aks_node_count      = var.aks_node_count
  aks_vm_size         = var.aks_vm_size
  kubernetes_version  = var.kubernetes_version
  common_tags         = var.common_tags
  depends_on          = [azurerm_resource_group.jjfintech, module.vnet]
}

## 7. Storage para logs
module "storage" {
  source              = "./module/core/storage"
  location            = var.location
  resource_group_name = azurerm_resource_group.jjfintech.name
  project_name        = "${var.project_name}-${random_id.suffix.hex}"
  log_retention_days  = var.log_retention_days
  common_tags         = var.common_tags
  depends_on          = [azurerm_resource_group.jjfintech, module.vnet]
}


## 08. Log Analytics Workspace
module "log_analytics_workspace" {
  source              = "./module/monitor_analytics/log_analytics_workspace"
  name                = lower("${var.project_name}-law-${random_id.suffix.hex}")
  location            = var.location
  resource_group_name = azurerm_resource_group.jjfintech.name
  tags                = var.common_tags
  depends_on          = [module.apim, module.eventhub, module.keyvault, module.aks, module.storage]
}

## 09. Application Insights
module "application_insights" {
  source                     = "./module/monitor_analytics/application_insights"
  name                       = lower("${var.project_name}-appi-${random_id.suffix.hex}")
  location                   = var.location
  resource_group_name        = azurerm_resource_group.jjfintech.name
  log_analytics_workspace_id = module.log_analytics_workspace.azurerm_log_analytics_workspace_law_id
  tags                       = var.common_tags
  retention_in_days          = 30
  depends_on                 = [module.log_analytics_workspace]
}

## 10. Configuração de Diagnóstico
module "diagnostic_settings" {
  source                     = "./module/monitor_analytics/diagnostic_settings"
  apim_resource_id           = module.apim.apim_resource_id
  eventhub_namespace_id      = module.eventhub.eventhub_namespace_id
  keyvault_id                = module.keyvault.key_vault_id
  aks_id                     = module.aks.aks_cluster_id
  log_analytics_workspace_id = module.log_analytics_workspace.azurerm_log_analytics_workspace_law_id
  resource_group_name        = azurerm_resource_group.jjfintech.name
  tags                       = var.common_tags
  depends_on                 = [module.application_insights, module.log_analytics_workspace, module.apim, module.eventhub, module.keyvault, module.aks, module.storage]
}
