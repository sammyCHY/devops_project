# Understanding Environment Variables $ Infrastructure Environments: Key Differences

As we delve deeper into the world of technology and its building blocks, two essential concepts often come to the forefront: "Infrastructure Environments" and "Environment Variables." Despite both terms featuring "Environment," they play distinct roles in the realm of scripting and software development. This common terminology can lead to confusion, making it crucial to distinguish and understand each concept from the outset.

### Infrastructure Environments

Infrastructure environments refers to the various settings where software applications are developed, tested, and deployed, each serving a unique purpose in the software lifecycle.

Lets say I'm working with a development team to build a FinTech product. They have 2 different AWS accounts. The journey would be something like;

1. VirtualBox + Ubuntu: The development environment where all local development is done on my laptop.

2. AWS Account 1: The testing environment where, after local developent is completed, the code is pushed to an EC2 instance here for further testing.

3. AWS Account 2: The production environment, where after tests to an EC2 instance in ***AWS Account 1:*** the code is pushed to an EC2 instance in ***AWS Account 2,*** where the customers consume the Fintech product through a website.

Each setup is considered as an ***Infrastructure Environment.***

On the other hand, environment variables are key-value pairs used in scripts or computer code to manage configuration values and control software behavoir dynamically.

### Environment Variables

Imagine My FinTech product needs to connect to a database to fetch financial data. However, the details of this database connection, like the database ***URL, username,*** and ***password*** differ between my ***development, testing,*** and ***production*** environments.

If I need to develop a shell script that will be reused acros all the 3 different environments, then it is important to dynamically fetch the correct value for my connectivity to those environments.

Here's how environment variables come into play:

**Development Environment (VirtualBox + Ubuntu):**

**Environment Variables:**

- DB_URL=localhost

- DB_USER=test_user

- DB_PASS=test_pass

Here, the environment variables point to a local database on my laptop where I can sfely experiment without affecting real or test data.

**Testing Environment (AWS Account 1):**

**Environment Variables:**

- DB_URL-testing-db.example.com

- DB_USER=testing_user

- DB_PASS=testing_pass

In this environment, the variables are configured to connect to a remote database dedicated to testing. This ensures that tests are performed in a controlled environment that simulates production settings without risking actual customer data.

**Production Environment (AWS Account 2):**

**Environment Variables:**

- DB_URL=production-db.example.com

- DB_USER-prod_user

- DB_PASS=prod_pass

Finally, when the application is running in the production environment, the environment variables switch to ensure the application connects to the live database. This is where real customer interactions happen, and the data needs to be accurate and secure.

By clarifying these differences early on, I set a solid foundation for navigating the complexities of technology development with greater ease and precision.

Now lets begin developing our shell script to manage cloud infrastructure.

**aws_cloud_manager.sh script**

By the end of this mini project, we would have started working on the aws_cloud_manager.sh script where environment variables will be defined, and command line arguments are added to control if the script should run for local environment, testing or production environment.

Developing a shell script is usually done by starting with incremental changes.

Lets begin by creating environment variable to determine if the script is running for local, testing, aor production environment.

- If you are on Mac, open up your Mac Terminal

- If you are on Windows, login to your Ubuntu desktop in Virtual box and open up the terminal

- If you don't use virtual box, spin up an EC2 instance and name it local so it represents your local environment, then login to it.

- Create a shell script with the name 
**asw_cloud_manager.sh**

- Put the code below into the file.


```#!/bin/bash

# Checking and acting on the environment variable
if [ "$ENVIRONMENT" == "local" ]; then
echo "Running script for Local Environment..."
# Commands for local environment
elif [ "$ENVIRONMENT" == "testing" ]; then
echo "Running script for Testing Environment..."
# Commands for testing environment
elif [ "$ENVIRONMENT" == "production" ]; then
echo "Running script for Production Environment..."
# Commands for production environment
else
echo "No environment specified or recognized."
exit 2
fi



