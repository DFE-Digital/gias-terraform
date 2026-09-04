module "storage-gias" {
  source = "./vendor/modules/azure//azure/storage_account"

  name                              = "gias"
  environment                       = var.environment
  azure_resource_prefix             = var.azure_resource_prefix
  service_short                     = var.service_short
  config_short                      = var.config_short
  public_network_access_enabled     = false
  infrastructure_encryption_enabled = true
  create_encryption_scope           = false
  use_private_storage               = var.use_private_storage
  # Create containers for the application (all containers are private)
  containers = [
    { name = "tablestorageexport" },
    { name = "insights-logs-frontdoorwebapplicationfirewalllog" },
    { name = "insights-logs-frontdooraccesslog" },
    { name = "insights-metrics-pt1m" },
    { name = "insights-logs-frontdoorhealthprobelog" },
    { name = "guidance" },
    { name = "public" },
    { name = "edubase-estab-index" },
    { name = "downloads" },
    { name = "database-backups" },
    { name = "logs" },
    { name = "content" }
  ]
  # Configure blob lifecycle management (default: delete after 7 days)
  container_delete_retention_days = var.container_delete_retention_days

  blob_delete_after_days = var.blob_delete_after_days

  subnet_id    = module.network.storage_subnet
  dnszone_name = module.network.storage_privdns_name
  dnszone_id   = module.network.storage_privdns_id
}

module "storage-edubase" {
  source = "./vendor/modules/azure//azure/storage_account"

  name                              = "edubase"
  environment                       = var.environment
  azure_resource_prefix             = var.azure_resource_prefix
  service_short                     = var.service_short
  config_short                      = var.config_short
  public_network_access_enabled     = false
  infrastructure_encryption_enabled = true
  create_encryption_scope           = false
  use_private_storage               = var.use_private_storage
  # Create containers for the application (all containers are private)
  containers = [
    { name = "extracts" },
    { name = "extracts-sandbox1" },
  ]
  # Configure blob lifecycle management (default: delete after 7 days)
  container_delete_retention_days = var.container_delete_retention_days

  blob_delete_after_days = var.blob_delete_after_days

  subnet_id    = module.network.storage_subnet
  dnszone_name = module.network.storage_privdns_name
  dnszone_id   = module.network.storage_privdns_id
}

module "storage-edubase5044" {
  source = "./vendor/modules/azure//azure/storage_account"

  name                              = "edb5044"
  environment                       = var.environment
  azure_resource_prefix             = var.azure_resource_prefix
  service_short                     = var.service_short
  config_short                      = var.config_short
  public_network_access_enabled     = false
  infrastructure_encryption_enabled = true
  create_encryption_scope           = false
  use_private_storage               = var.use_private_storage
  # Create containers for the application (all containers are private)
  containers = [
    { name = "vhds" }
  ]
  # Configure blob lifecycle management (default: delete after 7 days)
  container_delete_retention_days = var.container_delete_retention_days

  blob_delete_after_days = var.blob_delete_after_days

  subnet_id    = module.network.storage_subnet
  dnszone_name = module.network.storage_privdns_name
  dnszone_id   = module.network.storage_privdns_id
}

module "storage-strgt1dvgiasdiagnostics" {
  source = "./vendor/modules/azure//azure/storage_account"

  name                              = "diags"
  environment                       = var.environment
  azure_resource_prefix             = var.azure_resource_prefix
  service_short                     = var.service_short
  config_short                      = var.config_short
  public_network_access_enabled     = false
  infrastructure_encryption_enabled = true
  create_encryption_scope           = false
  use_private_storage               = var.use_private_storage
  # Create containers for the application (all containers are private)
  containers = [
    { name = "insights-logs-appserviceantivirusscanauditlogs" },
    { name = "insights-logs-appserviceapplogs" },
    { name = "insights-logs-appserviceauditlogs" },
    { name = "insights-logs-appserviceconsolelogs" },
    { name = "insights-logs-appservicefileauditlogs" },
    { name = "insights-logs-appservicehttplogs" },
    { name = "insights-logs-appserviceplatformlogs" },
    { name = "insights-logs-auditevent" },
    { name = "insights-logs-automatictuning" },
    { name = "insights-logs-azurepolicyevaluationdetails" },
    { name = "insights-logs-blocks" },
    { name = "insights-logs-databasewaitstatistics" },
    { name = "insights-logs-deadlocks" },
    { name = "insights-logs-errors" },
    { name = "insights-logs-querystoreruntimestatistics" },
    { name = "insights-logs-querystorewaitstatistics" },
    { name = "insights-logs-storagedelete" },
    { name = "insights-logs-storageread" },
    { name = "insights-logs-storagewrite" },
    { name = "insights-logs-timeouts" },
    { name = "insights-metrics-pt1m" },
    { name = "memorydumps" }
  ]
  # Configure blob lifecycle management (default: delete after 7 days)
  container_delete_retention_days = var.container_delete_retention_days

  blob_delete_after_days = var.blob_delete_after_days

  subnet_id    = module.network.storage_subnet
  dnszone_name = module.network.storage_privdns_name
  dnszone_id   = module.network.storage_privdns_id
}

# module "storage_private" {
#   source = "./vendor/modules/azure//azure/storage_account"

#   name                          = "lds"
#   environment                   = var.environment
#   azure_resource_prefix         = var.azure_resource_prefix
#   service_short                 = var.service_short
#   config_short                  = var.config_short
#   public_network_access_enabled = false
#   use_private_storage           = var.use_private_storage

#   infrastructure_encryption_enabled = true
#   create_encryption_scope           = false

#   # Create containers for the application (all containers are private)
#   containers = [
#     { name = "files" }
#   ]

#   # Configure blob lifecycle management (default: delete after 7 days)
#   container_delete_retention_days = var.container_delete_retention_days

#   blob_delete_after_days = var.blob_delete_after_days

#   subnet_id    = module.network.storage_subnet
#   dnszone_name = module.network.storage_privdns_name
#   dnszone_id   = module.network.storage_privdns_id

# }
