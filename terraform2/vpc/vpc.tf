// CREATE VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.vpccidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpcname
  }
}
//CREATE 2 PUBLIC SUBNETS
resource "aws_subnet" "tf_public_subnet1" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.subnet1cidr
  availability_zone       = var.subnet1az
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet1cidr
  }
}
resource "aws_subnet" "tf_public_subnet2" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.subnet2cidr
  availability_zone       = var.subnet2az
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet2cidr
  }
}

// Create IGW
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "terraigw"
  }
}

// Create Route Table 
resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.igw1.id
  }
  tags = {
    Name = "routetable1"
  }
}

// Subnet Associations For Route Table
resource "aws_route_table_association" "routeass1" {
  subnet_id      = aws_subnet.tf_public_subnet1.id
  route_table_id = aws_route_table.route1.id
}