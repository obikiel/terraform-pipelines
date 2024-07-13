provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "obioma"
  location = "West Europe"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "obikiel"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku_name            = "B1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "windows_web_app" {
  name                = "izzy-windows-app"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id 

  site_config {}
}