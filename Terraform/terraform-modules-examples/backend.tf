resource "aws_s3_bucket" "remote_bucket" {
  bucket = "atlas-tech-tf-rae-bucket"
}

resource "aws_s3_bucket_versioning" "remote_bucket_vers" {
  bucket = "atlas-tech-tf-rae-bucket"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamo_state_lock" {
  name           = "terrafrom-state-lock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}

terraform {
  backend "s3" {
    bucket         = "atlas-tech-tf-rae-bucket"
    key            = "state/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terrafrom-state-lock"
  }
}