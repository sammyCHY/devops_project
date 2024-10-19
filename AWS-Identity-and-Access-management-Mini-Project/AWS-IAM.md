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

- An IAM role defines what someone or something (like an application or service) can do within the AWS account. Each role has a set of permissions that determines which actions it can perform and which AWS resources it can access.

- For Example, I might have an "admin" role that gives full access to all resources, or a "developer" roles that only allows access to certain services for building applications.

## What is IAM Policy?

- An IAM Policy is a set of rules that defines what actions a role can take. These rules specify the permissions granted to the role. Think of a policy as a rulebook for the role. it outlines which actions are allowed and which are not, helping to ensure secure and controlled access to the AWS resources. 

- For example, the rulebook might say that the "admin" key (IAM role or user) can open any door and perform any action within the house (AWS resources), while the "viewer" key (IAM role or user) can only open certain doors and look around, but not make any changes.

- IAM policies define the permissions granted to IAM roles and users, specifying which AWS resources they can access and what actions they can take. They are essential for maintaining security and controlling access to AWS resources, ensuring that only authorized actions are performed by users and roles within the AWS account.

## What is IAM Group?

- IAM Group are like collections of IAM users. Instead of managing permissions for each user individually, then someone can organize users into groups based on their roles or responsibilities.

- It's like like putting everyone into teams based on their tasks. So, you might have a group for developers, another for administrators, and so on. So instead of setting permissions for each person one by one, then, you can set them up for the whole group at once.

- For example, let's say I have a development team working on a project. Instead of assigning permissions to each developer one by one, then, you can create an IAM Group called **Developers** and add all the developers to that group. Then, assign permissions to the group as a whole. So, if you want all developers to have access to the same resources, you only need to set it up once for the group. 

# Best Practices:

- Give only the permissions needed: Don't give more access than necessary.

- Use roles instead of users: Roles are safer and can be used when needed.

- Review roles regularly: Remove unused roles to keep things tidy and secure.

- Add extra security with MFA: Use Multi-Factor Authentication for extra protection.

- Use ready-made policies: They're safer and easier to use.

- Keep policies simple: Make seperate policies for different tasks.

- Keep track of changes: keep a record of who changes what.

- Test policies before using them: Make sure they work the way you want them to before applying them to real stuff.

- Use descriptive names: Choose clear and descriptive names for IAM groups to facilitate understanding and management.

- Enforce strong password policies: Encourage users to create strong passwords and implement expiration and complexibility requirements.

**Note-** (different between users and roles) In AWS, users are like individual people with their own set set of keys to access resources. These keys are permanent and tied to specific individuals. It's similar to having your own key to the front door of your house-it's always yours.

- On the other hand, roles in AWS are more like special keys that can be used by different people or even programs. These keys provide temporary access and can be used by different users as needed. Roles are like master keys that can be used by anyone who needs access to certain things temporarily. So, while users are tied to specific individuals, roles are more flexible and can be shared among different users for specific tasks.


- Now come to the practical part.

1. A growth marketing consultancy company called **GatoGrowFast.com** wants to give some access to their employee Eric, Jack and Ade to the AWS resources. Let's see how it is being setup.

2. We'll do it in Two parts. In the first part of the practical, I will create a policy granting full access to EC2. Then, I will create a user named Eric and attach that policy to him.


3. In the second part, I will create a group and add two more users, Jack, and Ade, to that group, Afterward, I will create a policy for granting full access to EC2 and S3, and attach it to the group.

# Part-1

1. Navigate to the AWS Management Console.

a) use the search bar to locate the Identity and Access Management (IAM) service.)

![The image shows the aws management console](image/images/aws-management-console.png)

2. Now, on the IAM dashboard, navigate to the left sidebar and click on "policies."

a) From there, search for "EC2" and select "AmazonEC2Access" from the list of policies.
b) Proceed by clicking on "Create policy" to initiate the policy creation process.

![The image shows the amazon EC2 access ](image/images/amazone-c2-fullaccess.png)

3. Now, select all EC2 actions.

![The image shows the all EC2 action](image/images/all-ec2-action.png)


4. Tick "All resources" and click "Next"


![The image shows the all resources](image/images/all-resources.png)


5. Now click on create policy.

![The image shows the policy created](image/images/policy-created.png)


This is the policy I have created.

![The image shows the policy I have created](image/images/policy-created-eric.png)

6. Now, proceed to the "Users" section, and select the option to "Create User"

![The image shows how the user creation section](image/images/users-section.png)

7. Enterthe desired username for the user.

a) Then select the option "Provide user access to the AWS Management Console" if access to the web-based console interface is required.

b) Proceed to set up a password for the user.

c) check the box "Users must creat a new password at next sign-in" if allowing users to change their password upon first sign-in is preferred.

![The image shows the creation of eric-user](image/images/user-eric.png)

8. Select "Attach policy directly" and navigate to "Filter customer managed policies."

a) Choose the policy I have created named "Policy_for_eric."

b) Then I have to proceed by clicking "Next."

Note- AWS Policies -

- Manage Policies: Made by AWS, used by many.

- Customer Managed Policies: You make and manage them.

- Inline Policies: Made for one specific thing.

For further details, please refer to [Policies and permissions in IAM in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html)

9. Next, click on "Create User"

![The image shows the create user-eric](image/images/create-user.png)

10. Ensure to save these details securely for future reference.

a) Click on "Return to user list"

![The image shows the return to user list](image/images/return-to-user-list.png)

- Eric's user has been successfully created, and the policy granting him full access to EC2 has been attached.

### Now let's come to Part-2

1. On the "User Group" section, enter a name for the group.

a) click on "Create User Group"

b) Then, proceed to the "Users" section.

![The image shows the user group](image/images/user-group1.png)



![The image shows the user group](image/images/user-group2.png)


- This is the user I've created.

- c) Now, let's proceed to the "Users" section

![The image shows the user section](image/images/users-section-development-team.png)

2. Now, let's create a user named Jack.

![The image shows the user named jack](image/images/create-user-jack.png)

3. In the "Permissions" options, select "Add user to group"

a) Then, in the "User groups" section,

b) choose the group you created named "development-team,"

c) Click "Next"


![The image shows the add user to group](image/images/add-user-to-group.png)

4. Now, click on create user


![The image shows the create user jack](image/images/review-and-create-new-user.png)

I need to repeat the same process for user Ade. Create user Ade and add him to the user-group "Development team"

![The image shows the user Ade to add to user group to development team](image/images/ade-user.png)

![The image shows the ade create permission](image/images/ade-user-set-permission.png)

![The image shows the ade review and create](image/images/ade-review-and-create.png)

5. Navigate to the "Policies" section and click on "Create Policy" to beging crafting a new policy

![The image shows the create policy](image/images/create-policy.png)

6. Choose the two services, EC2 and S3,from the available options.


![The image shows the services](image/images/services-ec2.png)


![The image shows the services](image/images/services-s3.png)

7. Enter the desired policy name and proceed to click on the "Create Policy" button.

![The image shows the create policy](image/images/create-policy-ec2-s3.png)

8. Navigate to the "Users group" section and select the "Development-team" group


![The image shows the user group and the development team group ](image/images/user-group-development-team.png)

9. Proceed to the "Permissions" section and add the necessary permissions.


![The image shows the permissions](image/images/development-team-permission.png)

10. Click on attach policy


![The image shows the click on attach policy](image/images/attach-policy.png)


11. Select "customer managed policy" as the policy type

a) Then choose the "development-policy" earlier created.

b) Click "Attach policy"

![The image shows the  attach policy](image/images/Attach-permission-policy-to-development-team.png)

The policy is now attached to the group, granting full permission to ec2 and s3 for the group's users.

![The image shows the permission to ec2 and s3](image/images/final-full-permission-to-ec2&s3.png)


# Project reflection

- Understanding IAM: IAM serves as the security foundation for AWS resources, controlling access and permissions.

- Security Importance: IAM ensures data protection, compliance, and prevents unauthorized access.

- Policy Creation: Participants learned to craft IAM policies to regulate resources access effectively.

- Practical Application: Hands-on exercises equipped participants to set up IAM users, groups, and roles, enhancing their real-world IAM implementation skills.

