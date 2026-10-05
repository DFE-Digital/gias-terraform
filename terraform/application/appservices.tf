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
    java_version = "1.8"
  }
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY                    = ""
    APPINSIGHTS_PROFILERFEATURE_VERSION               = "1.0.0"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION               = "1.0.0"

    APPLICATIONINSIGHTS_CONFIGURATION_CONTENT = jsonencode({
      role = {
        name = "s158d01-gias-edubase-wa (main slot)"
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

module "edubase_web_app_api" {
  source = "./vendor/modules/azure//azure/app_service"

  app_type           = "web"
  web_app_name       = "edubase-api"
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
    java_version = "1.8"
  }
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY                    = ""
    APPINSIGHTS_PROFILERFEATURE_VERSION               = "1.0.0"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION               = "1.0.0"

    APPLICATIONINSIGHTS_CONFIGURATION_CONTENT = jsonencode({
      role = {
        name = "s158d01-gias-edubase-api-wa (main slot)"
      }
    })

    APPLICATIONINSIGHTS_CONNECTION_STRING            = ""
    APPLICATIONINSIGHTS_INSTRUMENTATION_JDBC_ENABLED = "true"
    ApplicationInsightsAgent_EXTENSION_VERSION       = "~2"
    DiagnosticServices_EXTENSION_VERSION             = "~3"
    InstrumentationEngine_EXTENSION_VERSION          = "disabled"

    JAVA_OPTS = "-Djava.net.preferIPv4Stack=true -Dsun.java2d.d3d=false -Duser.country=GB -Duser.timezone=Europe/London -Duser.language=en -Denvironment=dev-azure -XX:+CMSClassUnloadingEnabled -XX:+HeapDumpOnOutOfMemoryError -XX:SurvivorRatio=6 -XX:MaxNewSize=1536m -XX:NewSize=1536m -XX:-UseAdaptiveSizePolicy -XX:+PrintTenuringDistribution -Xms6g -Xmx6g -Xss256k"
    SnapshotDebugger_EXTENSION_VERSION               = "disabled"
    WEBSITE_APPINSIGHTS_ENCRYPTEDAPIKEY              = "kvsecret"
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

module "gias_web_app" {
  source = "./vendor/modules/azure//azure/app_service"

  app_type           = "web"
  web_app_name       = "gias"
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
    AllowedForwardedHostNames                        = "dev1.get-information-schools.service.gov.uk,www.dev1.get-information-schools.service.gov.uk"
    "api:Password"                                   = "kvsecret"
    APPINSIGHTS_INSTRUMENTATIONKEY                   = ""
    APPINSIGHTS_PROFILERFEATURE_VERSION              = "1.0.0"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION              = "1.0.0"
    ApplicationInsightsAgent_EXTENSION_VERSION       = "~2"
    AzureMapsApiKey                                  = "kvsecret"
    ClarityKey                                       = "kvsecret"
    CompaniesHouseApiKey                             = "kvsecret"
    DiagnosticServices_EXTENSION_VERSION             = "~3"
    EnableApiLogging                                 = "true"
    Environment                                      = "dev"
    ExternalAuthDefaultCallbackUrl                   = "https://dev1.get-information-schools.service.gov.uk/Account/ExternalLoginCallback123"
    ExternalIdpEntityId                              = "GIAS"
    Feature_ApiRecorderSessionItemsMigration         = "true"
    Feature_DataQualityStatusMigration               = "true"
    Feature_FaqGroupsMigration                       = "true"
    Feature_FaqItemsMigration                        = "true"
    Feature_GlossaryItemsMigration                   = "true"
    Feature_LocalAuthoritySetsMigration              = "true"
    Feature_NewsArticlesMigration                    = "true"
    Feature_NotificationBannersMigration             = "true"
    Feature_NotificationTemplatesMigration           = "true"
    Feature_TokensMigration                          = "true"
    Feature_UserPreferencesMigration                 = "true"
    FinancialBenchmarkingApiURL                      = "https://api.schools-financial-benchmarking.service.gov.uk/"
    FinancialBenchmarkingURL                         = "https://schools-financial-benchmarking.service.gov.uk/"
    FscpdServiceName                                 = "Compare School and College Performance in England"
    "gias.iebt.sen"                                  = "true"
    "gias.iebt.suspended"                            = "false"
    GoogleApiKey                                     = "kvsecret"
    GoogleTagManagerKey                              = "kvsecret"
    "HttpAuthModule.Credentials"                     = "kvsecret"
    InstrumentationEngine_EXTENSION_VERSION          = "~1"
    LoginProviderName                                = "LoginProviderName"
    LookupApiBaseAddress                             = "https://s158d01-gias-edubase-api-wa.azurewebsites.net/edubase/rest/"
    LookupApiPassword                                = "kvsecret"
    LookupApiUsername                                = "kvsecret"
    MetadataLocation                                 = "https://test-gias.signin.education.gov.uk/saml/metadata"
    MobileAppsManagement_EXTENSION_VERSION           = "latest"
    OSPlacesApiKey                                   = "kvsecret"
    "owin:appStartup"                                = "SASimulatorConfiguration"
    PublicOrigin_backupNotUsed                       = "https://www.dev1.get-information-schools.service.gov.uk/"
    SASimulatorGuid                                  = "kvsecret"
    "ServiceProvider.Certificate.Thumbprint"         = "kvsecret"
    SnapshotDebugger_EXTENSION_VERSION               = "~1"
    SQLDatabase                                      = "t1dv-edubase"
    SQLServer                                        = "s158d01-gias-dv-edubase-sql.database.windws.net"
    TexunaApiBaseAddress                             = "https://s158d01-gias-edubase-api-wa.azurewebsites.net/edubase/rest/"
    WEBSITE_APPINSIGHTS_ENCRYPTEDAPIKEY              = "kvsecret"
    WEBSITE_DAAS_STORAGE_CONNECTIONSTRING            = "kvsecret"
    WEBSITE_TIME_ZONE                                = "GMT Standard Time"
    XDT_MicrosoftApplicationInsights_BaseExtensions  = "~1"
    XDT_MicrosoftApplicationInsights_Mode            = "recommended"
    xSourceIpOverride                                = "gias-frontend"


    APPLICATIONINSIGHTS_CONFIGURATION_CONTENT = jsonencode({
      role = {
        name = "s158d01-gias-gias-wa (main slot)"
      }
    })
  }
  sticky_app_settings = [
      "AllowedForwardedHostNames",
      "api:Password",
      "APPINSIGHTS_INSTRUMENTATIONKEY",
      "APPINSIGHTS_PROFILERFEATURE_VERSION",
      "APPINSIGHTS_SNAPSHOTFEATURE_VERSION",
      "ApplicationInsightsAgent_EXTENSION_VERSION",
      "AzureMapsApiKey",
      "ClarityKey",
      "CompaniesHouseApiKey",
      "DiagnosticServices_EXTENSION_VERSION",
      "Environment",
      "ExternalAuthDefaultCallbackUrl",
      "ExternalIdpEntityId",
      "FinancialBenchmarkingApiURL",
      "FinancialBenchmarkingURL",
      "FscpdServiceName",
      "gias.iebt.sen",
      "GoogleApiKey",
      "GoogleTagManagerKey",
      "HttpAuthModule.Credentials",
      "InstrumentationEngine_EXTENSION_VERSION",
      "LoginProviderName",
      "LookupApiBaseAddress",
      "LookupApiPassword",
      "LookupApiUsername",
      "MetadataLocation",
      "MobileAppsManagement_EXTENSION_VERSION",
      "OSPlacesApiKey",
      "owin:appStartup",
      "PublicOrigin_backupNotUsed",
      "SASimulatorGuid",
      "ServiceProvider.Certificate.Thumbprint",
      "SnapshotDebugger_EXTENSION_VERSION",
      "TexunaApiBaseAddress",
      "WEBSITE_TIME_ZONE",
      "XDT_MicrosoftApplicationInsights_BaseExtensions",
      "XDT_MicrosoftApplicationInsights_Mode",
      "xSourceIpOverride",
    ]
  slots = {
    gias-dev = {}
    gias-exp = {}
    gias-dev-sandbox-holding = {}
    gias-dev-sandbox1 = {}
    gias-dev-sandbox2 = {}
  }
}

module "dfe-signinsimulator" {
  source = "./vendor/modules/azure//azure/app_service"

  app_type           = "web"
  web_app_name       = "dfe-signinsimulator"
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
    dummyappsetting = "dummyappsetting"
  }
  sticky_app_settings = [
      "dummyappsetting",
    ]
  slots = {
  }
}