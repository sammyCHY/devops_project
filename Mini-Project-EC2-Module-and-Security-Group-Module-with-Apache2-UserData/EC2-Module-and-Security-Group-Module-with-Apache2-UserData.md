# Mini Project - EC2 Module and Security Group Module with Apache2 UserData

## Mini Project: EC2 Module and Security Group Module with Apache2 UserData


### Purpose: 

In this mini project, you will use Terraform to create modularized configurations for deploying an EC2 instance with a specified Security Group and Apache2 installed using UserData.


### Objectives:

1. Terraform Module Creation:


    - Learn how to create Terraform modules for modular infrastructure provisioning.

2. EC2 Instance Configuration:


    - Configure Terraform to create an EC2 instance.


3. Security Group Configuration:


    - Create a separate module for the Security Group associated with the EC2 instance.


4. UserData Script:


    - Utilize UserData to install and configure Apache2 on the EC2 instance.


# Project Tasks:

### Task 1: EC2 Module

1. Create a new directory for your Terraform project (e.g., `terraform-ec2-apache`).


2. Inside the project directory, create a directory for the EC2 module (e.g., `module/ec2`).


3. Write a Terraform module (`module/ec2/main.tf`) to create an EC2 instance.


### Task 2: Security Group Module


1. Inside the Project directory, create a directory for the Security Group module (e.g., `modules/security_group`).

2. Write a Terraform module (modules/security_group/main.tf) to create a Security Group for the EC2 instance.


### Task 3: UserData Script

1. Write a UserData Script to install and configure Apache2 on the Ec2 instance. Save it as a separate file (e.g., `apache_userdata.sh`).


2. Ensure that the UserData Script is executable (`chmod +x apache_userdata.sh`).


### Task 4: Main Terraform Configuration

1. Create the main Terraform Configuration file (`main.tf`) in the project directory


2. Use the EC2 and Security Group modules to create the necessary infrastructure for the EC2 instance.


Task 5: Deployment

   1. Run `terraform init` and `terraform apply` to deploy the EC2 instance with Apache2.

   2. Access the EC2 instance and verify that Apache2 is installed and running.


   Instructions:


   1. Create a new directory for your tErraform project using a terminal (`mkdir terraform-ec2-apache`).

   2. Change into the Project directory (`cd terraform-ec2-apache`).

   3. Create directories for the EC2 and Security Group modules (`mkdir -p modules/ec2` and `mkdir -p modules/security_group`).

   4. Write the EC2 module configuration (nano modules/ec2/main.tf) to create an EC2 instance.


   5. Write the Security Group module configuration (nano modules/security_group/main.tf) to create a Security Group.

   
   6. Write the UserData script (`nano apache_userdata.sh`) to install and configure Apache2


```
   #!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" | sudo tee /var/www/html/index.html
```


7. Make the UserData script executable (`chmod +x apache_userdata.sh`).


8. Create the main Terraform configuration file (`nano main.tf`) and use the EC2 and Security Group modules.


```
module "security_group" {"\n  source = \"./modules/security_group\"\n  // Add variables for customizing the Security Group if needed\n"}

module "ec2_instance" {"\n  source          = \"./modules/ec2\"\n  security_group_id = module.security_group.security_group_id\n  user_data       = file(\"apache_userdata.sh\")\n  // Add other variables as needed\n"}
```

9. Run `terraform init` and `terraform apply` to deploy the EC2 instance with Apache2.


10. Access the EC2 instance using its Public IP and verify that Apache2 is installed and running.


11. Document your observations and any challenges faced during the project.


```
- Ensure you have the AWS CLI installed and configured with appropriate credentials.
- Modify variables and configurations in the modules based on your specific requirements.
- This is a learning exercise; use it to gain hands-on experience with Terraform, EC2, UserData, and Security Groups.
```

