resource "aws_vpc" "vpc_app" {
    cidr_block = "${var.cidr}"
    enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw_app" {
    vpc_id = "${aws_vpc.vpc_app.vpc_id}"
}

resource "aws_route_table" "rt_public_app" {
    vpc_id = "${aws_vpc.vpc_app.vpc_id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw_app.id}"
    }
    tags {
        Name = "public"
    }
}

resource "aws_default_route_table" "rt_detault" {
    default_route_table_id = "${aws_vpc.vpc_app.default_route_table_id}"

    tags {
        Name = "private"
    }
}

