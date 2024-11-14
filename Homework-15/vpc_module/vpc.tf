resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "vpc_subnet1" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.cidr_range1
  availability_zone       = var.az_2a
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_1
  }
}

resource "aws_subnet" "vpc_subnet2" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.cidr_range2
  availability_zone       = var.az_2b
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_2
  }
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "tf_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.tf_igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "tf_rta1" {
  subnet_id      = aws_subnet.vpc_subnet1.id
  route_table_id = aws_route_table.tf_route_table.id
}

resource "aws_route_table_association" "tf_rta2" {
  subnet_id      = aws_subnet.vpc_subnet2.id
  route_table_id = aws_route_table.tf_route_table.id
}