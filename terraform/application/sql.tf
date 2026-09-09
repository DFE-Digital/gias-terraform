module "sql-test" {
  source = "./vendor/modules/azure//azure/sql"

  server_name_suffix    = "edubase"
  environment           = var.environment
  azure_resource_prefix = var.azure_resource_prefix
  service_name          = var.service_name
  service_short         = var.service_short
  config_short          = var.config_short

  databases = {
    edubase = {
      server_name_suffix                  = "edubase"
      azure_sql_sku                       = "BC_Gen5_2"
      storage_account_type                = "Local"
      lt_ret_pol_weekly_retention         = "P4W"
      st_ret_pol_backup_interval_in_hours = 24
      st_ret_pol_retention_days           = 14
    }
    sandbox = {
      server_name_suffix                  = "edubase-sandbox1"
      azure_sql_sku                       = "GP_Gen5_2"
      storage_account_type                = "Local"
      st_ret_pol_backup_interval_in_hours = 24
    }
  }

  private_endpoint_subnet_id = module.network.sql_subnet
  private_endpoints = {
    "dd-apimod" = {
      subresource = "sqlServer"
      resource_id = "default"
      dns_zone_id = module.network.sql_privdns_id
    }
    "dd-rest" = {
      subresource = "sqlServer"
      resource_id = "default"
      dns_zone_id = module.network.sql_privdns_id
    }
    "provider" = {
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
      name       = "app-api-t1dv-edubase-02"
      ip_address = "40.68.248.76"
    },
    {
      name       = "app-api-t1dv-edubase-03"
      ip_address = "40.68.253.160"
    },
    {
      name       = "app-api-t1dv-edubase-04"
      ip_address = "52.174.26.87"
    },
    {
      name       = "app-api-t1dv-edubase-05"
      ip_address = "40.68.253.49"
    },
    {
      name       = "app-api-t1dv-edubase-06"
      ip_address = "52.178.25.250"
    },
    {
      name       = "app-api-t1dv-edubase-07"
      ip_address = "40.68.253.41"
    },
    {
      name       = "app-api-t1dv-edubase-08"
      ip_address = "20.82.34.7"
    },
    {
      name       = "app-api-t1dv-edubase-09"
      ip_address = "20.82.34.92"
    },
    {
      name       = "app-api-t1dv-edubase-10"
      ip_address = "20.82.34.141"
    },
    {
      name       = "app-api-t1dv-edubase-11"
      ip_address = "20.82.34.156"
    },
    {
      name       = "app-api-t1dv-edubase-12"
      ip_address = "20.82.35.17"
    },
    {
      name       = "app-api-t1dv-edubase-13"
      ip_address = "20.82.35.148"
    },
    {
      name       = "azuredevops-59489"
      ip_address = "20.224.184.45"
    },
    {
      name             = "DfEGlobalProtectVPNRange1"
      start_ip_address = "208.127.46.232"
      end_ip_address   = "208.127.46.239"
    },
    {
      name             = "DfEGlobalProtectVPNRange2"
      start_ip_address = "208.127.46.240"
      end_ip_address   = "208.127.46.255"
    },
    {
      name       = "Prisma Access 2"
      ip_address = "208.127.45.248"
    },
    {
      name       = "Prisma Access 5"
      ip_address = "208.127.50.230"
    },
    {
      name       = "Prisma Access 6"
      ip_address = "208.127.52.236"
    },
    {
      name       = "Prisma Access 8"
      ip_address = "208.127.53.148"
    },
    {
      name       = "TemporarilyAllowRegressionTestsPipelineIp"
      ip_address = "68.221.179.161"
    }
  ]
}
