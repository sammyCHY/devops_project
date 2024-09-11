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

![The image shows the server, the web-server and database server](image/images/web-server&database-server.png)

1. Launch an EC2 instance that will serve as "Web Server". Create 3 volume in the same AZ as a web server EC2, each of 10 GiB.
The video on this link show how to Add EBS Volume to an EC2 Instance [click here to watch the video](https://www.youtube.com/watch?v=HPXnXkBzIHw)

![The image shows the add of EBS Volume to an EC2 instance](image/images/volume-db.png)


2. Attach all three volumes one by one to the Web Server EC2 Instance.

![The image shows the attached volume](image/images/attached-volume.png)

3. Open up the Linux terminal to begin configuration.

4. I will have to use `lsblk` command to inspect what block devices are attached to the server. Notice names of the newly created devices. All devices in the Linux in /dev/ directory. Inspect it with `ls/dev/` and I have to make sure all 3 newly created block devices there- their names will likely be `xvdf`, `xvdg`, `xvdh`.

![The image shows the 3 newly created block devices](image/images/lsblk-attached-volume.png)

4. Use `df -h` command to see all mounts and free space on your server

![The image shows the mounts partition server](image/images/df-h-mounted-point.png)

5. Use `gdisk` utility to create a single partition on each of the 3 disks

![The image shows the gdisk to create a partition](image/images/sudo-gdisk-dev-xvdf1.png)


![The image shows the gdisk to create a partition](image/images/sudo-gdisk-dev-xvdf2.png)


![The image shows the gdisk to create a partition](image/images/sudo-gdisk-dev-xvdfg1.png)


![The image shows the gdisk to create a partition](image/images/sudo-gdisk-dev-xvdfg2.png)


![The image shows the gdisk to create a partition](image/images/sudo-gdisk-dev-xvdfh1.png)


![The image shows the gdisk to create a partition](image/images/sudo-gdisk-dev-xvdfh2.png)

After the partition.

5. Use `lsblk` utility to view the newly configured partition on each of the 3 disks.



![The image shows the configured partition](image/images/lsblk-mounted.png)


6. Install  `lvm2` packaging using `sudo yum install lvm2`. Run `sudo lvmdiskscan` command to check for available partitions.


![The image shows the lvm2 packaging](image/images/sudo-yum-install-lvm1.png)



![The image shows the lvm2 packaging](image/images/sudo-yum-install-lvm2.png)


![The image shows the lvm2 packaging](image/images/sudo-yum-install-lvm3.png)


Run `sudo lvmdiskscan` command to check for available.

![The image shows the lvmdiskscan](image/images/sudo-lvmdiskscan.png)


7. Use  `pvcreate` utility to mark each each of 3 disks as physical volumes (PVs) to be used by LVM

`sudo pvcreate /dev/xvdf1`
`sudo pvcreate /dev/xvdg1`
`sudo pvcreate /dev/xvdh1`


![The image shows the use pvcreate](image/images/pvcreate.png)


8. Verify that the physical volume has been created successfully by running `sudo pvs`

![The image shows the created physical volume](image/images/sudo-pvs.png)

9. Use `vgcreate` utility to add all 3 PVs to a volume group (VG). Name the VG **webdata-vg** 

`sudo vgcreate webdata-vg /dev/xvdf1 /dev/xvdg1 /dev/xvdh1`

10. Verify that the VG has been created successfully by running `sudo vgs`


![The image shows the VG created running successfull](image/images/sudo-vgs.png)


11. Use `lvcreate` utility to create 2 logical volumes. apps-lv (**Use half of the PV size**), and **logs-lv Use the remaining space of the PV size**. **NOTE**: *apps-lv* will be used to store data for the Website while, *logs-lv* will be used to store data for *logs*.

`sudo lvcreate -n apps-lv -L 14g webdata-vg`

`sudo lvcreate -n logs-lv -L 14g webdata-vg`

12. Verify that the Logical volume has been created successfully by running `sudo lvs`

![The image shows the logical volume created](image/images/sudo-lvs.png)

13. Verify the entire setup.

`sudo vgdisplay -v #view complete setup - VG, pv, and LV`

![The image shows the vgdisplay](image/images/sudo-lvs-vgs-pvs.png)


14. Use `mkfs.ext4` to format the logical volumes with `ext4` filesystem

`sudo mkfs -t ext4 /dev/webdata-vg/apps-lv`

`sudo mkfs -t ext4 /dev/webdata-vg/logs-lv`

![The image shows the formatting of logical volume](image/images/sudo-mkfs-ext4-apps-l.png)



![The image shows the formatting of logical volume](image/images/sudo-mkfs-ext4-logs-l.png)


15. Create **/var/www/html** directory to store website files

`sudo mkdir -p /var/www/html`


![The image shows the creation html directory](image/images/sudo-mkdir-p-html.png)

16. Create **/home/recovery/logs** to store backup of log data.

`sudo mkdir -p /home/recovery/logs`

![The image shows the recovery logs](image/images/sudo-mkdir-recovery-logs.png)


17. Mount **/var/www/html** on **apps-lv** volume

`sudo mount /dev/webdata-vg/apps-lv /var/www/html/`

![The image shows the mounted webdata vg](image/images/sudo-mounted.png)


18. Use **rsync** utility to backup all the files in the log directory **/var/log** into **/home/recovery/logs** (This is required before mounting the file system).


`sudo rsync -av /var/log/. /home/recovery/logs/`

![The image shows the recovery logs](image/images/sudo-rsync1.png)


![The image shows the recovery logs](image/images/sudo-rsync2.png)


19. Mount **/var/log** on **logs-lv** logical volume. (Note that all the existing data on /var/log will be deleted. That is why 15 above is very important).

`sudo mount /dev/webdata-vg/logs-lv /var/log`


![The image shows the mounted logs](image/images/sudo-mount-vg-webdata-logs.png)


20. Restore log files back into **/var/log** directory.

`sudo rsync -av /home/recovery/logs/log/. /var/log`


21. Update `/etc/fstab` file so that the mount configuration will persist after restart of the server.

The UUID of the device will be used to update the `/etc/fstab` file;

`sudo blkid`


![The image shows the sudo vi ect fstab for mount configuration](image/images/sudo-blkid.png)


sudo vi `/etc/fstab`

Update `/etc/fstab` in this format using UUID and leading and ending quotes should be removed.

![The image shows the update etc/fstab](image/images/sudo-vi-etc-fstab.png)


22. Test the configuration and reload the daemon.

`sudo mount -a`
`sudo systemctldaemon-reload`

![The image shows the sudo mount -a](image/images/sudo-mount-a.png)


![The image shows the reload of the uuid configuration](image/images/sudo-systemctl-daemon-reload.png)


23. Verify the setup by running `df -h`, output must look like this:


![The image shows the running setup by using df -h](image/images/sudo-systemctl-daemon-reload-df-h.png)



# Installing WordPress and Configuring to use MySQL Database

# Step 2 - Prepare the Database Server.

Launch a second RedHat EC2 instance that will have a role - 'DB Server' Repeat the same steps as for the Web Server, but instead of `apps-lv` create `db-lv` and mount it to `/db` directory instead of `/var/www/html/`


### Step3 - Install WordPress on  the Web Server EC2

1. Update the repository.
  
  `sudo yum -y update`

![The image shows the sudo yum -y update](image/images/sudo-yum-y-update2.png)



![The image shows the sudo yum -y update](image/images/sudo-yum-y-update3.png)



2. Install wget, Apache and it's dependencies.

`sudo yum -y install wget httpd php php-mysqlnd php-fpm php-json`

3. Start Apache.

`sudo systemctl enable httpd`
`sudo systemctl start httpd`

[The image shows the sudo systemctl enable, start and status of httpd](image/images/sudo-systemctl-start&status-httpd.png)

4. To install PHP and it's dependencies.

`sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm`
`sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm`
`sudo yum module list php`
`sudo yum module reset php`
`sudo yum module enable php:remi-7.4`
`sudo yum install php php-opcache php-gd php-curl php-mysqlnd`
`sudo systemctl start php-fpm`
`sudo systemctl enable php-fpm`
`setsebool -P httpd_execmem 1`


![The image shows the fedoraproject](image/images/sudo-yum-install-fedoraproject1.png)


![The image shows the fedoraproject](image/images/sudo-yum-install-fedoraproject2.png)


![The image shows the install yum-utilis-remirepo](image/images/sudo-yum-install-remirepo1.png)


![The image shows the install yum-utilis-remirepo](image/images/sudo-yum-install-remirepo2.png)



![The image shows the yum module reset php](image/images/sudo-yum-module-reset-php1.png)



![The image shows the yum module reset php](image/images/sudo-yum-module-reset-php2.png)



![The image shows the systemctl start & enable php](image/images/sudo-systemctl-start&enable-php-fpm.png)


5. Restart Apache.

`sudo systemctl restart httpd`

6. Download Wordpress and copy wordpress to `var/www/html`


`mkdir wordpress`
`cd   wordpress`
`sudo wget http://wordpress.org/latest.tar.gz`
`sudo tar xzvf latest.tar.gz`
`sudo rm -rf latest.tar.gz`
`cp wordpress/wp-config-sample.php wordpress/wp-config.php`
`cp -R wordpress /var/www/html/`


![The image shows the creation of mkdir & cd wordpress](image/images/mkdir-wordpress&cd-wordpress.png)



![The image shows the yum module reset php](image/images/sudo-yum-module-reset-php2.png)



![The image shows the wordpress installation](image/images/sudo-wget-wordpress.png)




