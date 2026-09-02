variable "subscription_prefix" {
  description = "Prefix for the subscription name (for example `s189`)."
}

variable "environment" {
  type        = string
  description = "Name of the deployed environment in AKS"
}

variable "azure_resource_prefix" {
  type        = string
  description = "Standard resource prefix. Usually s189t01 (test) or s189p01 (production)"
}

variable "config" {
  type        = string
  description = "Long name of the environment configuration, e.g. development, staging, production..."
}

variable "env_short" {
  type        = string
  description = "Short name of the environment configuration, e.g. dv, st, pd..."
}

variable "service_name" {
  type        = string
  description = "Full name of the service. Lowercase and hyphen separated"
}

variable "service_short" {
  type        = string
  description = "Short name to identify the service. Up to 6 characters."
}

variable "deploy_azure_backing_services" {
  type        = bool
  default     = true
  description = "Deploy real Azure backing services like databases, as opposed to containers inside of AKS"
}

variable "external_url" {
  type        = string
  default     = null
  description = "Healthcheck URL for StatusCake uptime monitoring"
}

variable "apex_url" {
  type        = string
  default     = null
  description = "URL for StatusCake SSL certificate monitoring. Only for DNS zone apex domain."
}

variable "statuscake_contact_groups" {
  type        = list(any)
  default     = []
  description = "ID of the contact group in statuscake web UI"
}

variable "enable_monitoring" {
  type        = bool
  default     = false
  description = "Enable monitoring and alerting"
}

variable "enable_logit" { default = true }

variable "probe_path" {
  type        = string
  default     = "/healthcheck"
  description = "Path for the liveness and startup probe. The probe can be disabled by setting this to null."
}

# Redis Variables
variable "deploy_managed_redis" {
  description = "Whether to create a Managed Redis instance"
  type        = bool
  default     = true
}

variable "redis_managed_cache_sku_name" {
  type    = string
  default = "Balanced_B1"
}
