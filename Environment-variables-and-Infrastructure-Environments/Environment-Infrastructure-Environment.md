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


