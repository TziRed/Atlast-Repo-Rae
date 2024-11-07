output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}

output "subnet_id1" {
  value = aws_subnet.vpc_subnet1.id
}

output "subnet_id2" {
  value = aws_subnet.vpc_subnet2.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.tf_igw.id
}
