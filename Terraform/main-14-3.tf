# # Assingment 14, task 3. (Terraform)
# resource "aws_network_acl" "example_nacl" {
#   vpc_id = "vpc-0cfcf8cf6704050e4" # Replace with your VPC ID

#   # Allow inbound SSH (port 22)
#   ingress {
#     rule_no    = 100
#     action     = "allow"
#     protocol   = "tcp"
#     from_port  = "22"
#     to_port    = "22"
#     cidr_block = "172.31.0.0/16" # Adjust as needed for security
#   }

#   # Allow inbound HTTPS (port 443)
#   ingress {
#     rule_no    = 101
#     action     = "allow"
#     protocol   = "tcp"
#     from_port  = "443"
#     to_port    = "443"
#     cidr_block = "172.31.0.0/16" # Adjust as needed for security
#   }

#   # Allow inbound NFS (port 2049)
#   ingress {
#     rule_no    = 102
#     action     = "allow"
#     protocol   = "tcp"
#     from_port  = "2049"
#     to_port    = "2049"
#     cidr_block = "172.31.0.0/16" # Adjust as needed for security
#   }

#   # Deny all other inbound traffic
#   ingress {
#     rule_no    = 200
#     action     = "deny"
#     protocol   = "-1" # All protocols
#     from_port  = "0"
#     to_port    = "0"
#     cidr_block = "172.31.0.0/16"
#   }

#   # Allow outbound traffic (change as necessary)
#   egress {
#     rule_no    = 100
#     action     = "allow"
#     protocol   = "-1" # All protocols
#     from_port  = "0"
#     to_port    = "0"
#     cidr_block = "172.31.0.0/16"
#   }
# }