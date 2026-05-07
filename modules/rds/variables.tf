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

variable "vpc_id" {
  description = "ID of the VPC where RDS will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "allowed_security_group_ids" {
  description = "List of security group IDs allowed to connect to RDS"
  type        = list(string)
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "15.4"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Initial allocated storage in GB"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum storage for autoscaling in GB"
  type        = number
  default     = 100
}

variable "database_name" {
  description = "Name of the initial database"
  type        = string
}

variable "master_username" {
  description = "Master username for the database"
  type        = string
  default     = "dbadmin"
}

variable "backup_retention_period" {
  description = "Number of days to retain automated backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Preferred backup window in UTC"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
  default     = "Mon:04:00-Mon:05:00"
}

variable "multi_az" {
  description = "Whether to enable Multi-AZ deployment for high availability"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection on the RDS instance"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}
