provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

module "vpc" {
  source = "../../modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  single_nat_gateway   = var.single_nat_gateway
  enable_nat_gateway   = true
  enable_vpc_flow_logs = true
}

module "iam" {
  source = "../../modules/iam"

  project_name      = var.project_name
  environment       = var.environment
  eks_cluster_name  = "${var.project_name}-${var.environment}-eks"
  enable_irsa       = true
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider_url = module.eks.oidc_provider_url
}

module "ecr" {
  source = "../../modules/ecr"

  project_name                 = var.project_name
  environment                  = var.environment
  repositories                 = var.ecr_repositories
  image_tag_mutability         = "MUTABLE"
  scan_on_push                 = true
  untagged_image_retention_days = 7
  tagged_image_retention_count  = 10
}

module "eks" {
  source = "../../modules/eks"

  project_name        = var.project_name
  environment         = var.environment
  cluster_version     = var.cluster_version
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  public_subnet_ids   = module.vpc.public_subnet_ids
  cluster_role_arn    = module.iam.eks_cluster_role_arn
  node_group_role_arn = module.iam.eks_node_group_role_arn
  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size
  node_disk_size      = var.node_disk_size
  enable_private_access = var.enable_private_access
  enable_public_access  = var.enable_public_access
}

module "rds" {
  source = "../../modules/rds"

  project_name               = var.project_name
  environment                = var.environment
  vpc_id                     = module.vpc.vpc_id
  private_subnet_ids         = module.vpc.private_subnet_ids
  allowed_security_group_ids = [module.eks.node_security_group_id]
  database_name              = var.database_name
  instance_class             = var.instance_class
  allocated_storage          = var.allocated_storage
  max_allocated_storage      = var.max_allocated_storage
  multi_az                   = var.multi_az
  deletion_protection        = var.deletion_protection
}

module "route53" {
  source = "../../modules/route53"

  project_name        = var.project_name
  environment         = var.environment
  domain_name         = var.domain_name
  vpc_id              = module.vpc.vpc_id
  create_public_zone  = false
  create_private_zone = true
}

module "monitoring" {
  source = "../../modules/monitoring"

  project_name                  = var.project_name
  environment                   = var.environment
  cluster_name                  = module.eks.cluster_name
  cluster_endpoint              = module.eks.cluster_endpoint
  cluster_certificate_authority = module.eks.cluster_certificate_authority
  prometheus_retention_days     = var.prometheus_retention_days
  grafana_admin_password        = var.grafana_admin_password
  enable_cloudwatch_alarms      = true
  alarm_email                   = var.alarm_email
  node_cpu_threshold            = var.node_cpu_threshold
  node_memory_threshold         = var.node_memory_threshold
}