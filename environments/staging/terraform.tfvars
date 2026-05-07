project_name = "eks-platform"
environment  = "staging"
aws_region   = "eu-west-2"

vpc_cidr             = "10.1.0.0/16"
availability_zones   = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]
single_nat_gateway   = false

cluster_version     = "1.29"
node_instance_types = ["t3.large"]
node_desired_size   = 3
node_min_size       = 2
node_max_size       = 5
node_disk_size      = 30

enable_private_access = true
enable_public_access  = false

ecr_repositories = ["api", "frontend", "worker"]

database_name         = "appdb"
instance_class        = "db.t3.small"
allocated_storage     = 50
max_allocated_storage = 100
multi_az              = true
deletion_protection   = true

domain_name = "staging.eks-platform.internal"

prometheus_retention_days = 15
node_cpu_threshold        = 75
node_memory_threshold     = 75
alarm_email               = "benedictkorie785@gmail.com"