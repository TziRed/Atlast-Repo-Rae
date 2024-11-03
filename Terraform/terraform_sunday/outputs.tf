output "bucket_name" {
  description = "Name of bucket"
  value       = aws_s3_bucket.tf_s3bucket.id
}

output "bucket_region" {
  description = "Region of bucket"
  value       = aws_s3_bucket.tf_s3bucket.region
}

output "KMS_key" {
  description = "Give the KMS ID"
  value       = aws_kms_key.tf_bucket_key.id
}

output "dynamodb_table_name" {
  description = "Name of Dynamodb Table"
  value       = aws_dynamodb_table.tf_dynamodb.id
}