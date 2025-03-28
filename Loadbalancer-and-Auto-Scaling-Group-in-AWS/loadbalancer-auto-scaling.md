
# Load Balancer and Auto-Scaling Group in AWS


### Load Balancer and AutoScailing group mini project. 

Today, I'm Exploring two essential tools in AWS:Load Balancers and Auto Scaling Groups. Imagine Load Balancers as traffic directors, making sure every visitor to my website gets where they need to go without any jams. And when the crowd starts pouring in, Auto scaling Groups kick into gear, bringing in extra servers to handle the rush. But before I jump in, let's get comfy with some basic cloud networking concepts. Ready to get started? Let's do this!


# Project Goals:

- Understand the concepts of High Availability and Scalability in cloud computing.

- Learn about Load Balancers and Auto sScaling Groups in AWS.

- Gain practical experience in setting up an Application Load Balancer (ALB) and configuring Auto scaling Groups (ASG) in AWS.

- Explore the importance of load balancing and auto-scaling in maintaining the reliability, availability, and performance of web applications.


# Learning Outcomes:

- Understand the concepts of High Availability, Scalability, Load Balancers, and Auto Scaling Groups.

- Learn how to create target groups and setup an Application Load Balancer to evenly distribute incoming traffic ac
ross multiple servers.

- Gain Knowledge of configuring Auto Scaling Groups to automatically adjust the number of instances based on demand.

Acquire troubleshooting skills to identify and resolve issues related to connectivity, security groups, and instance health in AWS.


What is High Availability?

Scalability is like being able to handle growth without breaking a sweat. Imagine I have a small bakery, and suddenly, I have to get a lot more customers than expected. Scalability means I can quickly bake more bread and pastries without the bakery falling apart. In tech, It's similar to set up my systems so that they can handle more and more users or customers without crashing or slowing down. So, whether it's adding more servers to my website during a big sale or making sure my app can handle a sudden surge in downloads, scalability ensure everything runs smoothly.

Let's understand some terms before going ahead with our practical.

1. Server: It's like a big computer that stores and shares stuff, like websites or apps, with other computers.

2. Client: This is my computer or phone, asking the server for stuff, like loading a web page or using an app.

![The image shows the client and server connecting](image/images/client.png)


![The image shows the client and server connecting](image/images/client2.png)

3. Traffic: Think of the "busy road" as the network infrastructre, like highways and streets, that connects servers (where websites and apps are hosted) to clients (like my computer or phone). It's where data packets travel back and forth, carrying information between the servers and the clients.

4. Redundancy: This is like having backups for importance stuff, just in case something breaks. It's like having spare parts for my bike so that I can keep riding even if something
breaks.

5. Server Load: Imagine a server like a superhero carrying heavy bags of data. Server load is like how heavy those bags are. Too many bags can slow the superhero down!

6. Routing: Routing refers to the process of determining the best path for data packets to travel from their source (like a server) to their destination (like a client devices). It's like finding the most efficient route on a map to reach my destination while avoiding traffic jams and roadblocks. Routing ensures that data packets reach their intended destination quickly and reliably across the network.

# What is Load balancer?

- Imagine, I have a popular restaurant with only one cashier. As the day goes goes on, more and more customers start coming in, lining up to place their orders. Eventually, the line gets so long that customers become frustrated, dome may even leave without ordering, and the cashier gets overwhelmed trying to handle all the orders.

- A load balancer is like adding more cashier to the restaurant to help manage the increasing number of customers. It's a specialized device or software that evenly distribute incoming network traffic or workload across multiple servers or resources.

- So, I can say that a load balancer helps spread the workload across several servers, ensuring that no single server gets overwhelmed with too much traffic or requests. This not only improves the performance and response time of the system but also increase its reliability and availability. If one server goes down,the load balancer can redirect traffic to the remaining servers, minimizing downtime and ensuring that the service remains.

![The image shows the client and server on loadbalancing](image/images/clients-server.png)

**Why is a load balancer important, and what could happen if we don't use it?**

- Imagine my website is like a bustling restaurant, and each visitor is a hungry customer lining up to place an order. Just like how a single cashier would struggle to handle a long line of customers, a single server for my website would struggle to handle too many visitors at once.

- That's where the load balancer comes in! It's like hiring extra cashiers for my restaurant. The load balancer helps spread out all those incoming visitors accross multiple servers, so no single server gets overwhelmed. Thsi keeps things running smoothly, and visitors don't have to wait forever to see my website.

- But what I didn't have a load balancer? well, It's d be like trying to run a restaurant with just one cashier on a super busy day. The line would get longer and longer, customers would get frustrated and might leave without ordering. And worst of all, my cahsier would be stressed out and might even crash under the pressure.

- Similarly, without a load balancer, my website could slow down or even crash when too many people try to visit it at once. Visitors would get error messages instead of seeing my awesome website, and I could end up losing customers and business.

So, in simple terms, a load balancer is lkie having extra cashiers for my website, making sure everything runs smoothly even when lots of people are trying to visit it at the same time.

**Types of Load balancer**

In AWS, there are mainly four types of load balancers:

1. Application Load Balancer

2. Network Load Balancer

3. Classic Load Balancer

4. Gateway Load Balancer

In this project, I will exclusively focus on the Application Load Balancer.

# What is an Application Load Balancer?

Imagine I have a website that's gettinga lot of visitors. When someone visits my website, their request needs to be send to one of my website's server to show them the webpage they want. Now, if I have multiple servers running my website, I need a way to decide which server should handle each request. That's where an Application Load Balancer (ALB) comes in.

Think of an ALB as a traffic cop for my website. It sits in front of my servers and receives all the incoming requests from users. when a user wants to visit your websites, their request goes to the ALB first.


But how does the ALB decide which server should handle each request? It uses a set of rules that my define. These rules can be based on things like the URL the user wants to visit, the type of request (like HTTP or HTTPS), or even custom conditions you specify.

Once the ALB decides which server should handle the request, it sends the request to that server. This helps distribute the incoming traffic evenly among all my servers, so no single server gets overloaded.

- But ALBS don't just send requests to servers blindly. They also monitor the health of your servers. If a server goes down or becomes unhealthy for some reason, the ALB stops sending requests to that server until it's back up and running properly. This helps ensure that my website stays reliable and available even if one of my servers has issues.

- An Application Load Balancer (ALB) works at Layer 7 of the OSI model, which is the application layer. This is what makes it different  from other load balancers. Because it works at layer 7, the ALB can make smart decisions based on the actual content of the web traffic. for Example, if a request comes in for "www.gatogrowfast.net/login," the ALB can send it to a server that handles login requests. If another request comes in for www.gatogrowfast.net/shop," it can route that to a different server that deals with the shopping section. This ability to understand and manage different types of traffic helps improve how well your applications run.

- So, in simple terms, an Application Load Balancer is like a traffic cop for your website, directing imcoming requests to the right servers based on predefined rules, and making sure everything runs smoothly and efficiently.

**Note-** The OSI model is a framework used to understand how different network protocols interact. It has seven layers: Physical, Data Link, Network, Transport, Session, Presentation, and Application. Each layer has a specific role, like how data is transmitted, routed, and presented to users. The Application Load Balancer (Layer 7), allowing it to make decisions based on the content of the data.  


![The image shows the application loadbalancer](image/images/users.png)

Lets take a look at a few terms that will help me grasp Auto Scaling Groups easily.

**Scaling:** Scaling refers to adjusting the size of something to meet changing needs. In the context of technology, like with websites or apps, scaling means adding more resources, like with websites or apps, scaling means adding more resources, like servers, when there's lots of demand, and removing them when demand goes down. It's like having more waiters in a restaurant during busy times and fewer when it's quiet, so customers don't have to wait too long to be served.

**Scaling Out:** When things get busy, scaling out means adding more helpers to handle the work. It's like calling in extra staff at a restaurant when there's a rush of customers. This helps keep things running smoothly and prevents long waits. So scaling Out refers to increase the number of instances in response to increase demand or workload.


![The image shows the scaling out](image/images/scaling-out.png)


**Scaling In:** On quieter days, scaling in means sending some of the extra helpers home. It's like letting staff go home early when the restaurant isn't as busy. This saves money and makes sure I will not be paying for more help than I need. So Scaling In refers to decreasing the number of instances when the demand or workload decreases.

![The image shows the scaling in](image/images/scaling-in.png)

**Auto Scaling:** Auto scaling means automatically adjusting the number of servers or resources based on changing demands or workload. It's like having a smart system that adds more waiters to a restaurants when it gets busy and sends them home when it's quiet, without needing someone to do it manually. This helps ensure that websites or apps can handle varying levels of traffic efficiency and cost-effectively.

# What is an Auto-Scaling group in AWS?

Think of an Auto Scaling Group in AWS like a team of workers ready to help out when things get busy.I tell AWS how many workers I needed at different times, and it automatically adds or removes them based on how much work there is. So, If my website suddenly gets lots of visitors, AWS will quickly add more servers to handle the traffic. and when things calm down, it will send some servers home to save money. It's like having a flexible workforce that grows and shrinks with my needs, ensuring my website stays up and running smoothly with minimal effort on my part.

- Let's move on to the practical aspect. I will split it into two parts. 

Part 1 will cover setting up the Application Load Balancer.

part 2 

Will focus on configuring the Auto Scaling Group.

# Part - 1

We have created some EC2 instances,


![The image shows the three ec2 instances](image/images/ec2-instances.png)


And these instances contain some website having the below content,


![The image shows the targer instance html](image/images/index-html-instance1.png)

![The image shows the targer instance html](image/images/index-html-instance2.png)

![The image shows the targer instance html](image/images/index-html-instance3.png)


In a real-world scenario, all targets would typically have the same data. But here we've added different data to each of the three target instances to show how the load balancer connects to all of them.

After that,

A- Creating Target groups -

1. First, navigate to the AWS console.

a) Then, locate the EC2 service by using the search function.

b) Then click on "EC2".


![The image shows the ec2 service](image/images/ec2-service.png)


2. Now, scroll down untill I locate the Target groups. Click on it.

a) Then select the option to create a new target group.


![The image shows the target group](image/images/target-group.png)

3. Choose instances as a target type.


![The image shows the creating target group](image/images/creating-target-group.png)

4. Now, I have to provide a name for my target group.

a) Set the protocol to HTTP

b) Choose port no. as 80

c) Select "IPv4" as the IP address type.

d) Next, I have to select the VPC that I ve [perviously created project](./AWS VPC mini project.md) in my projects from the available options. 


![The image shows the creating target group for alb](image/images/target-group-for-alb.png)

e) Keep all settings at their default values and proceed by clicking on the "Next" button.

![The image shows the creating target group created](image/images/creating-target-group-next.png)


5. Now, I have to choose the instances I've created to serve as targets for the application load balancer.


![The image shows the registar target group created](image/images/registar-target.png)

a) Now, I have to click on "includes as pending below".

b) Now, click on "create target group."


![The image shows the create target group](image/images/create-target-group1.png)

My target group is been successfully created.


![The image shows the create target group successfully](image/images/target-group-successfully-created.png)


B - Creating Load balancer

1. On EC2 page, scroll down until I locate the Load Balancer service. Click on it.

a) Then select the option to create a new load balancer


![The image shows the create load balancer](image/images/new-load-balancer.png)

2. After selecting to create a new load balancer, proceed by choosing the "Create" option specifically for the Application Load Balancer.


![The image shows the selection of load balancer type](image/images/load-balancer-type.png)

3. Enter the name for my load balancer, ensuring it reflect it's purpose cleraly.

a) Then, select "Internet-facing" as the scheme.

b) Choose "IPv4" as the IP address type

![The image shows the creation of load balancer](image/images/my-first-load-balancer.png)


c) Select the VPC I have already created in the [previous project](./AWS VPC mini project.md).

![The image shows the network mapping of load balancer](image/images/network-mapping.png)


d) Select the AZ and choose the public subnet there.

As in our [Previous VPC project](./AWS VPC mini project.md), we have created only one public subnet but here while creating load balancer, I will need at least two public subnet in different AZ's, so now I'm aware of how to create subnet and how to do subnet association for route table, so first do that by right clicking on the table where I'M currently are and open a duplicate tab and then on that duplicate tab first create the subnet and attach the route table with that subnet in which I have provided the way on how to connect to internet gateway and then process with this load balance part on the previous tab.

**Note:** My subnet will not be considered as public subnet until I associate the route table which I have given the path for internet gateway so I have to make sure to do that part.


![The image shows the network mapping of load balancer](image/images/network-mapping-public.png)

a) For now, use the default or already created security group as it is.

![The image shows the  security group of load balancer](image/images/security-group.png)


b) Select the target group I have created just before in part -1.


![The image shows the listeners and routing](image/images/listeners-routing.png)


c) Now leave everything as it is and click on create load balancer.


![The image shows the final creation fo load balancer](image/images/create-load-balancer-final.png)


If you get something like this below.

![The image shows the error in creatin load balaner](image/images/basic-configuration.png)


Just use a smaller name

![The image shows the error in creatin load balaner](image/images/basic-configuration2.png)

My application load balancer has been created successfully.


![The image shows the creation of application load balaner](image/images/application-load-balancer-created-successfully.png)

**Note:** If I encounter a message indicating "0 healthy targets" and "0 unhealthy targets, " it likely means that my targets have not been properly attached to the target group. Ensure that the attachement process has been completed successfully to resolve the issue.


![The image shows the selection target group healthy and unhealthy](image/images/my-target-group-healthy.png)

After creating the ALB (Application Load Balancer), go to target groups section and check the healthy of the instances.


![The image shows thetarget group status check](image/images/my-target-group-status-check.png)

Note: If you notice that all instances are marked as unhealthy or if any individual instance is deemed unhealthy, It's essential to first verify connectivity. I can do this by attempting to ping the instances to confirm network reachability.

To troubleshoot, follow these steps:

1. Search for "Command prompt" on my laptop


![The image shows the command prompt on the search box](image/images/command-prompt.png)

2. Copy the public IP addresses of the instances


![The image shows the copy public ip address of instance](image/images/copy-ip-address-instances.png)


3. Open Command Prompt and type:

`ping <public IP of instance>`


![The image shows the ping and IP on the terminal](image/images/ping1.png)


![The image shows the ping and IP on the terminal](image/images/ping2.png)


It appears thats I'm currently unable to establish a connection to the instance using its public IP address. If I will be able to successfully connect to the instances via their public IP addresses, it confirms that there's connectivity to them. In that case, if the intances are still marked as unhealthy in the load balancer, I may need to investigate further to determine the root cause of the issue.

Let's see some of the thing I need to keep in mind,

**Security Group Configuration:** Make sure that the security groups associated with my instances allow inbound traffic from the Application Load Balancer (ALB) on the necessary ports. Check that the security group rules are correctly configured to allow traffic from the ALB's security group.

**Network ACL Configuration:** If a network ACL (NACL) is attached to the subnet where my target instances are running, review the inbound and outbound traffic rules of the NACL. Ensure that the NACL is not blocking traffic from the ALB or from the internet to the instances.

**Web Server Configuration:** Verify that my web server is configured correctly on my instances. Check that the web server is listening on the correct port and is serving the correct content. Ensure that there are no misconfigurations or errors in the web server configuration files.

**Firewall Rules:** Check if there are any firewall rules or ip tables rules on the instances that may be blocking incoming tarffic. Review the firewall settings to ensure that they alow traffic from the ALB and from the internet.

**Health Check Configuration:** Review the health check settings for the target group. Ensure that the health check path and protocol are configured correctly to match the cnfiguration of the web server. Check that the health check endpoint is accessible and returning the expected response.

**Instance Status:** Verify the status of my instances in the EC2 dashboard. Ensure that the instances are running and reacheable within my VPC. If there are any issues with the instances themselves, troubleshoot and resolve the accordingly.

If I re seeing this type of output, it indicates that the connectivity has been established.



****************


Currently, our actual output indicates that all our instances are healthy.

![The image shows the registered targets](image/images/registered-targets.png)

Now,

4. From the Load Balancer page, copy the DNS of the load balancer.

5. Paste it into a new tab within your Chrome browser.

![Alt text](./Gif/Load balancer and Autoscailing group mini project gif/ibvideo.gif)

Here, you'll observe that the load balancer is evenly distributing the workload across all three instances.

Now, let's come to our next part.


**Part -2**

A- Creating Auto Scaling group.

1. Go to the search bar on the AWS console and search for "Auto Scaling Group". You'll find it there.

a) click on it.


![The image shows the click auto scaling group](image/images/auto-scaling-group.png)

Alternatively, I can scroll down on the EC2 page and navigate to the Auto Scaling Group in the Auto Scaling section. Once there, click on the "Auto scaling Groups" link to proceed.


![The image shows the amazon auto scaling group](image/images/amazon-auto-scaling-group.png)


3. Click on "create a launch template"

![The image shows the choose launch template](image/images/choose-launch-template.png)

Now, I will be navigated to the new tab where I will have to launch a template.

4. Choose a name for the launch template.

a) In the "Quick Start" section of the AWS Management Console, select the "Amazon Linux AMI" option.

![The image shows the create launch template](image/images/create-launch-template.png)

This will provide you with a pre-configured Amazon Machine Image (AMI) for launching instances based on the Amazon Linux operating system.

b) Choose the instance type as "t2 micro."


![The image shows the create launch template](image/images/launch-template-content.png)


c) Now, Choose the "create new pair" option in the key pair section


![The image shows the amazon machine image](image/images/amazon-machine-image.png)

d) Provide a name for the key pair.e) Click on "Create key pair."

![The image shows the creation the key pair](image/images/create-key-pair.png)

I have successfully created and added the key pair to the launch template. Although, I have already existing key, I don't need to create new key.


f) In the network settings, select the public subnet that I have created in [Previous project](./AWS VPC mini project.md) for launching your instance.


g) When configuring security groups, I have two options: I can either use a pre-existing security group or create a new one.


![The image shows the creation of the key pair](image/images/key-pair.png)

**Note:** Ensure that the security group being used allows inbound and outbound traffic for all types of traffic for the CIDR 0.0.0.0/0.

h) Now, Click on "Advanced Network Configuration."


![The image shows the network setting](image/images/network-setting.png)

i) Select the "Enable" option for auto-assigning public IP addresses.

j) And choose the security group that has an inbound and outbound rule allowing all traffic.


![The image shows the advanced network configuration](image/images/advanced-network-configuration.png)


k) Now Go to advanced settings.

![The image shows the ebs volume](image/images/ebs-volume.png)

l) In the user data section, include the following code.  

![The image shows the advanced details user data](image/images/advanced-user-data.png)


![The image shows the bash code](image/images/bash-code.png)


**Explanation of the user data script**

#!/bin/bash: This line specifies that the script should be executed using the Bash shell.

*yum update -y:* Updates the package repository and installs any available updates.

yum install -y httpd: Installs the Apache web server (HTTPD) package.

**service httpd start:** Starts the Apache web server.

*Chkconfig httpd on:* Configures Apache to start automatically upon instance boot.

- chkconfig: This command manages which services start automatically at different runlevels.

- httpd: This refers to the Apache HTTP server service.

- on: This option enables the service to start at boot time.

**echo"**

...

" > /var/www/html/index.html: Creates a basic HTML file with a welcome message and saves it as index.html in the default web root directory (/var/www/html).

m) Now, click on "Craete launch template."


![The image shows the creation of launch templates](image/images/create-launch-template.png)

I have successfully created the launch template,

Now, return to my previous tab containing the Auto Scaling Group settings.


![The image shows the launch of templates](image/images/launch-template.png)


5. Now, provide a name for the Auto Scaling Group.

a) Select the launch template that was created earlier.


![The image shows the launch of templates](image/images/choose-launch-template2.png)


6. Now, click on the "Next"


![The image shows the launch of templates](image/images/launch-template-next.png)


7. Choose the required instances attributes.


![The image shows the required instance attribute](image/images/required-instance-attribute.png)

8. Select the VPC that was created in the [Previous project](./AWS VPC mini project.md).

a) Select the Availability zones.

b) Click on "Next"

![The image shows the network settings](image/images/network.png)

9. Now, choose the option to "Attach to a new load balancer"

![The image shows the configuration of advanced option](image/images/configured-advanced-options.png)

a) Select the load balancer type as "Application Load Balancer,"

b) Provide a name for the load balancer.

c) choose "Internet-facing" for the load balancer scheme. Ensure to review the VPC ID before proceeding.


![The image shows the attache of the load balancer](image/images/attach-new-load-balancer.png)

d) I have to select public subnets for both availability zones.


![The image shows the network mapping in different subnet](image/images/network-mapping.png)


**Note -**

*Region:* Think of a region as a big area, like a country or state, where cloud services are available. Each region has multiple data centers, and they're located in different parts of the world. Foe example, there might be a region in the United State, another in Europe, and so on.

**Availability Zone (AZ):** Within each region, there are separate buildings or facilities called availability zones. I can think of these as neighborhoods within the region. Each availability zone is isolated from the others, so if something goes wrong in one zone, it doesn't affect the others. This adds an extra layer of resilience and reliability to the cloud infrastructure. For more info I can go through *AWS Regions and Zones*

e) In the default routing configuraton, I have the option to create a new target group.


![The image shows the setting of listener and routing](image/images/listener-routing.png)


f) I have to provide name for target group.

g) Click on Next


![The image shows the next to set a target group](image/images/next.png)


10. In this section, I can specify my desired capacity for instances created by the Auto Scaling Group.



![The image shows the configuration of group size and scaling](image/images/configure-group-size-and-scaling.png)


a) Also specify the minimium and maximium capacity as per my requirements.


![The image shows the scaling](image/images/scaling.png)


**Note-**

**Desired Capacity:** This is like deciding how many chairs I want to set up for a party before my guests arrive. It's the number of instances I want my Auto Scaling Group (ASG) to maintain at all times, based on my expected workload.

**Minimium Capacity:** Think of this as the lowest number of chairs I absolutely need to have available, no matter what. It's the minimium number of instances that my ASG will always keep running, even if there's very little traffic or workload.

**Maximum Capacity:** This is like setting a limit on how many chairs I can have at my party, even if more people show up unexpectedly. It's the maximium number of instances that my ASG can scale up to in response to increased traffic or workload.

So, in simpler terms, the desired capacity is what I aim for, the minimum capacity is the lowest I will accept, and the maximum capacity is the most I'm willing to have, even if things get busy.


b) Now, proceed by clicking on "Next"

![The image shows the scaling](image/images/scaling-next.png)


11. Click on "Next" once more to proceed further.


![The image shows the scaling](image/images/auto-scaling-next.png)


12.  Tags can be added by clicking on add tags.


![The image shows the tags can be added on auto scaling group](image/images/auto-scaling-tags.png)

a) Choose the desired key and value for the tag.

b) Then proceed by clicking on "Next."



![The image shows the tags can be added on auto scaling group](image/images/auto-scaling-add-tags.png)


13. I have to review the settings I have configured for the Auto Scaling Group, and once satisfied click on "Create Auto Scaling Group".


![The image shows the creation of the auto scaling group](image/images/create-auto-scaling-group.png)


Auto Scaling group is been configured successfully.

![The image shows the creation of the auto scaling group](image/images/ auto-scaling-group-configured.png)


14. Click on "new-asg"


15. Navigate to the "Instance Management" section.


![The image shows the auto scaling group of instance management](image/images/auto-scaling-group-instance-management.png)


Here, I will observe that the Auto Scaling Group has successfully created instances according to the desired capacity I have specified, which in this case is 2.

16. If I navigate to the Load Balancer section in the EC2 page, I will notice that my load balacer has also been created.



![The image shows the load balancer created](image/images/load-balancer-created.png)


Note- In Case If it doesn't appear immediately, try refreshing the page by clicking on the top square-shaped icon. Click on it.

The two instances were created by the Auto Scaling Group. Since the desired capacity was set to 2, the Auto Scaling Group. instantiated two instances accordingly. Regarding scaling, the Auto Scaling Group is configured to scale in until there are one instances remaining; it won't decrease the count below this threshold. Similarly, it can scale out to a maximium of four instances based on the load; however, it won't exceed this limit. Now if I want to see the website, I can again use the Load balancer DNS.

************


Lets observe the behaviour when one of the instances created by the Auto Scaling Group (ASG) is deleted.

As depicted in the GIF provided, the ASG will automatically launch a new instance to maintain the desired state. This demonstrates the dynamic nature of ASG, which adjusts the number of instances based on the configured capacity settings.


**Project Reflection:**

- Explored the significance of High Availability and Scalability in cloud infrastructure.

- Learned about Load Balancers and their role in distributing incoming traffic to ensure optimal performance and reliability.

- Understood the concept of Auto Scaling Groups and hoe they dynamically adjust the number of instances based on workload.

- Gained practical experience in setting up an Application Load Balancer and configuring Auto Scaling Groups in AWS.

- Developed troubleshooting skills to address issues related to connectivity, security groups, and instance health.

- Enhanced understanding of cloud networking concepts and their practical application in deploying scalable and reliable web applications.