# Mini Project: Hosting a Dynamic Wed App on AWS with Terraform Module, Docker, Amazon ECR, and ECS.


## Purpose: 

In this Mini Project, you will use Terraform t create a modular infrastructure for hosting a dynamic web application on Amazon ECS (Elastic Container Service). The Project involves containerizing the web app using Docker, Pushing the Docker image to Amazon ECR (Elastic Container Registry),and deploying the app on ECS.


**Objectives:**


1. **Terraform Module Creation:**

    - Learn how to create Terraform modules for modular infrastructure provisioning.


2. **Dockerization:**

    - Containerize a dynamic web application using Docker.


3. **Amazon ECR Configuration:**

    - Configure Terraform to create an Amazon ECR repository for storing Docker images.


4. **Amazon ECS Deployment:**

    - Use Terraform to provision an ECS cluster and deploy the Dockerized web app.



**Project Tasks:**

### Task 1: Dockerization of Web App

1. Create a dynamic web application using a technology of my choice (e.g., Node.js, Flask, Django).


2. Write a `Dockerfile` to containerize the web application.


3. Test the Docker image locally to ensure the web app runs successfully within a container.


**Task 2: Terraform Module for Amazon ECR**


1. Create a new directory for my Terraform Project (e.g., `terraform-ecs-webapp`).

2. Inside the Project directory, create a directory for the Amazon ECR module (e.g., `modules/ecr`).

3. Write a Terraform module (`modules/ecr/main.tf`) to create an Amazon ECR repository for storing Docker images.


**Task 3: Terraform Modules for ECS**

1. Inside the Project directory, create a directory for the ECS module (e.g., `modules/ecs`).


2. Write a Terraform module (`modules/ecs/main.tf`) to provision an ECS cluster and deploy the Docterized web app.


**Task 4: Main Terraform Configuration**

1. Create the main Terraform Configuration file (`main.tf`) in the project directory.


2. Use the ECR and ECS modules to create the necessary infrastructure for hosting the web app.


**Task 5: Deployment**

1. Build the Docker image of my Web app.


2. Push the Docker image to the Amazon ECR repository created by Terraform.


3. Run `terraform init` and `terraform apply` to deploy the ECS cluster and the web app.


4. Access the web app through the public IP or DNS of the ECS service.



**Instructions:**

1. Create a new directory for your Terraform project using a terminal (`mkdir terraform-ecs-webapp`).

2. Change into the project directory (`cd terraform-ecs-webapp`).


3. Create directories for the ECR nad ECS modules (`mkdir -p modules/ecr` and `mkdir -p modules/ecs`).


4. Write the ECR module configuration (`nano modules/ecr/main.tf`) to create an ECR repository.


5. Write the ECS module configuration (`nano modules/ecs.main.tf`) to provision an ECS cluster and deploy the Dockerized web app.


6. Create the main Terraform configuration file (`nano main.tf`) and use the ECR and ECS modules.


```
module "ecr" {"\n  source = \"./modules/ecr\"\n  repository_name = \"your-webapp-repo\"\n"}

module "ecs" {"\n  source = \"./modules/ecs\"\n  ecr_repository_url = module.ecr.repository_url\n  // Add other variables as needed\n"}
```


7. Build the Docker image of your web app and push it to the ECR repository 


8. Run `terraform init` and `terraform apply` to deploy the ECS cluster and the web app.



9. Access the web app through the public IP or DNS of the ECS service.


10. Document your observation and any challenges faced during the project.



```
- Ensure you have the AWS CLI installed and configured with appropriate credentials.
- Modify variables and configurations in the modules based on your specific requirements.
- Replace placeholder values in the main configuration file with actual values.
- This is a learning exercise; use it to gain hands-on experience with Terraform, Docker, Amazon ECR, and ECS.
```