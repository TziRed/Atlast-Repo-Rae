module "vpc_module" {
  source           = "./vpc_module"
  cidr             = "10.0.0.0/16"
  vpc_name         = "assign_15_vpc"
  cidr_range1      = "10.0.0.0/20"
  cidr_range2      = "10.0.16.0/20"
  az_2a            = "us-east-2a"
  az_2b            = "us-east-2b"
  subnet_1         = "tf_subnet1"
  subnet_2         = "tf_subnet2"
  igw_name         = "tf_igw_assing_15"
  route_table_cidr = "0.0.0.0/0"
  route_table_name = "tf_route_table_assing_15"
}

output "vpc_id" {
  value = module.vpc_module.vpc_id
}

output "subnet_id1" {
  value = module.vpc_module.subnet_id1
}

output "subnet_id2" {
  value = module.vpc_module.subnet_id2
}

output "internet_gateway_id" {
  value = module.vpc_module.internet_gateway_id
}
