resource "aws_instance" "instance1" {
  ami                         = "ami-050cd642fd83388e4"
  associate_public_ip_address = true
  availability_zone           = "us-east-2b"
  instance_type               = "t2.micro"
  key_name                    = "vm_key"

  tags = {
    "Name" = "rae"
  }
}