data "aws_availability_zones" "available" {}
variable "env" {}
variable "cidr" {}
variable "internal-ips" {}

variable "cidrs" {
  type = "map"
}



