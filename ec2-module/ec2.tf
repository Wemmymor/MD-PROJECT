

/*data "aws_ami" "amznlinux" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["amzn2-ami-kernel-5.10-*gp2"]
    # ami_id = "ami-0b5eea76982371e91"
    
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
    owners = ["amazon"]
} */

resource "aws_instance" "demo-dev" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  subnet_id = "aws_subnet.public_subnet_az1.id"
  vpc_security_group_ids = [ "${aws_security_group.dev_sg.id}" ]  
  key_name = var.key_name
  
  tags = {
    Name = "dev-bc-ec2"
  } 
}

resource "aws_instance" "demo-prod" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  subnet_id = "aws_subnet.private_subnet_az1.id"  
  vpc_security_group_ids = [ "${aws_security_group.prod_sg.id}" ]
  key_name = var.key_name
  
  tags = {
    Name = "prod-bc-ec2"
  } 
}

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