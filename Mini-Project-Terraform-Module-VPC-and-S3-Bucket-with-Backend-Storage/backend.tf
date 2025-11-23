terraform {
  backend "s3" {
    bucket         = "my-unique-sammy-bucket-12345" # Replace with your bucket name
    key            = "terraform.tfstate"
    region         = "us-west-1" # Change this to your desired AWS region
    encrypt        = true
    dynamodb_table = "terraform-module-bucket" # Change to the dynamoDB_table name
  }
}