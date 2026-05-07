project_name = "eks-platform"
environment  = "prod"
aws_region   = "eu-west-2"

vpc_cidr             = "10.2.0.0/16"
availability_zones   = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
public_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
private_subnet_cidrs = ["10.2.11.0/24", "10.2.12.0/24", "10.2.13.0/24"]
single_nat_gateway   = false

cluster_version     = "1.29"
node_instance_types = ["t3.xlarge"]
node_desired_size   = 5
node_min_size       = 3
node_max_size       = 10
node_disk_size      = 50

enable_private_access = true
enable_public_access  = false

ecr_repositories = ["api", "frontend", "worker"]

database_name         = "appdb"
instance_class        = "db.t3.medium"
allocated_storage     = 100
max_allocated_storage = 500
multi_az              = true
deletion_protection   = true

domain_name = "eks-platform.internal"

prometheus_retention_days = 30
node_cpu_threshold        = 70
node_memory_threshold     = 70
alarm_email               = "benedictkorie785@gmail.com"