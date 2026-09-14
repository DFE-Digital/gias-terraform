module "edubase_web_app" {
  source = "./vendor/modules/azure//azure/app_service"

  app_type           = "web"
  web_app_name       = "edubase"
  subscription_short = "s158"
  env_short          = var.env_short
  environment        = var.environment
  service_name       = var.service_name
  service_short      = "gias"
  config_short       = var.config_short
  sp_sku_name        = "S2"
  logs = {
    http_logs = {
      file_system = {
        retention_in_days = 0
        retention_in_mb   = 35
      }
    }
  }
  application_stack = {
    dotnet_version = "v4.0"
  }
}
