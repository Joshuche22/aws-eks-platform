#!/usr/bin/env python3
"""
Generate terraform.tfvars files for each environment.
Usage: python3 generate_tfvars.py --env dev
"""

import argparse
import os

CONFIGS = {
    "dev": {
        "cluster_name": "eks-dev",
        "region": "eu-west-1",
        "node_instance_type": "t3.medium",
        "node_count": 2,
        "enable_monitoring": False,
    },
    "staging": {
        "cluster_name": "eks-staging",
        "region": "eu-west-1",
        "node_instance_type": "t3.large",
        "node_count": 3,
        "enable_monitoring": True,
    },
    "prod": {
        "cluster_name": "eks-prod",
        "region": "eu-west-1",
        "node_instance_type": "t3.xlarge",
        "node_count": 5,
        "enable_monitoring": True,
    },
}

def generate(env):
    config = CONFIGS.get(env)
    if not config:
        print(f"Unknown environment: {env}")
        return

    output_path = os.path.join("environments", env, "terraform.tfvars")
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    with open(output_path, "w") as f:
        for key, value in config.items():
            if isinstance(value, bool):
                f.write(f'{key} = {str(value).lower()}\n')
            elif isinstance(value, str):
                f.write(f'{key} = "{value}"\n')
            else:
                f.write(f'{key} = {value}\n')

    print(f"Generated {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--env", required=True, choices=["dev", "staging", "prod"])
    args = parser.parse_args()
    generate(args.env)