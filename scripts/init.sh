#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-dev}
echo "Initialising Terraform for environment: $ENV"

cd environments/$ENV
terraform init \
  -backend-config="bucket=eks-platform-tfstate-$ENV" \
  -backend-config="key=$ENV/terraform.tfstate" \
  -backend-config="region=eu-west-1"

echo "Init complete for $ENV"
