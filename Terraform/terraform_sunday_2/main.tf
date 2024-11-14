module "iam" {
  source             = "./modules/iam"
  employee_user_name = "jake"
}

module "ec2" {
  source   = "./modules/ec2"
  AZ       = "us-east-2b"
  ec2_name = module.iam.employee_user_name
}

# output "pub_ip" {
#   description = "Public IP of instance"
#   value       = module.ec2.pub_ip
# }

# output "private_ip" {
#   description = "Private IP for instance"
#   value       = module.ec2.private_ip
# }

# output "instance_id" {
#   description = "ID of instance"
#   value       = module.ec2.instance_id
# }