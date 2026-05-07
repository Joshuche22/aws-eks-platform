variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "project_name" {
  description = "Project name used for resource naming and tagging"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster to deploy monitoring into"
  type        = string
}

variable "cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  type        = string
}

variable "cluster_certificate_authority" {
  description = "Certificate authority data for the EKS cluster"
  type        = string
}

variable "prometheus_retention_days" {
  description = "Number of days to retain Prometheus metrics"
  type        = number
  default     = 15
}

variable "grafana_admin_password" {
  description = "Admin password for Grafana"
  type        = string
  sensitive   = true
}

variable "enable_cloudwatch_alarms" {
  description = "Whether to create CloudWatch alarms for the EKS cluster"
  type        = bool
  default     = true
}

variable "alarm_email" {
  description = "Email address to send CloudWatch alarm notifications to"
  type        = string
}

variable "node_cpu_threshold" {
  description = "CPU utilisation percentage threshold for node alarms"
  type        = number
  default     = 80
}

variable "node_memory_threshold" {
  description = "Memory utilisation percentage threshold for node alarms"
  type        = number
  default     = 80
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}