module "ec2_module" {
  source = "./ec2_module"

  ami = "ami-0e593d2b811299b15"
  az_2a = "us-east-2a"
  key_name = "vm_key"
  itype = "t2.micro"
  sg_name = [ "sg-0b564b69f0f2cd87f" ]
  instance_name = "tf_instance"
}

output "ec2_public_ip" {
  value = module.ec2_module.ec2_public_ip
}

output "ec2_dns" {
  value = module.ec2_module.ec2_dns
}