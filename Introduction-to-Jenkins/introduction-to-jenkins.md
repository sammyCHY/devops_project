# Introduction to Jenkins

# Introduction To CI/CD

Continuous Integration and Continuous Delivery (CI/CD) is a set of best practices and methodologies that revolutionize the software development lifecycle by enhancing efficiency, reliability, and speed. CI/CD represents a seamless integration of automation and collaboration throughout the development process, aiming to deliver high-quality software consistently and rapidly. In the realm of CI, developers regularly integrated their code changes into a shared repository, triggering automated builds and tests to detect integration issues early. On the other hand, CD encompasses both Continuous Delivery and Continuous Deployment, ensuring that software is always in a deployable state and automating the deployment process for swift and reliable releases. The CI/CD pipeline fosters a culture of continuous improvement, allowing development, allowing development teams to iterate quickly, reduce manual interventions, and deliver software with confidence.


# What is Jenkins

Jenkins is widely employed as a crucial CI/CD tool for automating software development process. Teams utilize Jenkins to automate building, testing and deploying applications, streamlining the development lifecycle. With Jenkins pipelines, developers can define, version, and execute entire workflows as code, ensuring consistent and reproducible builds. Integration with version control systems allows Jenkins to trigger builds automatically upon code changes, facilitating early detection of issues and enabling teams to deliver high-quality software at a faster pace. Jenkins' flexibility, extensibility through plugins, and support for various tools make it a preferred choice for organizations aiming to implement efficient and automated DevOPs practices.

# Project Pre-requisite

To make the most of this project, learners must have completed foundations Core programs 1 - 3

## Project Goals 

By the end of this Project, learners should have;

- Developed a foundational understanding of Continuous Integration (CI) and Continuous Delivery (CD) principles, and articulate their role in improving software development processes.

- Acquired proficiency in using Jenkins by mastering installation,configuration, and navigation through the Jenkins user interface, and gain hands-on experience in creating and managing Jenkins jobs.

- Learned the end-to-end process of automating software builds, runnings automated tests, and deploying applications using Jenkins, fostering a practices in CI/CD processes, including parameterized builds, integration with external tools, and leveraging containerization technologies like Docker.


# Project Highlight

- Introduction to CI/CD

- What is Jenkins

- Project Pre-requisites

- Project Goals

- Getting Started with Jenkins

- Jenkins Job

- Creating a Freestyle Project

- Connecting Jenkins To Our Source Code Management

- Configuring Build Trigger

- Creating a Pipeline Job

- Configuring Build Trigger 

- Writing Jenkins Pipeline script

- Installing Docker

- Building Pipeline Script


## Getting Started With Jenkins

Now that I have an idea what Jenkins, let's dive in to installing Jenkins

### Update Package Repositories


```
sudo apt update
```
![The Image shows the platform update by using sudo apt update](image/images/sudo-apt-update1.png)


![The Image shows the platform update by using sudo apt update](image/images/sudo-apt-update1.png)

Install JDK


```
sudo apt install default-jdk-headless
```

![The Image shows the default jdk headless](image/images/sudo-apt-install-default-jdk-headless1.png)


### *Install Jenkins*

```
  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```

![The Image shows the Installation of Jenkins](image/images/wget1.png)

![The Image shows the Installation of Jenkins](image/images/wget2.png)

![The Image shows the Installation of Jenkins](image/images/wget3.png)

The command installs Jenkins. It involves importing the Jenkins GPG key for package verification, adding the Jenkins repository to the system's sources, updating packages lists, and finally, installing Jenkins through the package manager (apt-get).

## Check if jenkins has been installed, and it is up and running.

```
sudo systemctl status jenkins
```
![The Image shows the Installation status of the Jenkins](image/images/sudo-systemctl-status-jenkins.png)

**On my Jenkins instance, create ne inbound rules for port 8080 in the security group**

By default, jenkins listens on port 8080, I will need create an inbound rule for this in the security group of my jenkins instance.

![The Image shows the ](image/images/security-inbound-rule.png)

**Set up Jenkins On The Web Console**

i.Input my Jenkins Instance ip address on my web browser i.e.
http://public_ip_address:8080

ii. On my Jenkins instance, check
"/var/lib/jenkins/secrets/initialAdminPassword" to know my password.

![The Image shows the Unlock Jenkins](image/images/unlock-jenkins.png)


![The Image shows the Unlock Jenkins access](image/images/jenkins-log-access.png)


iii. Installed suggested plugins


![The Image shows the installed Jenkins Plugins](image/images/install-plugins-jenkins.png)


iv. Create a user account


![The Image shows the installed Jenkins Plugins](image/images/jenkins-login-details.png)


![The Image shows the installed Jenkins Plugins](image/images/jenkins-login-details1.png)


![The Image shows the installed Jenkins configuration](image/images/instance-configuration.png)


![The Image shows the Jenkins configuration is ready](image/images/jenkins-is-ready.png)


v. Log in to jenkins console.


![The Image shows the Jenkins console](image/images/jenkins-console.png)