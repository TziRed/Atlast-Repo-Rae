# resource "aws_s3_bucket" "first_bucket" {
#   bucket = "backends3buckethawktuah"
# }

# resource "aws_kms_key" "kmskey" {
#   description = "KMS key to encrypt S3 bucket"
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypt" {
#   bucket = aws_s3_bucket.first_bucket.id

#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.kmskey.arn
#       sse_algorithm     = "aws:kms"
#     }
#   }
#   depends_on = [aws_kms_key.kmskey]
# }