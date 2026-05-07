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

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to deploy subnets into"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets, one per availability zone"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets, one per availability zone"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to provision NAT gateways for private subnet egress"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway instead of one per AZ. Reduces cost in dev/staging at the expense of AZ resilience"
  type        = bool
  default     = false
}

variable "enable_vpc_flow_logs" {
  description = "Whether to enable VPC flow logs for network traffic auditing"
  type        = bool
  default     = true
}

variable "flow_logs_retention_days" {
  description = "Number of days to retain VPC flow logs in CloudWatch"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}
