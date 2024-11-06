# Security Groups and NACLs Overview

During this project, I will explore the core concept of Amazon
Web Services (AWS), specifically focusing on Security Groups and Network Access Control Lists (NACLs). Our objective is to understand this these fundamental components of AWS infrastructure, including how Security Groups control inbound and outbound traffic to EC2 instances, and how NACLs act as subnet-level firewalls, regulating traffic entering and exiting subnets. Through practical demonstrations and interactive exercises, I will navigate the AWS management console to deploy and manage these critical components effectively.

Before I proceed with setting up Security Groups and NACLs, it's essential to ensure a solid understanding of cloud networking basics. If terms like "Security Groups" and "NACLs".


# Project Goals:

- Understanding the concepts of Security Groups and Network Access Control Lists (NACLs) in AWS.

- Explore how Security Groups and NACLs function as virtual firewalls to control inbound and outbound traffic.

- Gain hands-on experience with configurating Security Groups and NACLs to allow or deny specific types of traffic.

# Learning Outcome:

- Gain proficiency in configuring Security Groups and NACLs to control network traffic within AWS environments.

- Understand the different between Security Groups and NACLs, including their, scope, statefulness, and rule configurations.

- Learn how to troubleshoot network connectivity issues by analyzing Security Group and NACL configurations.

- Develop a deeper understanding od AWS networking concepts and best practices for securing cloud environments.

** Let's first understand some terms-

** Security Group (SG)

- Inbound Rules: Rules that control the incoming traffic to an AWS resources, such as an EC2 instance or an RDS database.

Outbound Rules: Rules that control the outgoing traffic initiated by the instances to which they are attached.

- Port: A communication endpoint that processes incoming and outgoing network traffic. Security groups use ports to specify the types of traffic allowed.

Protocol: The set of rules that govern the communication between different endpoints in a network. Common protocols include TCP, UDP,and ICMP. 

# Network Access Control List (NACL):

- **Subnet-level firewall:** NACLs act as a firewall at the subnet level, controlling traffic entering and exiting the subnet.

- **Stateless:** Unlike security groups, NACLs are stateless, meaning they do not automatically allow return traffic. I must explicitly configure rules for both inbound and outbound traffic.

- ***Allow/Deny:*** NACL rules can either allow or deny traffic based on the specific criteria.

- Ingress: Refers to inbound traffic, i.e., traffic entering the subnet.

- Egress: Refers to outbound traffic, i.e., traffic exiting the subnet.

CIDR Block: Specifies a range of IP addresses in CIDR notation (e.g.,10.0.0.0/24)that the NACL rule applies to.

# Default Settings:

**Default security Group:** Every VPC comes with a default security group that allows all outbound traffic and denies all inbound traffic by default.

- **Default NACL:** Every subnet within a VPC is associated with a default NACL that allows all inbound and outbound traffic by default.

# What is Security Group?

- AWS security groups are like bouncer at the door of a party. They decide who gets to come in (inbound traffic) and who gets kicked out (outbound traffic). Each security group is like a set of rules that tells the bouncers what's allowed and what's not.

- For example, I can create a security group for my web server that only allows traffic on port 80 (the standard port for web traffic) from the internet. This means only web traffic can get through, keeping my server safe from other kinds of attacks.

- Similarly, I can have another security group for database server that only allows traffic from my web server. This way, my database is protected, and only my web server can access it, like a VIP area at my party.

- In simple terms, security groups act as barriers that controls who can access my AWS resources and what they can do once they're in. They're like digital bouncers that keep my party (or my cloud) safe and secure.

# What is NACL?

- NACL stands for Network Access Control List.Think of it like a security checkpoint for my entire neighborhood in the AWS cloud. Imagine my AWS resources are houses in a neighborhood,and I want to control who can come in and out. That's where NACLS come in handy.

- NACLs are like neighborhood security guards. They sit at the entrance and check every person (or packet of data) that wants to enter or leave the neighborhood.

- But here's the thing: NACL work at the subnet level, not the individual resource level like security groups. So instead of controlling access for each house (or AWS resources), they control access for the entire neighborhood (or subnet) 

- I can set rules in my NACL to allow or deny traffic based on things like IP addressess, protocols, and ports like FTP or SSH.

unlike security groups, which are stateful (meaning they remember previous interactions), NACLs are stateless. This means I have to explicitly allow inbound and outbound traffic separately, unlike security groups where allowing inbound traffic automatically allows outbound traffic related to that session.

- In simple terms, NACLs act as gatekeepers for my AWS subnets, controlling who can come in and out based on a set of rules I defined. They're like security guards that keep my neighborhood (or my AWS network) safe and secure.


# Different between Security Groups and NACL

Security Groups in AWS act like virtual firewalls that control traffic at the instance level. They define rules for inbound and outbound traffic based on protocols, ports, and IP addresses. Essentially, they protect individual instances by filtering traffic, allowing only authorized communication.

- On the other hand, Network Access Control Lists (NACLs) function at the subnet level, overseeing traffic entering and leaving subnets. They operate as a barrier for entire subnets, filtering traffic based on IP addresses and protocol numbers. Unlike security groups, NACLs are stateless, meaning they don't remember the state of the connection, and each rule applies to both inbound and outbound traffic independently.

**Note-**  In security groups, ther's no explicit "deny" option as seen in NACLs; any rule configured within a security group implies permission, meaning that if a rule is established, it's automatically allowed.

Let's come to the practical part,

this practical will be in Two parts-

1. Security group

2. NACL

# Security group

- Initially I will examine the configuration of inbound and outbound rules for security groups.

- Create a security group allowing HTTP for all traffic and attach it to the instance.

# Explore various scenarios:

- Implement inbound traffic rules for HTTP and SSH protocols and allow outbound traffic for all.

- Configure inbound rules for HTTP with no outbound rules.

- Remove both inbound and outbound rules.

- Have no inbound rules but configure outbound rules for all traffic.

# NACL

- Examine the default settings for both inbound and outbound rules in NACL configuration.

- Modify the inbound rules to permit traffic from any IPv4 CIDR on all ports.

- Adjust the outbound rules to allow traffic to all CIDRs.

# Part -1

Just a quick reminder about the subnets we configured in our VPC in the [Previous Project](./AWS VPC mini project.md). In the public subnet, we've created an EC2 instance that is running, hosting our website. Now, let's take a moment to see if we can access the website using its public IP address.

- So this EC2 instances host our website.

![The image shows the ec2 instance for hosting website](image/images/ec2-instance.png)


[The image shows the ec2 instance for hosting website](image/images/ec2-instance2.png)

Here's the security group configuration for the instance. In the inbound rules, only IPv4 SSH traffic on port 22 is permitted to access this instance.

[The image shows the security group configuration](image/images/security-group-id.png)


[The image shows the inbound rule](image/images/inbound-rule.png)

For the outbound rule, I will notice that all IPv4 traffic with any protocol on any port number is allowed, meaning this instance has unrestricted access to anywhere on the internet.

[The image shows the outbound rule](image/images/outbound-rules.png)

Now, let's test accessibility to the website using the public IP address assigned to this instance.

Here, let's retrieve the public IP address.

[The image shows the retrieve of public ip](image/images/retrieve-public-ip.png)

If you enter "http:// 18.226.159.99" into my chrome browser, and hit enter, I will notice that the page doesn't load; it keeps attempting to connect. And finally it will show this page. After some time, I will likely see a page indicating that the site can't be reached. 

[The image shows the httd chrome browser](image/images/http-chrome-site.png)

This is because of the security group, because we haven't defined HTTP Protocol in the security group so whenever the outside world is trying to go inside my instance and trying to get the data, security group is restricting it and that's why we are unable to see the data.

To resolve this issue, we can create a new security group that allows HTTP (Port 80) traffic.

1. Navigate to the "security Groups" section on the left sidebar.

a) Then click on "Create Security Group".


[The image shows the creation of security group](image/images/create-security-group.png)


2. Provide a name and description for the new security group.

a) I have to ensure to select my VPC during the creation process.


[The image shows the creation of security group](image/images/create-security-group1.png)

b) Click on add rule.


![The image shows the "add rule"](image/images/add-rule.png)


c) Now, select "HTTP" as the type.


![The image shows the selection of http](image/images/add-http.jpg)

d) Use 0.0.0.0/0 as the CIDR Block. (Here I'm allowing every CIDR block by using this CIDR).

Now, the rule have been created.

![The image shows the inbound rule created](image/images/inbound-rule-created.png)

e) Keep outbound rules as it is

![The image shows the outbound rules created](image/images/outbound-rules-created.png)

f) Now, click on create security group


![The image shows the creation of security group](image/images/final-create-security-group.png)


Now, It's been created successfully.


![The image shows the security group created successfully](image/images/security-group-created-successfully.png)

Let's attach this security group to our instance.

3. Now navigate to the instance section of left side bar.

a) Select the instance.

b) Click on "Action"

c) Choose "security".


![The image shows the security group attached](image/images/security-group-attach.png)


d) Click, on "Change group security"

![The image shows the change in security group](image/images/change-group-security.png)


4. Choose the security group created.

![The image shows the choose the security group created](image/images/security-group-associated.jpg)

a) Click, on add security group.

![The image shows the add on security group](image/images/add-security-group&save.png)

b) I can see that the security is being added, Click on "Save".

**Note -** The security group named "Launch Wizard" I see is the default security group automatically attached when creating the instance. I can also edit this security group if needed.


![The image shows the add on security group](image/images/add-security-group&save.png)

5. Now, it is being attached successfully,

a) If I again copy the public IP address,


![The image shows the copy of the public IP address](image/images/public-ip-address.png)


b) And write http://3.149.23.98 in chrome, I will be able to see the data of my website. 


***********

Currently, let's take a look at how my inbound and outbound rules are configured.

This setup allows the HTTP and SSH protocols to access the instance.


![The image shows the ssh, http protocol access instance](image/images/ssh-http-protocols-access-instance.png)


The outbound rule permits all traffic to exit the instance.

![The image shows the outbound permit](image/images/outbound-permit.png)


Through this rule, we're able to access the website.

********


6. Let's see how removing the outbound rule affects the instances's connectivity. Means now, no one can go outside to this instance.


a) Go to outbound tab.

b) Click on "edit outbound rules".


![The image shows the edit of outbound rules](image/images/edit-outbound.png)


c) Click on "Delete."

d) Click on "Save rules."


![The image shows the edit of outbound rules](image/images/edit-outbound-rule.png)

Now that I ve removed the outbound rule, let's take a look at how it appears in the configuration.

![The image shows the edit of outbound rules delete](image/images/outbound-rule-delete.png)


After making this change, let's test whether we can still access the website.

*********


So, even through I ve removed the outbound rule that allows all traffic from the instance to the outside world, I can still access the website. Acording to the logic we discussed, when a user accesses the instance, the inbound rule permits HTTP protocol traffic to enter. However, when the instance sends data to the user's browser to display the website, the outbound rule should prevent it. Yet, I re still able to view the website. why might that be?

Secure groups are stateful, which means they automatically allow return traffic initiated by the instances to which they are attached. So, even though we removed the outbound rule, the security group allows the return traffic necessary for displaying the website, hence I can still access it.

Let's explore the scenario,

If I delete both the inbound and outbound rules, essentially, I will be closing all access to and from the instance. This means no traffic can come into the instance, and the instance cannot send any traffic out. So, If I attempt to access the website from a browser or any other client, it will fail because there are no rules permitting traffic to reach the instance. Similarly, the instance won't be able to communicate with any external services or websites because all outboud traffic is also blocked.


7. I will be able to delete the inbound rule in the same way I have deleted the outbound rule.

a) Go to outbound tab.

b) Click on edit inboud rule


![The image shows the edit of inbound rules](image/images/edit-inbound-rule.png)


c) Click on delete,

d) Click on "Save rule".

![The image shows the edit of inbound rules delete](image/images/edit-inbound-rule-delete.png)


Currently, let's have a look at how our inbound and outbound rules are configured.


![The image shows the edit of inbound rules saved](image/images/edit-inbound-rule-saved.png)


![The image shows the edit of outbound rules saved](image/images/edit-outbound-rule-saved.png)


Now, as both the inbound and outbound rules deleted, there's no way for traffic to enter or leave the instance. This means that any attempt to access the website from a browser or any other client will fail because there are no rules permitting traffic to reach the instance, In this state, the instance is essentially isolated from both incoming and outgoing traffic.

So I can't access the website now.


![The image shows the no access website](image/images/no-access-website.png)


In the next scenario,

I will add a rule specifically allowing HTTP tarffic in the outbound rules. This change will enable the instance to initate outgoing connections over HTTP.

8. Click on edit outbound rule in the outbound tab,


![The image shows the outbound tab](image/images/outbound-tab.png)


a) Click on "add rule"

b) Choose type.

c) Choose destination.

d) Choose CIDR.

e) click on "save rules"


![The image shows the edit outbound rule add](image/images/edit-outbound-rule-add.png)


![The image shows the edit outbound rule add](image/images/edit-outbound-rule-add1.png)


![The image shows the edit outbound rule add](image/images/inbound-rule1.png)


Now, let's see if we can access the website,

![The image shows the website access](image/images/access-website.png)


So, we are able to see it.

But if you look here, you will be able to go to the outside world from the instance. I 'm using here.


![The image shows the aws](image/images/aws.png)



