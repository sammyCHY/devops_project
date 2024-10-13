# Mini Project- Single Endpoint Architecture for EC2 and S3 Services

## Project Goals and Learning Outcomes.

### By the completion of this project, The list below is what to be mastered.

- Mastered the integration of EC2 and S3 to support a fintech application, balancing compute and storage needs.
- Gained practical experience in setting up a reverse proxy on EC2 to facilitate unified access to both EC2 and S3 resources

- Learned the significance of seamless resource integration in bulding scalable and secure fintech solutions.
- Developed a deeper understanding of AWS=s capability to support fintech innovations through hands-on experience with its core services.

# Project Setup.

1. Two Separate Chrome browser profiles
2. AWS Management Console Access:

# Project Setup
1. Two Separate Chrome browser profiles
2. AWS Management Console Access: Using "John" the developer's IAM account, log into the AWS Management Console
3. EC2 Instance Setup: Launch an EC2 instance that will host the main application, and associate it with an elastic IP.

4. S3 Bucket Configuration: Using Mary the Data Analyst's IAM account, Created and configure an S3 bucket for storing application data, ensuring proper permissions and web hosting settings are in place. 

5. Reverse Proxy Configuration: Install and configure a web server (e.g., Nginx) on the Ec2 instance to act as a reverse proxy, routing requests to either the application or the S3 bucket based on the URL path. 

# Setting up the EC2 Instance

- Login in the AWS console as "any-name" 

- Using the basic knowledge of launching EC2 instances, launch an ubuntu EC2 Instance.

- Assign a Static IP (Elastic IP): Associate an Elastic IP address with the EC2 instance to ensure it retains the same public IP address across reboots. Recall the earlier incovenience faced when a static IP was not utilized the EC2 instances. Each time the instances was rebooted, it was assigned a new public IP address, compelling to frequently update the SSH command with the latest IP to maintain access. This not only disrupt the workflow but also increase the risk of connectivity issues or security concern due to constantly changing access points. Follow the steps below to assign a static IP 

1. In this console navigation, select elastic IP and click on allocate elastic IP in the top right.

