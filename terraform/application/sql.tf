module "sql-test" {
  source = "./vendor/modules/azure//azure/sql"

  server_name_suffix    = "api"
  environment           = var.environment
  azure_resource_prefix = var.azure_resource_prefix
  service_name          = var.service_name
  service_short         = var.service_short
  config_short          = var.config_short


  azure_sql_sku                       = "BC_Gen5_2"
  storage_account_type                = "Local"
  lt_ret_pol_weekly_retention         = "P4W"
  st_ret_pol_backup_interval_in_hours = 24
  st_ret_pol_retention_days           = 14

  # subnet_id    = module.network.sql_subnet

  private_endpoint_subnet_id = module.network.sql_subnet
  private_endpoints = {
    "dd-apimod" = {
      # resource_id  = azurerm_mssql_server.main.id
      # dns_zone_id  = module.network.sql_dns_zone_id
      subresource = "sqlServer"
      resource_id = "default"
      dns_zone_id = module.network.sql_privdns_id
    }
  }

  firewall_rules = [
    {
      name       = "app-api-t1dv-edubase-01"
      ip_address = "52.232.19.237"
    },
    {
      name             = "AllowDevOps"
      start_ip_address = "208.127.46.232"
      end_ip_address   = "208.127.46.239"
    }
  ]
}
