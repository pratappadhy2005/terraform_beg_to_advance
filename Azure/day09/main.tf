resource "azurerm_resource_group" "example" {

  name     = "${var.environment}-resources"
  location = var.allowed_locations[0]
  tags = {
    environment = local.common_tags.environment
  }
}

resource "azurerm_storage_account" "example" {
  lifecycle {
    create_before_destroy = true
    precondition {
      condition     = var.storage_account_name_set != null
      error_message = "storage_account_name_set is required"
    }
  }
  #count                    = length(var.storage_account_name)
  #name                     = var.storage_account_name[count.index]
  for_each                 = var.storage_account_name_set
  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = local.common_tags.environment
  }
}
