variable "ami" {
  description = "AMI instance ID"
  type = string
}

variable "az_2a" {
  description = "AZ for us-east-2a"
  type = string
}

variable "key_name" {
  description = "Key name for instance"
  type = string
}

variable "itype" {
  description = "Type of instance"
  type = string
}

variable "sg_name" {
  description = "SG ID for instance"
  type = list(string)
}

variable "instance_name" {
  description = "Name of instance"
  type = string
}