terraform {
  backend "s3" {
    bucket = "rae.atlas.tf.state.bucket"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "tf_state_lock"
  }
}