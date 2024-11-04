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



