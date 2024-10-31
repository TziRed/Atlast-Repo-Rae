# Assingment 14, task 4. (Terraform)
# Create a custom security group
resource "aws_security_group" "custom_sg" {
  name        = "custom_sg"
  description = "Allow SSH and HTTPS access"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change as necessary for security
  }

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change as necessary for security
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create the EC2 instance
resource "aws_instance" "atlasec2tf" {
  ami               = "ami-00eb69d236edcfaf8" # Ubuntu 22.04 AMI in us-east-2
  instance_type     = "t2.micro"
  key_name          = "vm_key"
  availability_zone = "us-east-2c"
  security_groups   = [aws_security_group.custom_sg.id]

  # EBS volume configuration
  root_block_device {
    volume_size = 8 # Size in GB
    volume_type = "gp2"
  }

  # User data script to install and set up a web application
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              systemctl start apache2
              systemctl enable apache2
              echo "<h1>Hello from atlasec2tf!</h1>" > /var/www/html/index.html
              EOF

  # Associate the custom security group


  tags = {
    Name = "atlasec2tf"
  }
}