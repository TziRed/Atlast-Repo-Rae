provider "aws" {
  region                   = "us-east-2" #Region of the AWS user
  profile                  = "root"      #Name of the AWS user
  shared_config_files      = ["/home/ec2-user/.aws/config"]
  shared_credentials_files = ["/home/ec2-user/.aws/credentials"]
}

// Create ec2 instance
resource "aws_instance" "tf_instance" {
  ami                    = var.al2_ami
  instance_type          = var.instance_type
  availability_zone      = var.az_2b
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }
}

// Create VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.cidr_range_16
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

// Create 2 public VPC Subnets
resource "aws_subnet" "tf_public_subnet1" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.cidr_range_subnet1
  availability_zone       = var.az_2a
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_1_name
  }
}

resource "aws_subnet" "tf_public_subnet2" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.cidr_range_subnet2
  availability_zone       = var.az_2b
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_2_name
  }
}

// Create Internet Gateway
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = var.igw_name
  }
}

// Create route table
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

// Subnet association for route table
resource "aws_route_table_association" "tf_rta1" {
  subnet_id      = aws_subnet.tf_public_subnet1.id
  route_table_id = aws_route_table.tf_route_table.id
}

resource "aws_route_table_association" "tf_rta2" {
  subnet_id      = aws_subnet.tf_public_subnet2.id
  route_table_id = aws_route_table.tf_route_table.id
}