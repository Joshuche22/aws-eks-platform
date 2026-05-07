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

variable "domain_name" {
  description = "Root domain name for the hosted zone"
  type        = string
}

variable "create_public_zone" {
  description = "Whether to create a public hosted zone"
  type        = bool
  default     = true
}

variable "create_private_zone" {
  description = "Whether to create a private hosted zone for internal DNS"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "VPC ID for the private hosted zone association"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}
