resource "azurerm_resource_group" "resource_group" {
  name     = "obioma"
  location = "West Europe"
}

module "appservice" {
  source                = "./terraform-modules/appservice"

}

module "cost-management" {
  source                = "./terraform-modules/cost-management"
#   cost_export_name      = "billing"
#   resource_group_name   = "obioma"
#   timeframe             = "Monthly"
#   storage_account_id    = storage_account_id  # Use a variable to avoid hardcoding sensitive data
#   container_name        = "obicontainer"
}
