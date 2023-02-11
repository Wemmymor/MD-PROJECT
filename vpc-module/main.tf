# Create VPC
resource "aws_vpc" "bc_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true


  tags = {
    Name = "${var.project_name}-vpc"
  }
}
# Create internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.bc_vpc.id

  tags = {
    Name = "${var.project_name}-igw"                # "bc_project-igw"
  }
}

data "aws_availability_zones" "availability_zones" {}

# Create 2 public subnets
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.bc_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet az1"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.bc_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet az2"
  }
}
# Create 2 private subnets
resource "aws_subnet" "private_subnet_az1" {
  vpc_id                  = aws_vpc.bc_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "private subnet az1"
  }
}

resource "aws_subnet" "private_subnet_az2" {
  vpc_id                  = aws_vpc.bc_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "private subnet az2"
  }
}
# Create route table to internet gateway
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.bc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public route table"
  }
}
# Associate public subnets with route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}


