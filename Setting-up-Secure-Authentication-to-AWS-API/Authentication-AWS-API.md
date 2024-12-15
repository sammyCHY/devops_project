# Setting up Secure Authentication to AWS API

Following the requirement detailed in the project, the initial step in crafting our script is to ensure I have the necessary AWS account setup for authentication and resource management in the cloud. This setup is crucial for enabling the script to create EC2 instances and S3 buckets efficiently. Here's how to proceed:

1. # Create an IAM Role: 
Begin by establishing an IAM role that encapsulates the permissions required for the operations our script will perform.

1. ### Navigate to the IAM Console

- Log in to the AWS Management Console.
- Go to the IAM (Identity and Access Management) service.

![The image shows the IAM role created](image/images/IAM-dashboard-role.png)

2. ### Create the Role

1. ***Start the Role Creation:***

- In the IAM dashboard, click Roles on the sidebar and then click Create role.
Choose Trusted Entity:

![The image shows the selection and creation of the role](image/images/create-role.png)

2. ### Choose Trusted Entity:

- Select the trusted entity that will assume the role.

![The image shows the selection of the trusted entity for the role](image/images/create-role1.png)

- For AWS services like Lambda or EC2, choose AWS Service.

- For cross-account access, select Another AWS Account.

- For external applications, choose Web Identity.

3. Select a Use Case:

- For example, if this role is for EC2 instances, select EC2 and click Next.

![The image shows the selection of the trusted entity for the role](image/images/create-role1.png)

3. ### Attach Policies for Permissions.

- Add Policies:
Attach the necessary policies to define the permissions for the role.


For example, attach AmazonS3FullAccess if the role needs full access to S3.

![The image shows the policy permissions attached role](image/images/roles-add-permission.png)


![The image shows the policy permissions attached role](image/images/IAM-role-created.png)

![The image shows the policy permissions attached role](image/images/role-created.png)


2. # Create an IAM Policy: 
Design an IAM policy granting full access to both EC2 and S3 services. This policy ensures our script has then necessary permissions to manage these resources.

1. Policy JSON Document
Here's the JSON structure for the policy:

json
Copy code

`{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}`

- Action: ec2:* and s3:* grant all possible actions for EC2 and S3 services.
Resource: The wildcard * allows access to all resources (e.g., all EC2 instances and S3 buckets). You can restrict this to specific resources if needed.

![The image shows the specify policy of json](image/images/specify-policy-json.png)

2. ### Create the Policy via the AWS Management Console
Log in to the AWS Management Console.

- Navigate to the IAM service.
- Click on Policies in the left navigation pane.

![The image shows the creation of policy](image/images/create-policy.png)


Click on the search box and typing in "AmazonEC2FullAccess" among the policy names.

![The image shows the creation of policy](image/images/create-policy1.png)


- After the selection click on create policy to choose service.

![The image shows the specify permission on policy](image/images/specify-permission-policy.png)

![The image shows the specify permission on policy](image/images/specify-permission-policy1.png)


![The image shows the specify permission on policy](image/images/specify-permission-policy2.png)


[The image shows the specify permission on policy](image/images/resources-policy-all.png)

- After the selection then review and create interface displays to view the selected options.

[The image shows the review and create policy](image/images/review-and-create-policy1.png)

- The policy created.


[The image shows the review and create policy](image/images/policy-for-sammy-created.png)













Click Create Policy.

![The image shows the creation of policy](image/images/create-policy1.png)




3. ### Attach the Policy

Attach this policy to an IAM Role, User, or Group:
For an IAM Role (used by scripts or services), go to Roles, select the role, and attach this policy.

- For a User, go to Users, select the user, and attach the policy.

4. ### Create Policy via AWS CLI
Use the following commands:

Create the Policy:

Copy code
 
Save the above JSON policy in a file named policy.json.

Attach the Policy to a Role:


Best Practice:
Use least privilege principles where possible. Instead of granting * actions and resources, define specific permissions (e.g., ec2:StartInstances or s3:PutObject) and resources (specific instance IDs or bucket ARNs).


3. **Create an IAM User:** Instantiate an IAM user named automation_user. This user will serve as the primary entity our script uses to interact with AWS services.

4. **Assign the User to the IAM Role:** Link the automation_user to the previously created IAM role to inherit its permissions. This step is vital for enabling the necessary access levels for our automation tasks.


5. **Attach the IAM Policy to the User:** Ensure that the automation_user is explicitly granted the permissions defined in our IAM policy by attaching the policy directly to the user. This attachment solidifies the user's access to EC2 and S3 resources.

6. **Create Programmatic Access Credentials:** Generate programmatic access credentials- specifically, an **access key ID** and a **secret access key** for **automation_user**. These credentials are indispensable for authenticating our script with the AWS API through the Linux terminal, allowing it to create and manage cloud resources programmatically.


***Installing and Configuring the AWS CLI***

After setting up my AWS account and creating the necessary IAM user and permissions, the next step involves installing the AWS Command Line Interface (CLI). The AWS CLI is a powerful tool that allows you to interact with AWS services directly from my terminal, enabing automation and simplification of AWS resources management.

**Downloading and Installing AWS CLI**

***On Linux***

1. Download the AWS CLI 

