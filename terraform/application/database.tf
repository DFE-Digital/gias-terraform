module "redis-managed-cache" {
  source = "./vendor/modules/azure//azure/redis_managed"

  name                  = "cache"
  environment           = var.environment
  azure_resource_prefix = var.azure_resource_prefix
  service_name          = var.service_name
  service_short         = var.service_short
  config_short          = var.config_short

  azure_enable_monitoring = var.enable_monitoring

  azure_managed_redis_sku = var.redis_managed_cache_sku_name

  subnet_id    = module.network.redis_subnet
  dnszone_name = module.network.redis_privdns_name
  dnszone_id   = module.network.redis_privdns_id
}
