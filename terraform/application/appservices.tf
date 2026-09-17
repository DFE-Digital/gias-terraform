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
  sp_sku_name        = "S3"
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
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY                    = ""
    APPINSIGHTS_PROFILERFEATURE_VERSION               = "1.0.0"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION               = "1.0.0"

    APPLICATIONINSIGHTS_CONFIGURATION_CONTENT = jsonencode({
      role = {
        name = "app-t1dv-edubase (main slot)"
      }
    })

    APPLICATIONINSIGHTS_CONNECTION_STRING            = ""
    APPLICATIONINSIGHTS_INSTRUMENTATION_JDBC_ENABLED = "true"
    ApplicationInsightsAgent_EXTENSION_VERSION       = "~2"
    DiagnosticServices_EXTENSION_VERSION             = "~3"
    InstrumentationEngine_EXTENSION_VERSION          = "disabled"

    JAVA_OPTS = "-Djava.net.preferIPv4Stack=true -Dsun.java2d.d3d=false -Duser.country=GB -Duser.timezone=Europe/London -Duser.language=en -Denvironment=dev-azure-backend -XX:+CMSClassUnloadingEnabled -XX:+HeapDumpOnOutOfMemoryError -XX:SurvivorRatio=6 -XX:MaxNewSize=1536m -XX:NewSize=1536m -XX:-UseAdaptiveSizePolicy -XX:+PrintTenuringDistribution -Xms6g -Xmx6g -Xss256k"

    SnapshotDebugger_EXTENSION_VERSION               = "disabled"
    WEBSITE_ENABLE_SYNC_UPDATE_SITE                  = "true"
    WEBSITE_TIME_ZONE                                = "GMT Standard Time"
    XDT_MicrosoftApplicationInsights_BaseExtensions  = "disabled"
    XDT_MicrosoftApplicationInsights_Java            = "1"
    XDT_MicrosoftApplicationInsights_Mode            = "recommended"
    XDT_MicrosoftApplicationInsights_NodeJS          = "1"
    XDT_MicrosoftApplicationInsights_PreemptSdk      = "disabled"
  }
  sticky_app_settings = [
      "APPINSIGHTS_INSTRUMENTATIONKEY",
      "APPINSIGHTS_PROFILERFEATURE_VERSION",
      "APPINSIGHTS_SNAPSHOTFEATURE_VERSION",
      "APPLICATIONINSIGHTS_CONFIGURATION_CONTENT",
      "APPLICATIONINSIGHTS_INSTRUMENTATION_JDBC_ENABLED",
      "ApplicationInsightsAgent_EXTENSION_VERSION",
      "DiagnosticServices_EXTENSION_VERSION",
      "InstrumentationEngine_EXTENSION_VERSION",
      "JAVA_OPTS",
      "SnapshotDebugger_EXTENSION_VERSION",
      "WEBSITE_TIME_ZONE",
      "XDT_MicrosoftApplicationInsights_BaseExtensions",
      "XDT_MicrosoftApplicationInsights_Mode",
      "XDT_MicrosoftApplicationInsights_NodeJS",
      "XDT_MicrosoftApplicationInsights_PreemptSdk",
    ]
  slots = {
    staging = {}
    sandbox1 = {}
    sandbox2 = {}
    sandbox3 = {}
  }
}
