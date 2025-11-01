provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "existing_vpc" {
  id = "vpc-0867269f9b07046e9"
}

resource "aws_subnet" "example_subnet" {
  vpc_id            = data.aws_vpc.existing_vpc.id
  cidr_block        = "192.168.1.0/24"  # Updated to match VPC range
  availability_zone = "us-east-1a"

  tags = {
    Name = "Example-Subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = data.aws_vpc.existing_vpc.id

  tags = {
    Name = "datasource-Terraform-internet-gateway"
  }
}
