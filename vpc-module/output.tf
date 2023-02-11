output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.bc_vpc.id
}

output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

output "private_subnet_az1_id" {
  value = aws_subnet.private_subnet_az1.id
}

output "private_subnet_az2_id" {
  value = aws_subnet.private_subnet_az2.id
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}

output "prod_sg" {
  value = aws_security_group.prod_sg.id
}

output "dev_sg" {
  value = aws_security_group.dev_sg.id
}

output "aws_s3_bucket" "my_s3_bucket" {
  value = aws_s3_bucket.my_s3_bucket.id
}
