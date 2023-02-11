/*
  backend "s3" {
    bucket = "value"
    key = "value"
    region = "value"
    kms_key_id = "value"
  }
    
*/


# Create vpc
module "vpc-module" {
  source                      = "./vpc-module"
  region                      = var.region
  project_name                = var.project_name
  vpc_cidr                    = var.vpc_cidr
  public_subnet_az1_cidr      = var.public_subnet_az1_cidr
  public_subnet_az2_cidr      = var.public_subnet_az2_cidr
 # private_app_subnet_az1_cidr = var.private_subnet_az1_cidr
 # private_app_subnet_az2_cidr = var.private_subnet_az2_cidr
}

# Create ec2
module "ec2-module" {
  source        = "./ec2-module"
  instance_type = "t3.micro"   # var.instance_type
  ami_id        = var.ami_id
  key_name      = var.key_name
}