variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-0b5eea76982371e91"
}

variable "public_subnet_az1_cidr" {
  default     = "10.0.1.0/24"
  description = "cidr for public subnet az1"
  type        = string
}

variable "private_subnet_az1_cidr" {
  default     = "10.0.3.0/24"
  description = "cidr for private subnet az1"
  type        = string
}

variable "key_name" {
  default = "webapp"
  type    = string
}

variable "region" {
  default = "us-east-1"
  type = string
}

variable "Environment" {
  type = string
  default = "dev"
}

variable "aws_security_group" {
  type = string
  default = "aws_security_group.dev_sg.id"
}

/*
variable "subnet_id" {
  default =
  type = string
}



variable "availability_zone" {
   default = 
   type = 
}

variable "vpc_security_group_ids" {
  default = 
  type = 
}
*/