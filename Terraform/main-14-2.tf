# # Assingment 14, task 2. (Terraform)
# data "aws_vpc" "existing_vpc" {
#   id = "vpc-0cfcf8cf6704050e4"
# }

# resource "aws_security_group" "ssh_https_nfs" {
#   name        = "ssh_https_nfs"
#   description = "Security group for SSH, HTTPS, and NFS access"
#   vpc_id      = "vpc-0cfcf8cf6704050e4" #Or you can call it our with "data.aws_vpc.exisiting_vpc.id"

#   # Inbound rules
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["172.31.0.0/16"]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["172.31.0.0/16"]
#   }

#   ingress {
#     from_port   = 2049
#     to_port     = 2049
#     protocol    = "tcp"
#     cidr_blocks = ["172.31.0.0/16"]
#   }

#   # Optional: Egress rules
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1" # Allows all outbound traffic
#     cidr_blocks = ["172.31.0.0/16"]
#   }
# }