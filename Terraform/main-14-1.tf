# # Assignment 14, task 1. (Terraform)
# # Define the KMS key
# resource "aws_kms_key" "tf_kms_key" {
#   description = "KMS key for Terraform backend encryption"

#   tags = {
#     Name = "Terraform Backend KMS Key"
#   }
# }

# # Define the S3 bucket
# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "atlas.bucket.for.tettaform.assig"
# }

# # Define the S3 bucket server-side encryption configuration
# resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_encryption" {
#   bucket = "atlas.bucket.for.tettaform.assig"

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm     = "aws:kms"
#       kms_master_key_id = aws_kms_key.tf_kms_key.id
#     }
#   }
# }

# # Define the S3 bucket ACL
# resource "aws_s3_bucket_acl" "tf_state_acl" {
#   bucket = "atlas.bucket.for.tettaform.assig"
#   acl    = "private"
# }

# # Configure the backend
# terraform {
#   backend "s3" {
#     bucket  = "atlas.bucket.for.tettaform.assig"
#     key     = "terraform/state"
#     region  = "us-east-2"
#     encrypt = true
#   }
# }