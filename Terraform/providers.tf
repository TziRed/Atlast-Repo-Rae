provider "aws" {
  region              = "us-east-2" #Region of the AWS user
  profile             = "root"      #Name of the AWS user
  shared_config_files = [ "/home/ec2-user/.aws/config" ]
  shared_credentials_files = [ "/home/ec2-user/.aws/credentials" ]
}