resource "azurerm_storage_account" "example" {

  name                     = "tflearning"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = local.common_tags.environment
  }
}
