module "redis-managed-cache" {
  source = "./vendor/modules/aks//aks/redis_managed"

  count                 = var.deploy_managed_redis ? 1 : 0
  name                  = "cache"
  namespace             = ""
  environment           = var.environment
  azure_resource_prefix = "${var.subscription_prefix}${var.azure_resource_prefix}"
  service_name          = var.service_name
  service_short         = var.service_short
  config_short          = var.env_short

  cluster_configuration_map = local.cluster_configuration_map

  use_azure               = var.deploy_azure_backing_services
  azure_enable_monitoring = var.enable_monitoring

  azure_managed_redis_sku = var.redis_managed_cache_sku_name
}
