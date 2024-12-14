# Setting up Secure Authentication to AWS API

Following the requirement detailed in the project, the initial step in crafting our script is to ensure I have the necessary AWS account setup for authentication and resource management in the cloud. This setup is crucial for enabling the script to create EC2 instances and S3 buckets efficiently. Here's how to proceed:

1. **Create an IAM Role:** Begin by establishing an IAM role that encapsulates the permissions required for the operations our script will perform.

*****************

2. **Create an IAM Policy:** Design an IAM policy granting full access to both EC2 and S3 services. This policy ensures our script has then necessary permissions to manage these resources.

3. **Create an IAM User:** Instantiate an IAM user named automation_user. This user will serve as the primary entity our script uses to interact with AWS services.

4. **Assign the User to the IAM Role:** Link the automation_user to the previously created IAM role to inherit its permissions. This step is vital for enabling the necessary access levels for our automation tasks.


5. **Attach the IAM Policy to the User:** Ensure that the automation_user is explicitly granted the permissions defined in our IAM policy by attaching the policy directly to the user. This attachment solidifies the user's access to EC2 and S3 resources.

6. **Create Programmatic Access Credentials:** Generate programmatic access credentials- specifically, an **access key ID** and a **secret access key** for **automation_user**. These credentials are indispensable for authenticating our script with the AWS API through the Linux terminal, allowing it to create and manage cloud resources programmatically.


***Installing and Configuring the AWS CLI***

After setting up my AWS account and creating the necessary IAM user and permissions, the next step involves installing the AWS Command Line Interface (CLI). The AWS CLI is a powerful tool that allows you to interact with AWS services directly from my terminal, enabing automation and simplification of AWS resources management.

**Downloading and Installing AWS CLI**

***On Linux***

1. 

