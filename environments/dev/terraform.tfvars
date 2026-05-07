project_name = "eks-platform"
environment  = "dev"
aws_region   = "eu-west-2"

vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
single_nat_gateway   = true

cluster_version     = "1.29"
node_instance_types = ["t3.medium"]
node_desired_size   = 2
node_min_size       = 1
node_max_size       = 3
node_disk_size      = 20

enable_private_access = true
enable_public_access  = false

ecr_repositories = ["api", "frontend", "worker"]

database_name         = "appdb"
instance_class        = "db.t3.micro"
allocated_storage     = 20
max_allocated_storage = 50
multi_az              = false
deletion_protection   = false

domain_name = "dev.eks-platform.internal"

prometheus_retention_days = 7
node_cpu_threshold        = 80
node_memory_threshold     = 80
alarm_email               = "benedictkorie785@gmail.com"