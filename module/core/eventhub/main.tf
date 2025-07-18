# main.tf for Azure Event Hub Module

resource "azurerm_eventhub_namespace" "evhns" {
  name                = substr(replace("evhns${var.project_name}", "-", ""), 0, 24)
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.event_hub_sku
  capacity            = 1
  tags                = var.common_tags
}

resource "azurerm_eventhub" "evh_metrics" {
  name              = substr(replace("evhmetrics${var.project_name}", "-", ""), 0, 24)
  partition_count   = 2
  message_retention = 1
  namespace_id      = azurerm_eventhub_namespace.evhns.id
  status            = "Active"
}

resource "azurerm_eventhub" "evh_logs" {
  name              = substr(replace("evhlogs${var.project_name}", "-", ""), 0, 24)
  partition_count   = 2
  message_retention = 1
  namespace_id      = azurerm_eventhub_namespace.evhns.id
  status            = "Active"
}

