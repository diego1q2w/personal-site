terraform {
  required_version = "~> 0.12.0"

  backend "s3" {
    bucket               = "terraform-personal-site"
    key                  = "tfstate-common"
    region               = "eu-west-1"
    workspace_key_prefix = "workspaces"
  }
}

provider "aws" {
  version = ">= 2.0.0, < 3.0.0"
  region  = "eu-west-1"
}
