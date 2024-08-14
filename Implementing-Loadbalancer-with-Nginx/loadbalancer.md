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

- Under key pair. click on create a new key pair, although, I already have a key pair which I will use for all the instances created for this lesson:

### Step 2 Open Port 8000:
I will be running my webserver on port 8000 while the load balancers runs on port 80. I will need to open port 8000 to allow traffic from anywhere. To do this we need to add a rule to the security group of each of the webservers created.
The prompt below is steps to attain the result.

- Click on the instance ID to get the details of the EC2 instance.

![The image shows the instance ID](image/images/id_webserver.png)

- On the same page, scroll down and click on security:

![The image shows the server security group](image/images/security-rule.png)

- Click on security group:

- On the top of the page clickon Action and select Edit inbound rules:

- Add the rules:

- Click on save rules:


### Step 3: Install Apache Webserver:

After provisioning both of our servers and have opened the necessary ports, Its time to install apache software on both server. To do so I have to first connect to each of the server via ssh. Then I can now run commands on the terminal of my webservers.

- Connecting to the webserver: T o connect to the webserver,click on the instance Id, at the top of the page click on connect.

![The image shows the instance ID](image/images/id_webserver.png)

- Next copy the ssh command below:

**copy-ssh-command**

- Open a terminal in the local machine, cd into the Downloads folder. Paste the copied ssh command in the previous step.

![The image shows the ssh client connect](image/images/ssh-client-connect.png)


- Click on enter and type yes when prompt display. After that, I have to be connected to a terminal on my instance.


![The image shows the ssh server terminal connect](image/images/ssh-server.png)

- Next install apache with the command below:

`sudo apt update -y && sudo apt install apache2 -y`

![The image shows the update and install apache](image/images/sudo-apt-update&sudo-apt-install-apache1.png)


![The image shows the update and install apache](image/images/sudo-apt-update&sudo-apt-install-apache2.png)


- Verify That the apache is running using the command below:

`sudo systemctl status apache2`

![The image shows the apache status](image/images/sudo-systemctl-status-apache2.png)

