module "data_factory" {
    source = "./vendor/modules/azure//azure/azure_data_factory"
    environment = var.environment
    azure_resource_prefix = var.azure_resource_prefix
    service_name = var.service_name
    service_short = var.service_short
    config_short = var.config_short
    git_enabled_environment = "na"
    azure_enable_monitoring = var.azure_enable_monitoring
}