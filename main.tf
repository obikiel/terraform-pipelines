provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "obioma"
  location = "West Europe"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "obikiel"
  id                  = "first"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku_name            = "Basic"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "windows_web_app" {
  name                = "obikiel_app"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id 

  site_config {}
}