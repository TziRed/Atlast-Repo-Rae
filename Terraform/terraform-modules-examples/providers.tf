provider "aws" {
  region                   = "us-east-2"
  profile                  = "root"
  shared_credentials_files = ["~/.aws/credentials"]
}