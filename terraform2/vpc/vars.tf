variable "vpccidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "vpcname" {
  description = "Name for VPC"
  type        = string
}

variable "subnet1cidr" {
  description = "CIDR for subnet 1"
  type        = string
}

variable "subnet1az" {
  description = "AZ zone for subnet 1"
  type        = string
}

variable "subnet2cidr" {
  description = "CIDR for subnet 2"
  type        = string
}

variable "subnet2az" {
  description = "AZ zone for subnet 2"
  type        = string
}

variable "sgname" {
  description = "Name of SG"
  type        = string
}

variable "sgcidr" {
  description = "CIDR or SG"
  type        = string
}