### Provider
provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

### Backend config
terraform {
  backend "s3" {
    region               = "us-east-1"
    bucket               = "my-app-terraform-remote-state"
    workspace_key_prefix = "/atlantis-test"
    key                  = "deployed.tfstate"
  }
}

### VPC 
module "vpc" {
  source = "modules/vpc"
  aws_region = "${var.aws_region}"
  env    = "${var.env}"
  cidr   = "${var.cidr}"
  cidrs  = "${var.cidrs}"
  internal_ips = "${var.internal_ips}"
}
