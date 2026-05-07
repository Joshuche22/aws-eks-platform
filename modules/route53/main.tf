locals {
  name_prefix = "${var.project_name}-${var.environment}"
  common_tags = merge(var.tags, {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  })
}

resource "aws_route53_zone" "public" {
  count = var.create_public_zone ? 1 : 0
  name  = var.environment == "prod" ? var.domain_name : "${var.environment}.${var.domain_name}"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-public-zone"
    Type = "public"
  })
}

resource "aws_route53_zone" "private" {
  count = var.create_private_zone ? 1 : 0
  name  = "internal.${var.environment}.${var.domain_name}"

  vpc {
    vpc_id = var.vpc_id
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-private-zone"
    Type = "private"
  })
}

resource "aws_route53_health_check" "public" {
  count             = var.create_public_zone ? 1 : 0
  fqdn              = var.environment == "prod" ? var.domain_name : "${var.environment}.${var.domain_name}"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/health"
  failure_threshold = 3
  request_interval  = 30

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-health-check"
  })
}
