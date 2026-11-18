
module "network" {
  source = "./vendor/modules/azure//azure/network"

  environment           = var.environment
  azure_resource_prefix = var.azure_resource_prefix
  service_short         = var.service_short
  config_short          = var.config_short
  config                = var.config
  service_name          = var.service_name
  vnet_address          = ["10.0.0.0/12"]
  storage_subnet        = ["10.2.128.0/18"]
  sql_subnet            = ["10.2.192.0/18"]
  redis_subnet          = ["10.2.64.0/18"]
  apps_subnet           = ["10.3.0.0/18"]
  enable_storage        = true
  enable_redis          = true
  enable_postgres       = false
  enable_sql            = true
  enable_apps           = true
}
