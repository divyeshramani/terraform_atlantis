data "aws_availability_zones" "available" {}
variable "env" {}
variable "aws_region" {}
variable "cidr" {}
variable "internal_ips" {}
variable "cidrs" {
  type = "map"
}



