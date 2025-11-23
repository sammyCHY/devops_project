provider "aws" {
  region = "us-west-1" # Change this to your desired AWS region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name           = "my_vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.0.0/24"]
  private_subnets    = ["10.0.1.0/24"]
  availability_zones = ["us-west-1a"]
  # Add variables for customizing the VPC module if needed
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "my-unique-sammy-bucket-12345"
  # Add variables for customizing the S3 bucket module if needed
}