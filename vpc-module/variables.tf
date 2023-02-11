variable "region" {
  default     = "us-east-1"
  description = "aws region"
  type        = string
}

variable "project_name" {
  default     = "bc_project_vpc"
  description = "the name of the vpc"
  type        = string
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "the cidr of the vpc"
  type        = string
}

variable "public_subnet_az1_cidr" {
  default     = "10.0.1.0/24"
  description = "cidr for public subnet az1"
  type        = string
}

variable "public_subnet_az2_cidr" {
  default     = "10.0.2.0/24"
  description = "cidr for public subnet az2"
  type        = string
}

variable "private_subnet_az1_cidr" {
  default     = "10.0.3.0/24"
  description = "cidr for private subnet az1"
  type        = string
}

variable "private_subnet_az2_cidr" {
  default     = "10.0.4.0/24"
  description = "cidr for private subnet az2"
  type        = string
}

variable "aws_security_group" {
  default = ""
  type = string 
}

variable "yourname" {
   default = ruth
   type = string
}

variable "random-number" {
  default = 4
  type = number
}

variable "tags" {
  type = string
  default = dev
}