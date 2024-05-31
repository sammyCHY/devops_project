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




