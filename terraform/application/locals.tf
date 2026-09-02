locals {
  environment_prefix = "${var.subscription_prefix}${var.azure_resource_prefix}"
  vnet_name          = "${local.environment_prefix}-${var.service_short}-${var.env_short}-vnet"
  cluster_configuration_map = {
    "resource_prefix"     = "${var.subscription_prefix}${var.azure_resource_prefix}-${var.service_short}-${var.env_short}"
    "resource_group_name" = data.azurerm_resource_group.main.name
    "cpu_min"             = 0.05
  }
}
