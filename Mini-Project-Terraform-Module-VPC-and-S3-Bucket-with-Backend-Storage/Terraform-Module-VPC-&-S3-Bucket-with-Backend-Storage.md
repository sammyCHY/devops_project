 # Mini Project- Terraform Modules- VPC and S3 Bucket with Backend Storage.
 
 
 ## Mini Project: Terraform Modules - VPC and S3 Bucket with Backend Storage
 
 
 ### Purpose:
 
 In this mini project, you will use Terraform to create modularized configurations for building an Amazon Virtual Private Cloud (VPC) and an Amazon S3 bucket. Additionally, you will configure Terraform to use Amazon S3 as the backend storage for storing the Terraform state file.
 
 
 **Objectives:**
 
 1. Terraform Modules:
 
     - Learn how to create and use Terraform Modules for modular infrastructure provisioning.
 
 2. VPC Creation:
 
     - Build a reusable Terraform module for creating a VPC with specified configurations.
 
 
 3. S3 Bucket Creation:
 
     - Develop a Terraform module for creating an S3 bucket with customizable settings.
 
 
 4. Backend Storage Configuration:
 
     - Configure Terraform to use Amazon S3 as the backend storage for storing the Terraform state file.
 
 
 ## Project Tasks:
 
 ### Task 1: VPC Module
 
 1. Create a new directory for your Terraform project (e.g., `terraform-modules-vpc-s3`).
 
 ```
 mkdir terraform-modules-vpc-s3
 ```
 
 ![The Image shows the directory for Terraform project](image/images/mkdir-terraform-modules-vpc-s3.png)
 
 2. Inside the project directory, create a directory for the VPC module (e.g., `modules/vpc`).
    a. In this case, you have to change directory into the project directory.
 
 ```
 cd terraform-modules-modules-vpc-s3
 ```
 
 ![The Image shows the change of directory to Terraform project](image/images/cd-terraform-modules-vpc-s3.png)
 
 ```
 mkdir -p modules/vpc
 ```
 
 ![The Image shows the change of directory to Terraform project](image/images/mkdir-p-modules-vpc-s3.png)
 
 3. Write a Terraform modules (`modules/vpc/main.tf`) for creating a VPC with customizable configurations such as CIDR block, subnets, etc.
 
 - Inside the modules/vpc/main.tf, past the script below to create a ``VPC``
 
 ```
 resource "aws_vpc" "vpc_id" {
   cidr_block = "10.0.0.0/16"
   enable_dns_hostnames = true
   enable_dns_support   = true
   tags = {
       Name = "vpc_id"
     }
 }
 
 resource "aws_Internet_gateway" "aws_igw" {
   
   vpc_id = aws_vpc.vpc_id.id
   tags = {
       Name = "igw_id"
     }
 
 }
 
 # Public Subnets
 resource "aws_subnet" "public_subnets" {
   vpc_id      = aws_vpc.vpc_id.id
   cidr_block  = "10.0.0.0/24"
   availability_zone  = "us-east-1"
   map_public_ip_on_launch = true
 
   tags = {
       Name = "public_subnet"
     }
 
 }
 
 # Private Subnets
 
 resource "aws_subnet" "private_subnets" {
   vpc_id            = aws_vpc.vpc_id.id
   cidr_block        = "10.0.1.0/24"
   availability_zone = "us-east-1"
 
   tags = {
       Name = "private_subnets"
     }
   
 }
 
 resource "aws_route_table" "route_table_id" {
 
     vpc_id = aws_vpc.vpc_id.id
     tags = { 
       Name = "route_table_id"
  }
 
 }
 
 resource "aws_route" "route_id" {
   route_table_id = aws_route_table.route_table_id.id
   destination_cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.aws_igw.id
 }
 # This module creates a VPC with public and private subnets, an internet gateway, and a route table.
 # The public subnet is associated with the route table that has a route to the internet gateway.
 resource "aws_route_table_association" "route_table_association_id" {
   subnet_id = aws_subnet.public_subnets.id
   route_table_id = aws_route_table.route_table_id.id
 }
 
 # NAT Gateway (Optional)
 resource "aws_eip" "nat_eip" {
   domain = "vpc"
  }
   resource "aws_nat_gateway" "nat_gateway" {
     allocation_id = aws_eip.nat_eip.id
     subnet_id = aws_subnet.public_subnets.id
     tags = {
       Name = "nat_gateway"
     }
     
 }
 
 # Route Table - Public
 resource "aws_route_table" "public_route_table" {
   vpc_id = aws_vpc.vpc_id.id
   tags = {
       Name = "public_route_table"
     }
 
 }
 
 resource "aws_route" "public_route_table" {
   route_table_id         = aws_route_table.public_route_table.id
   destination_cidr_block = "0.0.0.0/0"
   nat_gateway_id    = aws_nat_gateway.nat_gateway.id
 }
 
 
 # Route Table - Private
 resource "aws_route_table" "private_route_table" {
   route_table_id  = aws_route_table.private_route_table.id
   destination_cidr_block = "0.0.0.0/0"
 
 }
 
 resource "aws_route_table_association" "private_route_table_association" {
   subnet_id = aws_subnet.private_subnets.id
   route_table_id = aws_route_table.private_route_table.id
  
 }
 
 ```
 
 - Inside the module/vpc/variables.tf paste the script below:
 
 
 ```
 variable "vpc_cidr" {
   type        = string
   description = "CIDR block for the VPC"
 }
 
 variable "vpc_name" {
   type        = string
   description = "Name of the VPC"
 }
 variable "public_subnets" {
   type        = list(string)
   description = "CIDR block for the public subnet"
 }
 
 variable "private_subnets" {
   type        = list(string)
   description = "CIDR block for the Private subnet"
 }
 
  variable "availability_zones" {
     description  = "Availability zone for the subnets"
     type   = list(string)
  }
 ```
 
 
 - Inside the module/vpc/output.tf paste the script below:
 
 ```
 output "vpc_id" {
   description = "The ID of the VPC"
   value = aws_vpc.vpc_id
 }
 
 output "public_subnets" {
   description = "List of public subnet IDs"
   value = aws_subnet.public_subnets.id
 }
 
 output "private_subnets" {
   description = "List of private subnet IDs"
   value = aws_subnet.private_subnets.id
 }
 ```
 
 4. Create a main Terraform configuration file (`main.tf`) in the project directory, and use the VPC module to create a VPC.
 
 
 - Inside the module/vpc/main.tf paste the script below:
 
 
 ```
 provider "aws" {
     region = "us-east-1"
 }
 
  # Backend configuration for Terraform state management
  terraform {
    backend "s3" {
      bucket         = "terraform-modul" # Replace with your bucket name
      key            = "terraform/terraform.tfstate"     # Replace with a custom path
      region         = "us-west-1"                       # Replace with your bucket region
      dynamodb_table = "terraform-module" # Replace with your DynamoDB table name
      encrypt        = true                              # Enable encryption for added security
    }
  }
 
 module "vpc" {
   source = "./modules/vpc"
 
   vpc_name       = "my_vpc"
   vpc_cidr       = "10.0.0.0/16"
   public_subnets =  ["10.0.1.0/24"]
   private_subnets =  ["10.0.2.0/24"]
   availability_zones = ["us-east-1", "us-east-1"]
 }
 ```
 
 
 ### Task 2: Bucket Module
 
 1. Inside the project directory, create a directory for the S3 bucket module (e.g., `modules/s3`).
 
 ![The Image shows the creation of directory to Terraform project](image/images/mkdir-p-modules-vpc-s3.png)
 
 
 2. Write a Terraform module (`modules/s3/main.tf`) for creating an S3 bucket with customizable configurations such as bucket name, ACL, etc.
 
 - Inside modules/s3/main.tf, define the root module of the main.tf file for s3 bucket, below is the script.
 
 ```
 # modules/s3/main.tf 
   resource "aws_s3_bucket" "this" {
 
   bucket_name      = var.bucket_name
   versioning       = var.versioning
   force_destroy    = var.force_destroy
   acl              = var.acl
   
   tags             = var.tags
 }
 ```
 
 
 - Inside modules/s3/variables.tf, define the root module of the variables.tf file for s3 bucket, below is the script.
 
 
 ```
 # modules/s3/variables.tf
      variables "bucket_name" {
      description  = "Name of the s3 bucket"
      type    = string
 
 }
 
 variable "versioning" {
   description = "Enable S3 versioning"
   type        = bool
   default     = true
 }
 
 variable "force_destroy" {
   description = "Allow destroying a non-empty bucket"
   type        = bool
   default     = false
 }
 
 variable "acl" {
   description = "ACL for the S3 bucket"
   type        = string
   default     = "private"
 }
 
 variable "tags" {
   description = "Tags to apply to the S3 bucket"
   type        = map(string)
   default     = {
     Environment = "dev"
     Terraform   = "true"
   }
 }
 ``` 
 
 3. Modify the main Terraform configuration file (`main.tf`) to use the S3 module and create an S3 bucket.
 
 In this paragraph I have to use module in my main configuration. In the root main.tf, you have to use the script below.
 
 
 ```
 module "s3_bucket" {
   source      = "./modules/s3"
   bucket_name = "my-sammy-bucket-name-7742"
   acl         = "private"
   tags = {
     Environment = "dev"
     Project     = "demo"
   }
 }
 ```
 
 **Task3 Create an S3 Bucket Manually create an S3 Bucket in Amazon Management Console.**
 
 
 Steps
 
  - On the Search space enter DynamoDB
 
  - Click on the Create button
 
  - Enter a Unique Name
 
  - Enter the Lockid
 
 
 
 
 
 ### Task 3: Backend Storage Configuration
 
 1. Configure Terraform to use Amazon S3 as the backend storage for storing the Terraform statefile. 
 
 2. Create a backend configuration file (e.g., `backend.tf`) specifying the S3 bucket and key for storing the state.
 
 
 3. Initialize the Terraform project using the command: `terraform init` .
 
 
 4. Apply the Terraform configuration to create the VPC and S3 bucket using the command: `terraform apply`. 
 
 
 
 # Instructions:
 
 1. Create a new directory for your Terraform project using a terminal (`mkdir terraform-modules-vpc-s3`)
 
 
 2. Change into the project directory (`cd terraform-modules-vpc-s3`)
 
 
 3. Create directories for the VPC and S3 modules (`mkdir -p modules/vpc` and `mkdir -p modules/s3`).
 
 
 4. Write the VPC module configuration (`nano modules/vpc/main.tf`) and the S3 module configuration (`nano modules/s3/main.tf`).
 
 
 5. Create the main Terraform configuration file (nano main.tf) and use the VPC and S3 modules.
 
 
 
 ```
 module "vpc" {"\n  source = \"./modules/vpc\"\n  // Add variables for customizing the VPC module if needed\n"}
 
 module "s3_bucket" {"\n  source = \"./modules/s3\"\n  // Add variables for customizing the S3 bucket module if needed\n"}
 
 provider "aws" {"\n  region = \"us-east-1\"  # Change this to your desired AWS region\n"}
 
 terraform {"\n  backend \"s3\" {\n    bucket         = \"your-terraform-state-bucket\"\n    key            = \"terraform.tfstate\"\n    region         = \"us-east-1\"  # Change this to your desired AWS region\n    encrypt        = true\n    dynamodb_table = \"your-lock-table\"\n  "}
 }
 ```
 
 - This Properly formatted script below should be inside the `**main.ft**` file in the current working directories
 
 ```
 provider "aws" {
   region = "us-east-1"  # Change this to your desired AWS region
 }
 
 terraform {
   backend "s3" {
     bucket         = "your-terraform-state-bucket"
     key            = "terraform.tfstate"
     region         = "us-east-1"  # Change this to your desired AWS region
     encrypt        = true
     dynamodb_table = "your-lock-table"
   }
 }
 
 module "vpc" {
   source = "./modules/vpc"
   # Add variables for customizing the VPC module if needed
 }
 
 module "s3_bucket" {
   source = "./modules/s3"
   # Add variables for customizing the S3 bucket module if needed
 }
 ```
 
 I have to create s3 Bucket Manually, create an S3 Buckets in Amazon Management Console.
 
 Steps
 
    - On the search space enter DynamoDB
    - Click on the Create button
    - Enter a Unique Name
    - Enter the Lockid
 

    ![The Image below the represents s3 bucket (dynamoDB creation and the process)](image/images/terraform-bucket1.png)
 
 
    ![The Image below the represents s3 bucket (dynamoDB creation and the process)](image/images/terraform-bucket2.png) 
 
 
After the process above, the amazon s3 bucket has to be created manually.
The Image below shows the creation of the s3 bucket via amazon console.

![The Image below shows the creation of s3 bucket manually)](image/images/amazon-s3-bucket-creation1.png)

![The Image below shows the creation of s3 bucket manually)](image/images/amazon-s3-bucket-creation2.png)


Remember before creating a policy that will be attached to the IAM User policy, the json file has to be edited.

![The Image below the represents the json file policy edition)](image/images/terraform-plan-dynamoDB-lock.png)

 The Image below shows the creation of the policies.

 ![The Image below the represents policy creation)](image/images/policy-terraform-dynamodb-lock-created1.png)


  ![The Image below the represents policy creation)](image/images/policy-terraform-dynamodb-lock-created2.png)
  

 6. Create the backend configuration file (`nano backend.tf`) to specify the backend storage.
 

 When "backend.ft" file is created.


![The Image below the terraform backend file created)](image/images/touch-backend.png)

 
 ```
 terraform {"\n  backend \"s3\" {\n    bucket         = \"your-terraform-state-bucket\"\n    key            = \"terraform.tfstate\"\n    region         = \"us-east-1\"  # Change this to your desired AWS region\n    encrypt        = true\n    dynamodb_table = \"your-lock-table\"\n  "}
 }
 ```
 
 - **Properly formatted script**
 
 ```
 terraform {
   backend "s3" {
     bucket         = "your-terraform-state-bucket"
     key            = "terraform.tfstate"
     region         = "us-east-1"   # Change this to your desired AWS region
     encrypt        = true
     dynamodb_table = "your-lock-table"
   }
 }
 ```
 
 7. Initialize the Terraform project using `terraform init`.


 ![The Image shows the terraform init on the cli](image/images/terraform-init.png)


 ![The Image shows the terraform init on the cli](image/images/terraform-init-final.png)


Then terraform validate.

![The Image shows the terraform validate](image/images/terraform-validate.png)

![The Image shows the terraform validate](image/images/terraform-validate-final.png)


 After the terraform init then the next stage is "terraform plan" to actually ascertain the alignment of the project.


![The Image shows the terraform plan process](image/images/terraform-plan1.png)

![The Image shows the terraform plan process](image/images/terraform-plan2.png)

![The Image shows the terraform plan process](image/images/terraform-plan3.png)

![The Image shows the terraform plan process](image/images/terraform-plan4.png)

![The Image shows the terraform plan process](image/images/terraform-plan5.png)

 
 8. Apply the Terraform configuration using `terraform apply` and confirm the creation of the VPC and S3 bucket.
 
 After which the project has been finalized, the next is to run terraform apply.

![The Image shows the terraform apply process](image/images/terraform-apply1.png)

![The Image shows the terraform apply process](image/images/terraform-apply2.png)

![The Image shows the terraform apply process](image/images/terraform-apply3.png)

![The Image shows the terraform apply process](image/images/terraform-apply4.png)

![The Image shows the terraform apply process](image/images/terraform-apply5.png)

![The Image shows the terraform apply process](image/images/terraform-apply-final.png)


 9. Document your observations and any challenges faced during the project.
 

  
 - Ensure you have the AWS CLI installed and configured with appropriate credentials.
 - Modify variables and configurations in the modules based on your specific requirements.
 - Replace placeholder values in the main and backend configuration files with actual values.
 - This is a learning exercise; use it to gain hands-on experience with Terraform modules and backend storage.
 
 
 