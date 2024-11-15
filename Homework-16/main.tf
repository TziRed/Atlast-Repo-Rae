provider "aws" {
  region                   = "us-east-2" #Region of the AWS user
  profile                  = "root"      #Name of the AWS user
  shared_config_files      = ["/home/ec2-user/.aws/config"]
  shared_credentials_files = ["/home/ec2-user/.aws/credentials"]
}

# Security Group to allow HTTP traffic
resource "aws_security_group" "allow_http" {
  name_prefix = "allow_http_"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Application Load Balancer
resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = ["subnet-089c5134affc617c3", "subnet-00278d7c2acf336a1"] # Use your subnet IDs
}

# Target Group for the ALB
resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0cfcf8cf6704050e4" # Use your VPC ID
}

# ALB Listener to forward traffic to the target group
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

# Launch Template for EC2 Instances
resource "aws_launch_template" "my_launch_template" {
  name_prefix          = "my-template"
  image_id             = "ami-0e593d2b811299b15" # Use a valid AMI ID
  instance_type        = "t2.micro"
  security_group_names = [aws_security_group.allow_http.name]
}

# Auto Scaling Group (ASG) to manage EC2 Instances
resource "aws_autoscaling_group" "my_asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 2
  vpc_zone_identifier = ["subnet-089c5134affc617c3", "subnet-00278d7c2acf336a1"] # Use your subnet IDs

  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.my_target_group.arn]
}