# AWS Identity and Access Management

This project is all about learning **AWS Identity and Access Management** (IAM), which helps to control who can access what in Amazon Web Services. I will cover things like; Users, roles, Policies and groups, I will also learn how to actually set them up to keep the AWS resources safe.

## Project Goals

- Understand AWS Identity and Access Management (IAM) principles and component.

- Learn to create and manage IAM policies for regulating access to AWS resources securely.

- Apply IAM concepts practically to control access within AWS environments.

- Explore best practices for IAM implementation and security in AWS.

## Learning Outcomes:

- Recognize IAM components like users, roles, policies, and groups.

- Create and manage IAM policies to define permssions for users and roles.

- Set up IAM users, groups and roles to control access to AWS services. 

- Understand IAM  best practices for maintaining security and managing access to AWS resources.

## What is IAM?

IAM, or Identity and Access Management. Think of it as the gatekeeper for AWS resources, Its job is to decide who gets in and what they're allowed to do once they're inside.

**Note-** AWS resources are the various services and tools provided by Amazon Web Services (AWS) that users can utilize to build and manage their applications and infrastructure in the cloud.

## What is IAM user?

- IAM users are like individual accounts for different people or entities within the AWS environment.

- IAM users helps managing and controlling access to the AWS resources securely, ensuring that each user only has access to the resources they need to perform their tasks.

## What is IAM Role?

An IAM role defines what someone or something (like an application or service) can do within the AWS account. Each role has a set of permissions that determines which actions it can perform and which AWS resources it can access.

For Example, I might have an "admin" role that gives full access to all resources, or a "developer" roles that only allows access to certain services for building applications.

## What is IAM Policy?

- An IAM Policy is a set of rules that defines what actions a role can take. These rules specify the permissions granted to the role. Think of a policy as a rulebook for the role. it outlines which actions are allowed and which are not, helping to ensure secure and controlled access to the AWS resources. 

For example, the rulebook might say that the "admin" key (IAM role or user) can open any door and perform any action within the house (AWS resources), while the "viewer" key (IAM role or user) can only open certain doors and look around, but not make any changes.

- IAM policies define the permissions granted to IAM roles and users, specifying which AWS resources they can access and what actions they can take. They are essential for maintaining security and controlling access to AWS resources, ensuring that only authorized actions are performed by users and roles within the AWS account.

## What is IAM Group?

- IAM Group are like collections of IAM users. Instead of managing permissions for each user individually, then someone can organize users into groups based on their roles or responsibilities.

- It's like like putting everyone into teams based on their tasks. So, you might have a group for developers, another for administrators, and so on. So instead of setting permissions for each person one by one, then, you can set them up for the whole group at once.

- For example, let's say I have a development team working on a project. Instead of assigning permissions to each developer one by one, then, you can create an IAM Group called **Developers** and add all the developers to that group. Then, assign permissions to the group as a whole. So, if you want all developers to have access to the same resources, you only need to set it up once for the group. 

