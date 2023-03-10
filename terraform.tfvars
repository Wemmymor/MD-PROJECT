region                      = "us-east-1"
project_name                = "bc_project_vpc"
vpc_cidr                    = "10.0.0.0/16"
public_subnet_az1_cidr      = "10.0.1.0/24"
public_subnet_az2_cidr      = "10.0.2.0/24"
private_app_subnet_az1_cidr = "10.0.3.0/24"
private_app_subnet_az2_cidr = "10.0.4.0/24"
Environment                 = "dev"
instance_type               = t3.micro
ami_id                      = "ami-0b5eea76982371e91"
key_name                    = "webapp"
random-number = 4
tags = dev
yourname = ruth
