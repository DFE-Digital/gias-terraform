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
variable "config_short" {
  type        = string
  description = "Short name of the environment configuration, e.g. dv, st, pd..."
}
variable "service_name" {
  type        = string
  description = "Full name of the service. Lowercase and hyphen separated"
}
variable "service_short" {
  type        = string
  description = "Short name to identify the service. Up to 6 charcters."
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
variable "blob_delete_after_days" {
  type        = number
  description = "Number of days after which blobs will be deleted. Set to 0 to disable automatic deletion."
  default     = 7
  validation {
    condition     = var.blob_delete_after_days >= 0 && var.blob_delete_after_days <= 9999
    error_message = "The blob_delete_after_days must be between 0 and 9999. Set to 0 to disable."
  }
}

variable "blob_delete_retention_days" {
  type        = number
  description = "Number of days to retain deleted blobs. Set to null to disable retention policy."
  default     = null
  validation {
    condition     = var.blob_delete_retention_days == null ? true : (var.blob_delete_retention_days >= 1 && var.blob_delete_retention_days <= 365)
    error_message = "The blob_delete_retention_days must be between 1 and 365, or null to disable retention policy"
  }
}

variable "container_delete_retention_days" {
  type        = number
  description = "Number of days to retain deleted containers. Set to null to disable retention policy."
  default     = null
  validation {
    condition     = var.container_delete_retention_days == null ? true : (var.container_delete_retention_days >= 1 && var.container_delete_retention_days <= 365)
    error_message = "The container_delete_retention_days must be between 1 and 365, or null to disable retention policy"
  }
}

variable "use_private_storage" {
  type        = bool
  description = "Use private endpoints and private DNS for storage accounts"
  default     = true
}

variable "redis_managed_cache_sku_name" {
  type    = string
  default = "Balanced_B1"
}

variable "enable_logit" { default = true }

variable "deploy_managed_redis" {
  description = "Whether to create a Managed Redis instance"
  type        = bool
  default     = true
}
