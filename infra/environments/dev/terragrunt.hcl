# Global terragrunt configuration
terraform_version_constraint = "~> 1.4.6"

remote_state {
  backend = "s3"
  config = {
    bucket         = "baqend-dev-terragrunt-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "tf-lock-table"
  }
}

inputs = {
 aws_region = "us-east-1"
 env        = "dev"
 master_account_id = "079541103782"
 cluster_name = "cluster"
}

generate "providers" {
  path      = "tg-providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
    required_providers {
        aws = "~> 5.2.0"
    }
}

provider "aws" {
    region = "eu-central-1"
}
EOF
}