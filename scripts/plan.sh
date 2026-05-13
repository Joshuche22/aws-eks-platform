#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-dev}
echo "Running Terraform plan for environment: $ENV"

cd environments/$ENV
terraform plan -var-file="terraform.tfvars" -out="$ENV.tfplan"

echo "Plan saved to $ENV.tfplan"
