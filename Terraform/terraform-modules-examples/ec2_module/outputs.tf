output "ec2_public_ip" {
  value = aws_instance.vm1.public_ip
}

output "ec2_dns" {
  value = aws_instance.vm1.public_dns
}