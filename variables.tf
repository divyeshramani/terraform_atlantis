variable "env" {}
variable "aws_profile" {}
variable "aws_region" {}

variable "remote_state_bucket" {
  default = "my-app-terraform-remote-state"
}

variable "cidr" {}
variable "cidrs" {
  type = "map"
}
variable "internal_ips" {}