resource "aws_instance" "vm1" {
  ami = var.ami
  availability_zone = var.az_2a
  key_name = var.key_name
  instance_type = var.itype
  vpc_security_group_ids = var.sg_name

  tags = {
    Name = var.instance_name
  }
}