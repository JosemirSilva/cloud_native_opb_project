# main.tf for AKS Module

resource "azurerm_kubernetes_cluster" "aks-jjfintech" {
  name                = "aks-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.project_name}"

  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name            = "default"
    node_count      = var.aks_node_count
    vm_size         = var.aks_vm_size
    os_disk_type    = "Managed"
    type            = "VirtualMachineScaleSets"
    scale_down_mode = "Delete"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.common_tags
}