# create security group for the dev ec2 instance
resource "aws_security_group" "dev_sg" {
  name        = "dev_sg"
  description = "enable http access on port 80"
  # vpc_cidr      = var.vpc_cidr

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "dev_sg" 
  }
}

# create security group for the prod ec2 instance
resource "aws_security_group" "prod_sg" {
  name        = "prod_sg"
  description = "enable ssh access on port 80"
  # vpc_id      = var.vpc_id

  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    security_groups  = [aws_security_group.dev_sg.id]
  }

  tags   = {
    Name = "prod_sg" 
  }
}