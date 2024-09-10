# Implementing Wordpress Website with LVM Storage Management.
This projact has to do with Implementing wordpress website with LVM storage Management on AWS EC2 Ubuntu.

- The course provides a step-by-step introduction to implementing wordpress on AWS EC2 Ubuntu as the operating system.

- The project will also teach how to leverage the power of AWS cloud infrastructure to build scalable and reliable WordPress sites. 

### Understanding 3 Tier Architecture 

**Web solution with Wordpress**

In this project I'm tasked to prepare storage infrastructure on two Linux servers and Implement a basic web solution using **WordPress**.

### Project 6 consist of two parts:

- Configure storage subsystem for web and Database servers based on Linux OS. The focus of this parts is to display a practical experience of working with disks, partitions and volumes in Linux.

- Install Wordpress and connect it to a remote MySQL database server. This part of the project will solidify the learning of deploying Web and DB tiers of Web solution.

### Three-tier Architecture.

- The **Three-tier Architecture** is a client-server software architecture pattern that comprise of 3 separate layers.

![The image shows the three tier architecture](image/images/three-tier-architecture.png)


1. **Presentation Layer** (PL): This is the user interface such as the client server or browser on a laptop.

2. **Business Layer** (BL): This is the backend program that implements business logic. Application or Webserver.

3. **Data Access or Management Layer** (DAL): This is the layer for computer data storage and data access. **Database Server** or File System Server such as ***FTP Server*** or ***NFS Server*** 

### The 3-Tier Setup.

1. A Laptop or PC to serve as a client.

2. An EC2 Linux Server as a web server (This is where I will install WordPress)

3. An EC2 Linux Server as a database (DB) server.

The project will be carried out using *`RedHat`* **OS for this project**


# Implementing LVM on Linux Servers (Web and Database Servers)

Step 1. - Prepare a Web Server.

1. Launch an EC2 instance that will serve as "Web Server". Create 3 volume in the same AZ as a web server EC2, each of 10 GiB.

![The image shows the add of EBS Volume to an EC2 instance](image/images/volume-db.png)


2. Attach all three volumes one by one to the Web Server EC2 Instance.

![The image shows the attached volume](image/images/attache-volume.png)


