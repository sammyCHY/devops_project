# Implementing Loadbalancer with Nginx.

- This project entails the discovering the art of *load balancing with Nginx* in this project. Learn how to distribute traffic efficiently across multiple servers, optimize performance, and ensure high availability for your web applications.

# Setting up a Basic Load Balancer:

- In this project, I am going to be provisioning two **EC2** instances running *Ubuntu 22.04* and install apache webserver in them. We will open port 8000 to allow traffic from anywhere, and finally update the default page of the webservers to display their public IP address.

- Next provision another EC2 instance running **Ubuntu 22.04**, this time, I will install *Nginx* and configure it to act as a load balancer distributing traffic across the webservers.

### Step 1: Provisioning EC2 instance.

- Open AWS Management Console, click on EC2. Scroll down the page and click on Launch instance:

Console

- Under Name, provide a unique name for each webservers:

![The image shows the lauch server](image/images/launch-instance.png)