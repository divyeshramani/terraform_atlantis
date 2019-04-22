### Public Subnet 1
resource "aws_subnet" "public_subnet1_app" {
  vpc_id                  = "${aws_vpc.vpc_app.id}"
  cidr_block              = "${var.cidrs["public1"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "${var.env}-public-subnet1"
  }
}
resource "aws_route_table_association" "public_subnet1_assoc" {
  subnet_id      = "${aws_subnet.public_subnet1_app.id}"
  route_table_id = "${aws_route_table.rt_public_app.id}"
}

### Public Subnet 2
resource "aws_subnet" "public_subnet2_app" {
  vpc_id                  = "${aws_vpc.vpc_app.id}"
  cidr_block              = "${var.cidrs["public2"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "${var.env}-public-subnet2"
  }
}
resource "aws_route_table_association" "public_subnet2_assoc" {
  subnet_id      = "${aws_subnet.public_subnet2_app.id}"
  route_table_id = "${aws_route_table.rt_public_app.id}"
}


### Private Subnet 1
resource "aws_subnet" "private_subnet1_app" {
  vpc_id                  = "${aws_vpc.vpc_app.id}"
  cidr_block              = "${var.cidrs["private1"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "${var.env}-private-subnet1"
  }
}
resource "aws_route_table_association" "private_subnet1_assoc" {
  subnet_id      = "${aws_subnet.private_subnet1_app.id}"
  route_table_id = "${aws_default_route_table.rt_detault.id}"
}

### Private Subnet 1
resource "aws_subnet" "private_subnet2_app" {
  vpc_id                  = "${aws_vpc.vpc_app.id}"
  cidr_block              = "${var.cidrs["private2"]}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "${var.env}-private-subnet2"
  }
}
resource "aws_route_table_association" "private_subnet2_assoc" {
  subnet_id      = "${aws_subnet.private_subnet2_app.id}"
  route_table_id = "${aws_default_route_table.rt_detault.id}"
}
