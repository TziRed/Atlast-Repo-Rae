variable "cidr" {
  description = "Cidr block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for our VPC"
  type        = string
}

variable "cidr_range1" {
  description = "CIDR range for subnet 1"
  type        = string
}

variable "az_2a" {
  description = "AZ zone for VPC subnet1"
}

variable "subnet_1" {
  description = "Name of subnet 1"
  type        = string
}

variable "cidr_range2" {
  description = "CIDR range for subnet 2"
  type        = string
}

variable "az_2b" {
  description = "AZ zone for VPC subnet2"
  type        = string
}

variable "subnet_2" {
  description = "Name of subnet 2"
}

variable "igw_name" {
  description = "Name of IGW"
  type        = string
}
variable "route_table_cidr" {
  description = "Route table CIDR block"
  type        = string
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}