variable "client_name" {
  description = "The name of the client"
  type        = string
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
  type        = string
}

variable "stack" {
  description = "The stack name or application name"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "location_short" {
  description = "Short version of the Azure region name"
  type        = string
}

variable "cluster_log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  default     = "my-log-analytics-workspace"
}


variable "logs_destinations_ids" {
  description = "List of IDs for logs destinations, such as storage account and log analytics workspace"
  type        = list(string)
}

variable "extra_tags" {
  description = "Additional tags to add to resources"
  type        = map(string)
  default     = {}
}

variable "sku" {
  description = "The SKU for the Azure Container Registry (e.g., Basic, Standard, Premium)"
  type        = string
  default     = "Standard"
}

variable "create_resource_group" {
  type     = bool
  default  = true
  nullable = false
}

variable "size" {
  type     = string
  default  = "Standard_A2"
  nullable = false
}

variable "enable_hpa" {
  type    = bool
  default = true
}
