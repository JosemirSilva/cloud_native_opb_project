# main.tf for Virtual Network and Subnets module

resource "azurerm_virtual_network" "vnet-jjfintech" {
  name                = "vnet-${var.project_name}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.common_tags
}

resource "azurerm_subnet" "subnet-aks-jjfintech" {
  name                 = "snet-aks-${var.project_name}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-jjfintech.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet-pe-jjfintech" {
  name                 = "snet-pe-${var.project_name}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-jjfintech.name
  address_prefixes     = ["10.0.2.0/24"]
}
