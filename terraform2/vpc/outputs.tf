output "vpcid" {
  value = aws_vpc.tf_vpc.id
}

output "subnet1id" {
  value = aws_subnet.tf_public_subnet1.id
}

output "subnet2id" {
  value = aws_subnet.tf_public_subnet2.id
}