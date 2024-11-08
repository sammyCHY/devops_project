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


![The image shows the ec2 instance for hosting website](image/images/ec2-instance2.png)

Here's the security group configuration for the instance. In the inbound rules, only IPv4 SSH traffic on port 22 is permitted to access this instance.

![The image shows the security group configuration](image/images/security-group-id.png)


![The image shows the inbound rule](image/images/inbound-rule.png)

For the outbound rule, I will notice that all IPv4 traffic with any protocol on any port number is allowed, meaning this instance has unrestricted access to anywhere on the internet.

![The image shows the outbound rule](image/images/outbound-rules.png)

Now, let's test accessibility to the website using the public IP address assigned to this instance.

Here, let's retrieve the public IP address.

![The image shows the retrieve of public ip](image/images/retrieve-public-ip.png)

If you enter "http:// 18.226.159.99" into my chrome browser, and hit enter, I will notice that the page doesn't load; it keeps attempting to connect. And finally it will show this page. After some time, I will likely see a page indicating that the site can't be reached. 

![The image shows the httd chrome browser](image/images/http-chrome-site.png)

This is because of the security group, because we haven't defined HTTP Protocol in the security group so whenever the outside world is trying to go inside my instance and trying to get the data, security group is restricting it and that's why we are unable to see the data.

To resolve this issue, we can create a new security group that allows HTTP (Port 80) traffic.

1. Navigate to the "security Groups" section on the left sidebar.

a) Then click on "Create Security Group".


![The image shows the creation of security group](image/images/create-security-group.png)


2. Provide a name and description for the new security group.

a) I have to ensure to select my VPC during the creation process.


![The image shows the creation of security group](image/images/create-security-group1.png)

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

![The image shows the edit of outbound rules delete](image/images/oubound-rule-delete.png)


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


**Note-** curl is a command-line tool that fetches data from a URL.

As a result, the instances will be able to fetch data from external sources or communicate with other HTTP- based services on the internet. This adjustment ensures that while incoming connections to the instance may still be restricted, the instance itself can actively communicate over HTTP to external services.

Part- 2

Let's come to NACL,

1. First navigate to the search bar and search for VPC.

a) Then click on VPC.


![The image shows the vpc](image/images/vpc.png)


2. Navigate to the Network ACLs in the left sidebar.

a) Click on "Create Network ACLs".


![The image shows the Network ACLs](image/images/create-network-ACLs.png)


3. Now, I have to provide a name for my Network ACL,

a) Choose the VPC I have created in the [Previous session](./AWS VPC mini project.md) for the practical on VPC creation,

b) Then click on "Create network ACL."

![The image shows the Network ACLs](image/images/create-network-ACL.png)

4. After selecting the network I have created,

a) navigate to the "Inbound" tab

By default, you will notice that it's denying all traffic from all ports.

![The image shows the Network ACLs](image/images/network-ACLS-outbound-rule.png)

Similarly, If you look at the outbound rules, you will observe that it's denying all outbound traffic on all ports by default.

b) Select the NACL.

c) And navigate to the "Outbound" tab

![The image shows the edit inbound rule tab](image/images/network-ACL-outbound.png)


5. To make changes.

a) select the NACL,

b) Go to the "Inbound" tab

c) And click on "Edit inbound rules".


![The image shows the edit inbound rule tab](image/images/network-ACL-inbound.png)


6. Now, click on add new rule.

![The image shows the add new rule](image/images/NACL-add-new-rule.png)

7. Now, choose the rule number.

a) Specify the type.

b) Select the source

c) And determine whether to allow or deny the traffic.

d) Then click on "Save changes."


![The image shows the edit inbound rule ACL](image/images/edit-inbound-rule-ACL.png)


Currently, this NACL is not associated with any of the subnets in the VPC

![The image shows the  NACL not associated with subnets](image/images/NACL-non-associated-subnets.png)


8. Let's associate it.

a) Select your NACL.

b) Click on "Actions."

c) Choose "Edit subnet association"

![The image shows the  association of NACLs subnets](image/images/edit-subnet-association-ACL.png)

d) Then select my public subnet, as my instance resides in the public subnet.


![The image shows the  association of NACLs subnets](image/images/edit-subnet-association-ACL1.png)


Once selected, you'll see it listed under "Selected subnets"

e) Finally, click on "Save changes".



![The image shows the  association of NACLs subnets](image/images/edit-subnet-association-ACL2.png)

I have successfully associated my public subnet to this NACL


![The image shows the first NACL created](image/images/my-first-NACL-created.png)


As soon as I have attached this NACL to my public subnet, and then I will try to access the website again by typing the URL http://3.147.69.181/, I have noticed that I'm unable to see the website.

![The image shows the website http creation](image/images/website-http.png)


Although I ve been permitted all traffic in the inbound rule of my NACL, I'm still unable to access the website. This raises the question: why isn't the website visible despite these permissions?


The reason why I was unable to access the website despite permitting inbound traffic in the NACL is because NACLs are stateless. They don't automatically allow return traffic. As a result, I must explicitly configure rules for both inbound and outbound traffic.

Even though the inbound rule allows all traffic into the subnet, the outbound rules are still denying all traffic.


You can see.

![The image shows the network ACLs of inbound](image/images/Network-ACLs-inbound-rules.png)


![The image shows the network ACLs of outbound](image/images/Network-ACLs-outbound-rules.png)


![The image shows the aws vpc diagram](image/images/aws-vpc-diagram.png)

Not able to see website because I'm able to go inside of the subnet because of the inbound rule (allow all) but any traffic from subnet is not allowed to go outside due to the outbound rule (deny all).

9. If we allow outbound traffic as well,

a) Choose you NACL.

b) Go to outbound tab.

c) Click on "Edit outbound rules."


![The image shows the aws network acls edit outbound](image/images/network-acls-edit-outbound.png)

d) click on "Add rule"


![The image shows the network acl add rule](image/images/network-acl-add-rule.png)


e) Duplicate the process I followed for creating the inbound rules to establish the outbound rules in a sismilar manner.


![The image shows the edit outbound rule duplicate](image/images/edit-outbound-rule-dublicate.png)


You have successfully created the rules.


![The image shows the network acl inbound-rule-created](image/images/network-acl-add-rule-created.png)


Upon revisiting the website,I should now be able to access it without any issues.

************

Now, let's see one more interesting scenario,

In this scenario:

Security Group: Allows inbound traffic for HTTP and SSH protocols and permits all outbound traffic.

Network ACL: Denies all inbound traffic. Let's observe the outcome of this configuration.

**Security group,**

Configuring it,


![The image shows the edit inbound rule save rule](image/images/edit-inbound-rule-save-rule.png)


![The image shows the my first security group](image/images/my-first-security-group.png)


![The image shows the edit outbound rule ](image/images/edit-outbound-rule-final.png)


![The image shows the edit outbound rule ](image/images/my-first-security-group-outbound.png)


**NACL,**

Let's remove it so by default it be denied all traffic.


![The image shows the removal of NACL default](image/images/NACL-remove-default.png)



![The image shows the removal of NACL default successfull](image/images/NACL-remove-default-successful.png)


Additionally, the outbound rule will be removed, defaulting to deny all traffic by default.


![The image shows the removal of NACL default outbound](image/images/NACL-remove-default-outbound.png)



![The image shows the removal of NACL default outbound](image/images/NACL-remove-default-successful-outbound.png)


Now, let's try to access the website,


![The image shows the removal of NACL default outbound](image/images/NACL-remove-default-successful-outbound.png)


So, I was unable to access the website. why? Even if I have allowed inbound traffic for HTTP in security group.

Imagine, when been at the entrance of a building, and there's a security guard checking everyone who wants to come in. That security guard is like the NACL. They have a list of rules (like "no backpacks allowed" or "no food or drinks inside"), and they check each person against these rules as they enter.

Once you're inside the building, there's another layer of security at each room's door. These are like the Security Groups. Each room has its own rules, like "only employees allowed" or "no pets." These rules are specifically to each room, just like Security Groups are specific to each EC2 instance.

So, the traffic first goes through the NACL (the security guard at the entrance), and if it passes those rules, it then goes through security Group (the security check at each room's door). If it doesn't meet any of the rules along the way, it's denied entry.


The reason I can't see the website is because the NACL has denied inbound traffic. This prevent traffic from reaching the security group, much like a security guard not allowing entry to another room if access to the building is denied. Similarly, if someone can't enter a building, they can't access any rooms inside without first gaining entry to the building.

**Let's have a look on some scenarios and their outcomes,**

- NACL allows all inbound and outbound traffic, Security Group denies all inbound and outbound traffic: Outcomes: Website access will be blocked because the Security Group denies all traffic, overriding the NACL's allowance.

- NACL denies all inbound and outbound traffic, Security Group allows all inbound and outbound traffic: Outcome: website access will be blocked because the NACL denies all traffic, regardless of the Security Group's allowances.

- NACL allows HTTP inbound traffic, outbound traffic is denied, Security Group allows inbound traffic and denies outbound traffic: Outcome: Website access will be allowed because the Security Group allows HTTP inbound traffic, regardless of the NACL's allowances. However, if the website requires outbound traffic to function properly, it won't work due to the Security Group's denial of outbound traffic.

NACL allows all inbound and outbound traffic, Security Group allows all inbound and outbound traffic: Outcome: Website access will be allowed, as both NACL and Security Group allow all traffic.

- NACL allows all inbound and outbound traffic, Security Group allows all inbound and outbound traffic: Outcome: website access will be allowed, as both NACL and Security Group allow all traffic.

NACL denies all inbound and outbound traffic, Security Group allows HTTP inbound traffic and denies outbound traffic: Outcome: website access will eb blocked because the NACL denies all traffic, regardless of the Security Group's allowances.

**Project Reflection:**

- Successfully configured Security Groups and NACLs to control inbound and outbound traffic in AWS.

- Identified to difference between Security Group and NACLs and their respective roles in network security.


Explored various scenarios to understand how Security Groups and NACLs interact and impact network traffic.

- Learned valuable troubleshooting techniques for diagnosing and resolving network connectivity issues in AWS.

- Overall, gained practical experience and confidence in managing network security within AWS environments.








