#  Web Stack Implementation (LEMP Stack)
Implementing a web stack involves setting up the necessary components for a web application to function. A typical web stack consists of four main components: the operating system, the web server, the database, and the programming language. One popular web stack is the LEMP stack, which includes Linux, Nginx, MySQL, and PHP. Here's a step-by-step guide to implementing a LAMP stack on an Ubuntu server:
First of all, I will run this command bellow on my Git Bash

`ssh -i "sammy-ec2.pem" ubuntu@ec2-3-138-120-20.us-east-2.compute.amazonaws.com`

![The image below shows the access link to the server ssh-i](image/image/ssh-1_key.png) 


## Installing the Nginx Web Server

### Step 1 - Installing the Nginx Web Server:

Nginx is for displaying of web pages to our visitors, therefore, we are going to employ high performance web server. I am going to use `apt` package manager to install this package.

- First of all, am going to start start updating my server package index by running the command below; `$ sudo apt update` and `sudo apt install nginx`

![The image shows the sudo apt update of the server and install of the nginx server](image/image/sudo_apt_update.png) 

  
![The image shows the sudo apt update of the server and install of the nginx server](image/image/sudo_apt_install_nginx.png) 

After the installation, then observe if it is green and running, which means the installation is correct and successfull.

- The command below is to show the installation status.
- `$ sudo systemctl status nginx`

![The image below shows the nginx installation status](image/image/sudo_systemctl_status_nginx.png) 

Before we can receive any traffic by our Web Server, we need to open `TCP PORT 80` which is default port that web brouser use to access web pages in the internet. However, we all know, we have TCP port22 open by default on our EC2 machine to accces it via SSH, so we need to add a rule to EC2 configuration to open inbound connection through port 80:


![The image below shows the add rule on Ec2 configuration](image/image/edit_inbound.png) 

After confirming the success running of our server,firstly, I will check how to access it locally in the Ubuntu shell by running the command bellow.

`$ curl http://localhost:80`
or 
`$ curl http://127.0.0.1:80`

![The image below shows running ubuntu shell](image/image/curl_http.png) 



![The image below shows the running ubuntu shell](image/image/curl_http2.png) 


Now, it's time to test how our Nginx server can respond to requests from the internet by Opening a web browser and try to access the following url.

`http://<public-IP-Address>:80`


![The image below shows the Nginx server responds to internet](image/image/http_public_ip.png) 


## Installing MYSQL

### Step 2- Installing MYSQL

Now that I have my server up and running, I need to install a Database Management System (DBMS) to be able to manage data my site in a rational database.

However, I will use `apt` to acquire and install the software:

Bellow is the command to achieve that.

`$ sudo apt install mysql-server`


![The image below shows the installation of mysql](image/image/sudo_apt_install_mysql-server.png) 


After the installation, log into the MYSQL console by typing the command bellow.

`$ sudo mysql`

![The image below shows the installation of mysql](image/image/sudo_mysql.png) 


To exit MYSQL shell with: run the command.
`mysql> exit`

Start the interactive script by running:

`$ sudo mysql_secure_installation`

![The image below shows the interactive script on mysql](image/image/sudo_mysql_secure_installation.png) 


![The image below shows the interactive script on mysql](image/image/sudo_mysql_secure_installation2.png) 


![The image below shows the interactive script on mysql](image/image/sudo_mysql_secure_installation3.png) 


![The image below shows the interactive script on mysql](image/image/sudo_mysql_secure_installation4.png) 


