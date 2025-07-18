# main.tf for storage module

resource "azurerm_storage_account" "st" {
  name                     = substr(lower(replace("st${var.project_name}", "-", "")), 0, 24)
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = var.common_tags
}

resource "azurerm_storage_management_policy" "logs_policy" {
  storage_account_id = azurerm_storage_account.st.id

  rule {
    name    = "logs-retention"
    enabled = true
    filters {
      blob_types   = ["blockBlob"]
      prefix_match = ["insights-logs-", "containerinsights-", "resourceId=/SUBSCRIPTIONS/"]
    }

    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = var.log_retention_days
      }

      snapshot {
        delete_after_days_since_creation_greater_than = var.log_retention_days
      }
    }
  }
}