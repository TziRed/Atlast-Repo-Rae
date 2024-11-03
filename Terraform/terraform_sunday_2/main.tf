module "iam" {
  source             = "./modules/iam"
  employee_user_name = "jake"
}

module "ec2" {
  source   = "./modules/ec2"
  AZ       = "us-east-2b"
  ec2_name = module.iam.employee_user_name
}