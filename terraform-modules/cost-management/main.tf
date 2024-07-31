resource "azurerm_storage_account" "storage" {
  name                = "obiomaastorage"
  resource_group_name = azurerm_resource_group.resource_group.name

  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                 = "obicontainer"
  storage_account_name = azurerm_storage_account.storage.name
}
  
resource "azurerm_resource_group" "resource_group" {
  name     = "obioma"
  location = "West Europe"
  
}
