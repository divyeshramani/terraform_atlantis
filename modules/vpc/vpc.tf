### VPC
resource "aws_vpc" "vpc_app" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "${var.env}-vpc"
  }
}

### Internet Gateway
resource "aws_internet_gateway" "igw_app" {
  vpc_id = "${aws_vpc.vpc_app.id}"

  tags {
    Name = "${var.env}-ig"
  }
}

### Public Route Table
resource "aws_route_table" "rt_public_app" {
  vpc_id = "${aws_vpc.vpc_app.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw_app.id}"
  }

  tags {
    Name = "${var.env}-public-rt"
  }
}

### Private Route Table
resource "aws_default_route_table" "rt_detault" {
  default_route_table_id = "${aws_vpc.vpc_app.default_route_table_id}"

  tags {
    Name = "${var.env}-private-rt"
  }
}

#create S3 VPC endpoint
resource "aws_vpc_endpoint" "s3_endpoint-private" {
  vpc_id       = "${aws_vpc.vpc_app.id}"
  service_name = "com.amazonaws.${var.aws_region}.s3"

  route_table_ids = ["${aws_vpc.vpc_app.main_route_table_id}",
    "${aws_route_table.rt_public_app.id}",
  ]

  policy = <<POLICY
{
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ]
}
POLICY
}
