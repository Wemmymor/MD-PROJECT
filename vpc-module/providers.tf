# bootcamp29-${random-number}-{yourname} - bootcamp29-${}-{ruth}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

/*
# existing s3 bucket
  backend "s3" {
    bucket = "bootcamp29-4-ruth"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  } */
}


# Configure provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "random_integer" "name" {
  
}




# create s3 bucket
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "bootcamp29-4-ruth"
  
  tags = {
    Name        = var.aws_s3_bucket.my_s3_bucket      
    Environment = "Dev"
    
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.my_s3_bucket.id     # bootcamp29-${random-number}-{yourname}
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = "bootcamp29-4-ruth"

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}