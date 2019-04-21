provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

terraform {
  backend "s3" {
    region               = "us-east-1"
    bucket               = "my-app-terraform-remote-state"
    workspace_key_prefix = "/atlantis-test"
    key                  = "deployed.tfstate"
  }
}

module "vpc" {
  source = "modules/vpc"
  cidr = "${var.cidr}"
}


# data "aws_availability_zones" "available" {}

# #### VPC 
# resource "aws_vpc" "vpc_ans" {
#   cidr_block           = "${var.cidr}"
#   enable_dns_hostnames = true
# }

# #### Internet Gateway
# resource "aws_internet_gateway" "ig_ans" {
#   vpc_id = "${aws_vpc.vpc_ans.id}"
# }

# #### Route Tables
# resource "aws_route_table" "rt_public_ans" {
#   vpc_id = "${aws_vpc.vpc_ans.id}"

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = "${aws_internet_gateway.ig_ans.id}"
#   }

#   tags {
#     Name = "public"
#   }
# }
