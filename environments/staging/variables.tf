variable "project_name" {
  description = "Project name used for resource naming and tagging"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway to reduce cost in dev"
  type        = bool
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
}

variable "node_instance_types" {
  description = "EC2 instance types for EKS nodes"
  type        = list(string)
}

variable "node_desired_size" {
  description = "Desired number of EKS worker nodes"
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of EKS worker nodes"
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of EKS worker nodes"
  type        = number
}

variable "node_disk_size" {
  description = "Disk size in GB for EKS worker nodes"
  type        = number
}

variable "enable_private_access" {
  description = "Enable private API server endpoint"
  type        = bool
}

variable "enable_public_access" {
  description = "Enable public API server endpoint"
  type        = bool
}

variable "ecr_repositories" {
  description = "List of ECR repository names to create"
  type        = list(string)
}

variable "database_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Initial RDS storage in GB"
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum RDS storage in GB"
  type        = number
}

variable "multi_az" {
  description = "Enable Multi-AZ for RDS"
  type        = bool
}

variable "deletion_protection" {
  description = "Enable deletion protection for RDS"
  type        = bool
}

variable "domain_name" {
  description = "Domain name for Route53 hosted zones"
  type        = string
}

variable "prometheus_retention_days" {
  description = "Days to retain Prometheus metrics"
  type        = number
}

variable "node_cpu_threshold" {
  description = "CPU threshold percentage for CloudWatch alarms"
  type        = number
}

variable "node_memory_threshold" {
  description = "Memory threshold percentage for CloudWatch alarms"
  type        = number
}

variable "alarm_email" {
  description = "Email for CloudWatch alarm notifications"
  type        = string
}

variable "grafana_admin_password" {
  description = "Grafana admin password"
  type        = string
  sensitive   = true
}