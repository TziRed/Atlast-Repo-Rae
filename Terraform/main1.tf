# resource "aws_instance" "vm1-terraform" { # "vm1-terraform" is the Logical ID
#   ami               = "ami-050cd642fd83388e4"
#   availability_zone = "us-east-2b"
#   instance_type     = "t2.micro"
#   key_name          = "vm_key"
# }

# resource "aws_iam_user" "user1" {
#   name = "RAE"
# }

# resource "aws_iam_user" "user2" {
#   name = "admins"
# }

# resource "aws_iam_group" "group1" {
#   name = "tfgroup"
# }

# resource "aws_iam_group_membership" "groupadd1" {
#   name = "tf-user_groupp_add"
#   users = [
#     aws_iam_user.user1.name,
#     aws_iam_user.user2.name
#   ]
#   group = aws_iam_group.group1.name
# }