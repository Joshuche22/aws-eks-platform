#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-dev}
echo "WARNING: Destroying infrastructure for environment: $ENV"
read -p "Are you sure? (yes/no): " CONFIRM

if [[ "$CONFIRM" == "yes" ]]; then
  cd environments/$ENV
  terraform destroy -var-file="terraform.tfvars" -auto-approve
  echo "Destroy complete for $ENV"
else
  echo "Aborted."
fi
