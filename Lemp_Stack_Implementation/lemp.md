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

After I have finished the installation, I have to test if I will be able to login to my MYSQL console by typing the command bellow:

`$ sudo mysql -p`

![The image below shows the login on mysql console](image/image/sudo_mysql-p_tilldown.png) 

MYSQL Server is now installed and secured. Next. I will install PHP, the final component in the LEMP Stack Project.

#  Installing PHP

## Step 3 - Installing PHP

I have Nginx installed to serve my content and MYSQL installed to install and manage my data. Now am proceeding to install PHP to process code and generate dynamic content for the web server.

Nginx requires an external program to handle PHP processing and act as a bridge between the PHP interpreter itself and the web server. This allows for a better overall performance in most PHP-based websites, but it requires additional configuration. I will need to install `php-fpm`, which stands for PHP fast CGI process manager"  and tell Nginx to pass PHP requests to this software for processing. Additionally, you will need `php-mysql`, a PHP module that allows PHP to communicate with Mysql-based database. Core PHP packages will automatically bi installed as dependencies.

To install these 2 packages at once, I need to run the command bellow.

`$ sudo apt install php-fpm php-mysql`


![The image below shows the php installation](image/image/sudo_apt_install_php-fpm_php-mysql.png) 

#  Configuring Nginx to Use PHP Processor

### Step 4 - Configuring Nginx to Use PHP Processor

In this guide, I will use **ProjectLEMP** as an example domain name.
On Ubuntu 20.04, Nginx has one server block enabled by default and is configured to serve documents out of a directory at `/var/www/html`. for the your_domain website, leaving `/var/www/html` in place as the default directory to be served if a client request does not match any other sites.

Am creating the root web directory for `Your_domain` as follows:

`$ sudo mkdir /var/www/projectLEMP`

Next is to assign ownership of the directory with the $USER environment variable, which will refernce my current system user:

`$ sudo chown -R $USER:$USER /var/www/projectLEMP`

Thereafter, I have to open new configuration file in Nginx's `sites-availabel` directory using preferred command-line editor. Here, I will use `nano` :

`$ sudo nano /etc/nginx/sites-available/projectLemp`


I have to activate configuration by linking to the config file from Nginx's `sites-enabled` directory:

`$ sudo ln -s /etc/nginx/sites-available/projectLEMP /etc/nginx/sites-enabled/`

However, this will tell Nginx to use the configuration next time it is reloaded. I have to test my configuration for syntax errors by typing:

`$ sudo nginx -t`

![The image below shows nginx configuration](image/image/sudo_nginx-t.png) 

