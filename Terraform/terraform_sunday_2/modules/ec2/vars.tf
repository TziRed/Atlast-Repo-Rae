variable "ami" {
  type    = string
  default = "ami-0374badf0de443688"
}

variable "AZ" {
  type    = string
  default = "us-east-2a"
}

variable "pub_ip_bool" {
  type    = bool
  default = true
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "vm_key"
}

variable "ec2_name" {
  type    = string
  default = "testvm"
}