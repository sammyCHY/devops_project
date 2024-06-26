# Lamp Stack Implementation

The **LAMP stack** is a popular open-source software stack used for web development. 
LAMP stands for Linux, Apache, MySQL, and PHP, which are the key components of the stack. 
Here's a brief description of each component and how they work together in a LAMP stack implementation:

- Linux: Linux is the operating system that forms the foundation of the LAMP stack. It provides the underlying infrastructure and resources for hosting web applications. Linux is chosen for its stability, security, and open-source nature. Various distributions of Linux, such as Redhat, Ubuntu, CentOS, and Debian, are commonly used in LAMP stack implementations.
  
- Apache: Apache is a widely-used open-source web server software that serves as the HTTP server in the LAMP stack. Apache receives HTTP requests from clients (such as web browsers) and serves static and dynamic web content in response. It supports various features such as virtual hosting, SSL/TLS encryption, URL rewriting, and authentication.
  
- MySQL: MySQL is an open-source relational database management system (RDBMS) that serves as the database component of the LAMP stack. It provides a robust, scalable, and high-performance platform for storing and managing structured data. MySQL is commonly used for web applications that require data storage, retrieval, and manipulation, such as content management systems (CMS), e-commerce platforms, and web applications.

- PHP: PHP is a server-side scripting language that is used for developing dynamic web applications and generating dynamic web content. PHP scripts are executed on the server by the Apache web server, generating HTML output that is sent to the client's web browser. PHP integrates seamlessly with Apache and MySQL, allowing developers to build powerful and interactive web applications.
In a LAMP stack implementation, Linux provides the operating system environment, Apache serves as the web server, MySQL handles database operations, and PHP processes dynamic content. Together, these components form a powerful and versatile platform for developing and hosting a wide range of web applications, from simple websites to complex web-based systems.


## Preparing Prerequisites

### 1. AWS:
AWS, short for Amazon Web Services, is a comprehensive and widely-used cloud computing platform provided by Amazon. It offers a broad set of cloud services, including computing power, storage solutions, networking capabilities, databases, machine learning, artificial intelligence, analytics, developer tools, security features, and more.

Here are some key aspects and features of AWS:

- Compute Services: AWS provides various compute services, including Amazon Elastic Compute Cloud (EC2) for scalable virtual servers, AWS Lambda for serverless computing, Amazon Elastic Container Service (ECS) for container management, and more.

- Storage Solutions: AWS offers a range of storage options, such as Amazon Simple Storage Service (S3) for scalable object storage, Amazon Elastic Block Store (EBS) for block storage volumes, Amazon Glacier for long-term archival storage, and Amazon Elastic File System (EFS) for scalable file storage.

- Networking: AWS provides networking services, including Amazon Virtual Private Cloud (VPC) for creating isolated virtual networks, Amazon Route 53 for domain name system (DNS) management, Elastic Load Balancing for distributing incoming traffic, and more.

- Databases: AWS offers managed database services like Amazon Relational Database Service (RDS) for relational databases (MySQL, PostgreSQL, Oracle, SQL Server, etc.), Amazon DynamoDB for NoSQL databases, Amazon Redshift for data warehousing, and more.

- Developer Tools: AWS offers developer tools like AWS CodeCommit for version control, AWS CodeBuild for continuous integration, AWS CodeDeploy for automated deployments, AWS CodePipeline for continuous delivery, and more.
Security and Identity: AWS provides security services and features, including AWS Identity and Access Management (IAM) for managing user access and permissions, AWS Key Management Service (KMS) for encryption key management, AWS Certificate Manager for SSL/TLS certificates, and more.

- Analytics and Big Data: AWS offers analytics and big data services, such as Amazon EMR for big data processing, Amazon Athena for interactive query analysis, Amazon Kinesis for real-time data streaming, AWS Glue for data integration, and more.
AWS is known for its scalability, reliability, flexibility, and pay-as-you-go pricing model, making it a popular choice for businesses of all sizes, from startups to large enterprises, to build and deploy their applications and services in the cloud.

 ![The image below shows the asw_server](image/image/aws_server.png)


 The image above is the interface of the **aws** platform, after creating an instance, a private key was downloaded on a local host from **AWS** while setting up the server, It is a PEM file format. However, the PEM will be used to connect to our EC2 instance via **ssh.** 
 Thereafter, remenber to run the command below to have access to the downloaded private key, then connect ssh key from the instance server.

  ![The image below shows the cd Downloads](image/image/cd.png)


  ### 2. Connect to the Instance: you can connect to the server by running the command below.

  `ssh -i "sammy-ec2.pem" ubuntu@ec2-18-219-135-230.us-east-2.compute.amazonaws.com`


- It is adviseable to read the information about AWS `free tier limits` and make sure that the **EC2** instance stopped when it's not in use.
Below is the location to stop the intance.

 ![The image below shows the stopping on instance](image/image/stopping_instance.png) 


 # Installing Apache and Updating the Firewall

 ### Step 1
 what is Apache?

 `Apache http Server` The Apache HTTP Server, commonly referred to as Apache, is one of the most widely-used open-source web servers in the world. It is maintained and developed by the Apache Software Foundation. Apache HTTP Server is known for its reliability, performance, and extensibility, making it a popular choice for hosting websites and serving web content.

## Here are some key features and aspects of the Apache HTTP Server:

- HTTP Protocol Support: Apache HTTP Server supports the Hypertext Transfer Protocol (HTTP) and its secure variant, HTTPS (HTTP over SSL/TLS). It can serve both static and dynamic content over the web.

  
- Modular Architecture: Apache uses a modular architecture, allowing administrators to extend and customize its functionality through modules. Modules can add features such as authentication, URL rewriting, caching, compression, and more.


- Cross-Platform: Apache HTTP Server is cross-platform and runs on various operating systems, including Linux, Unix, macOS, and Windows. This makes it suitable for a wide range of environments and deployments.


- Virtual Hosting: Apache supports virtual hosting, allowing multiple websites to be hosted on a single server. This feature enables efficient resource utilization and cost savings, especially in shared hosting environments.


- Security Features: Apache provides various security features to protect web applications and servers from common threats. These include access control, authentication mechanisms, SSL/TLS encryption, and support for secure protocols and ciphers.


- Performance Optimization: Apache HTTP Server offers various performance optimization features to improve web server performance and scalability. These include process/thread management, request handling optimizations, caching mechanisms, and more.


- Logging and Monitoring: Apache generates detailed access and error logs, providing valuable insights into web server activity and troubleshooting information. Administrators can use log analysis tools to monitor server performance, detect anomalies, and debug issues.


- Community and Support: Apache HTTP Server has a large and active community of users and developers who contribute to its development, documentation, and support. There are numerous resources available, including documentation, forums, mailing lists, and third-party tutorials.
Overall, Apache HTTP Server is a robust and versatile web server that powers millions of websites and web applications worldwide. Its flexibility, performance, and extensive feature set make it a preferred choice for hosting providers, enterprises, developers, and hobbyists alike.

Install Apache using Ubuntu's Package Manager `apt`

First update a list of Packages in package manager by running the command bellow.
`sudo apt update`
Then, run Apache2 package installation with command below.
`sudo apt install apache2`

 ![The image below shows the sudo_apt_update](image/image/sudo-apt-update.png)


 ![The image below shows the install_apache2](image/image/sudo-apt-install-apache2.png) 


 ![The image below shows the install_apache2b](image/image/sudo-apt-install-apache2b.png)


 ![The image below shows the install_apache2c](image/image/sudo-apt-install-apache2c.png) 


 To verify that apache2 is running as a Service in our OS, then, use the following command.

 `$ sudo systemctl status apache2`

 ![The image below shows the apache2 status](image/image/sudo-apache2-status.png) 
Always pay attention to the status, once it is green and running, then, you did everything correctly,know that the first webserver has been launched in the cloud.

Check if we can access our site locally in our Ubuntu shell, by running the command below:

`curl http://localhost:80`
or 
`curl http://3.15.239.94:80`

![The image below shows the curl](image/image/curl.png) 

The two command are thesame just that one is IP and the other is DNS, you can use either, just make sure the Apache web service response to `curl` command with some payload.

Now, It's time to test if the Apache HTTP Server can respond to request from the Internet. Open a web browser of your choice and try to access the following url.

`http://3.15.239.94:80`

Remember, If the following page display, then the webserver is now correctly installed and accessible through your firewall.


![The image below shows the http](image/image/http.png) 



# Installing Mysql

### Step2 - Installing Mysql

Just concluded the installation of web server and it's running perfectly, therfore we need to install a Database Management System (DBMS) to be able to manage data for the created website in a **relational database**. **MYSQL** is a popular relational database management system used within PHP environments, therefore,It's going to be used in our project.

Again, use `apt` to acquire and install this software:

Run the command below to install Mysql-server.

- `$ sudo apt install-server`


![The image below shows the installation of mysql](image/image/sudo-apt-install-mysql.png)


![The image below shows the installation of mysql](image/image/sudo-apt-install-mysql2.png) 


After tha installation, then type the command below to login into the MYSQL.

- `$ sudo mysql`

![The image below shows after mysql installation](image/image/sudo-mysql.png) 

This will connect to the MYSQL server as the administrative database user root, which is inferred by the use of sudo when running this command. Expect output like the result above.

It's recommended that you run a security script that comes pre-installed with MYSQL. This script will remove some insecure default settings and lock down access to your database system. Before running the script you will set a password for the root user, using mysql_native_password as default authentication method. We're defining this password as `PassWord.1`


- `ALTER USER 'root'@'localhost' IDENTIFIELD with mysql_native_password BY 'PassWord.1';`

After, Exit mysql with the command below.

- `mysql > exit`

 To start interactive script running:

 - `$ sudo mysql_secure_installation`

 ![The image below shows after mysql secure installation](image/image/sudo-mysql-secure-installation.png)  


 After, then follow up the prompt with "yes" to finalise the installation.
 Then, when the installation is finshed, test if you're able to login to the MYSQL console by typing the command below

-  `$ sudo mysql -p`

  ![The image below shows sudo mysql-p](image/image/sudo-mysql-p.png) 

The `-p` flag in this command, which will prompt you for the password used after changing the **root** user password.

To exit MYSQL console, type the command below.

`mysql> exit`


# Installing PHP

### Step 3 - Installing PHP.

PHP is the component of our setup that will process code to display dynamic content to the end user. In addition to the `PHP` package, you will need `php-mysql` A PHP-module that allows PHP to communicate with mysql based database. You will also need `libapache2-mod-php` to enable Apache to handle PHP files. Core PHP packages will automatically be installed as dependancies.

To install these 3 packages at once, then run the command below.

- `$ sudo apt install php libapache2-mod-php php-mysql`

  
![The image below shows sudo apt install php](image/image/sudo-apt-install-php.png) 


 ![The image below shows sudo apt install php](image/image/sudo-apt-install-phpcntl.png) 


Once the installation is finished, then run the following command to confirm your PHP version:

`php -v`

![The image below show php version](image/image/php-v.png) 


At this point, LAMP Stack is completly installed and fully operational.

- `Linux (Ubuntu)`
- `Apache HTTP Server`
- `MYSQL`
- `PHP`



# Enable PHP on the website

### Step 4 - Creating a virtual Host for Website using Apache.

In this project we are going to setup a domain called `projectlamp` although it can be replaced with your choice.

We are starting by creating a directory for `projectlamp` using 'mkdir' command as follows:

`$ sudo mkdir /var/www/projectlamp`

![The image below shows projectlamp](image/image/sudo-mkdir-projectlamp.png)

Next is to assign ownership of the directory with the `$user` environment variable, which will reference your current system user:

- `$ sudo chown -R $USER:$USER /var/www/projectlamp`


![The image below shows projectlamp](image/image/sudo-chown-projectlamp.png)

Then, create and open a new configuration file in Apache's `sites-available` directory using any preferred command-line editor, like vi or vim.  

![The image below shows projectlamp](image/image/sudo-viapache-projectlamp.png)

The above command will create a new blank file. then paste this setup on the editor configuration by hitting `i` on the keyboard to enter the insert mode, and paste the text:

Thereafter, than safe and exit the vi editor.


![The image below shows ls apache2 projectlamp](image/image/sudo-ls-apache2-projectlamp.png)


Thereafter, you can now use a2ensite command to enable the new virtual host:

`- $ sudo a2ensite projectlamp`


![The image below shows a2ensite projectlamp](image/image/sudo-a2ensite-projectlamp.png)


To disable Apache's default website use a2dissite command.


![The image below shows projectlamp](image/image/sudo-a2dissite.png) 

To make sure your configuration file doesn't contain syntax errors.

`$ sudo apache2ctl configtest`

![The image below shows projectlamp](image/image/sudo-apache2ctl-config.png)


Finally, reload Apache so these changes takes effect:

- `$ sudo systemctl reload apache2`

![The image below shows projectlamp](image/image/sudo-systemctl-reloadapache2.png)


Thereafter, a new website is now active, but the web root /var/www/projectlamp is still empty. Create an index.html file in that location so that we test the virtual host workers as expected:

![The image below shows url](image/image/url-dns.png)






# Creating a Virtual Host for Website using Apache.

### Step5 - Enable PHP on the website.

With the default Directory index settings on Apache, a file named `index.html` will always take precedence over an `index.php` file. This is useful for setting up maintenance pages in PHP applications, by creating a temporary `index.html` file containing an informative message to visitors.  Because this page will take precedence over the `index.php` page, it will then become the landing page for the application. Once maintenace is over, The `index.html` is renamed or removed from the document root, bringing back the regular application page.

Incase you want to to change this behaviour, you will need to edit the /etc/apache2/mods-enabled/dir.conf file and change the order in which the index.php file is listed within the DirectoryIndex directive:

![The image below shows projectlamp](image/image/sudo-viapache-projectlamp.png)

![The image below shows if-module](image/image/if-module.png)


After saving and closing the file, you will need to reload Apache so that changes take effect:

- `$ sudo systemctl reload apache2`

  Finally, we will create a PHP script to test that PHP is correctly installed and configured on your server.

 Now that I have a custom location to host website's file and folders. I will create a PHP test script to confirm that Apache is able to handle and process request for PHP files. 

 Create a new file named `index.php` inside my custom web root folder.

- `$ vim /var/www/projectlamp/index.php`

  The code above will open a blank file in vim text editor. Add the following text, which is valid PHP code, inside the file"

  `<?php`
  `phpinfo();`

After, then, save and close the file, refresh the page and a page similar to the code above will appear.

Then, remember, this page prove information about the server from the perspective of PHP.

If you this page below in your browser, then know that the PHP server installation is working as expected.

![The image below shows php-info](image/image/php_info.png)



It is adviseable to remove the file created because it contains sensitive information about my PHP environment and my Ubuntu server, then, I can use `rm` to execute.

- `$ sudo rm /var/projectlamp/index.php`

 #  THE END!





