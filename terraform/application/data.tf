module "service_data" {
  source              = "./vendor/modules/aks//aks/service_data"
  location            = data.azurerm_resource_group.main.location
  subscription_prefix = var.subscription_prefix
  resource_prefix     = var.azure_resource_prefix
  service_short       = var.service_short
  service_name        = var.service_name
}

data "azurerm_resource_group" "main" {
  name = "${var.subscription_prefix}${var.azure_resource_prefix}-${var.service_short}-${var.env_short}-rg"
}
