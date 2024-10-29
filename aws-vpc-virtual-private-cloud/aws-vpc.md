
# AWS VPC- Virtual Private Cloud

I will explore the core concept of Amazon Web Services (AWS), focusing specifically on Virtually Private Clouds (VPCs). my objective is to understand the fundamental components of VPC infrastructure, including subnets, gateways, and routing tables. Through practical demonstrations and interactive exercises, I will navigate the AWS management console to deploy and manage these critical components effectively.

# Project Goals:

- Understand the fundamentals of virtual private cloud (vpc) and its components.

- Gain hands-on experience in setting up and configuring vpc, subnets, internet gateway, and vpc peering connections.

- Learn how to enable internet connectivity securely within a vpc. 

- Implement outbound internet access through the NAT gateway.

- Establish direct communication between VPCs using VPC peering.

**Learning Outcomes:**

- Acquired knowledge about vpc and its essential components, such as subnets,gateways,and route tables.

- Development skills in creating and configuring vpc resources using AWS management console.

- Learned how to set up routing tables to enable internet connectivity and outbound internet access securely.

- Gained understanding of vpc peering and its significance in connecting multiple VPCs within the same od different regions.

- Enhanced understanding of network security principles and best practices for cloud environments.

# What is VPC, Subnets, Internet Gateway and NAT Gateway?

Virtual Private Cloud (VPCS) Here's is an example:  Think of a site like GatoGrowFast.com office building. Inside, there are different departments like HR, Finance, and IT. Each departments has its own area with specific access rules. Similarly, in a VPC, GatoGrowFast.com can create different sections, called subnets, for different parts of the business.

- Now, let's say GatoGrowFast.com wants to connect its office to the internet. They'd use a router to control the flow of data in and out of the building. In a VPC, GatoGrowFast.com has something similar called an internet Gateway. It lets their VPC communicate with the internet securely.

- NAT (Network Address Translation) Gateway as a secret agent between GatoGrowFast.com's computers and the internet. When a computer inside their virtual office wants to talk to the internet, the NAT Gateway steps in. It translates the computer's message and sends it out, but it hides who send it. It's like sending a letter without your return address. This way, the internet only sees the NAT Gateway's address, keeping GatoGrowFast.com's computers safe and anonymous online.

- **Note-** A router is a device that directs data packets between computer networks. Think of it as a traffic cop for the internet. When data is sent from one device to another across a network, it's broken down into smaller packets. These packets need to find their way to the correct destination, and that's where the router comes in.

- A router knows how to send data packets from my device to the right destination on the internet. Routers use routing tables, which are like maps of the internet, to determine the best path for data packets to take. They analyze information in the packets, such as destination IP addresses, to make these decisions. Once the packets reach their destination, the router ensures they're delivered to the correct device.

# What is an IP address?

- An IP address is like a phone number for my computer. It's a unique set of numbers that helps computers find and talk to each other on a network, like the internet.

- There are two main types of IP addresses: Public IP addresses and private IP addresses. However, each type has different versions, with IPv4 and IPv6 being the most common.

***Public IP Address:*** This is like a home address. It's unique and helps other computers on the internet find mine. Just like how people send letters to someone's house using the house address, data packets are sent to my computer using its public IP address.


- A public IP address is globally unique and is assigned by the Internet Service Provider (ISP) to a device connected to the internet.

- It allows devices to communicate with other devices across the internet.

- Public IP addresses can be either dynamic or static. Dynamic IPs change periodically, often each time a device reconnects to the internet, while static IPs remain constant. Static IPs are typically used for servers, remote access, or services that require consistent connectivity.

***Private IP Address:*** Think of this like an internal extension number in a big office building. It's used for communucation within a specific network, like my home Wi-Fi network or an office network. Devices within the same network can talk to each other using their private IP addresses, but these addresses aren't visible to the outside world.

- Private IP addresses are typically assigned by a router or a DHCP (Dynamic Host Configuration Protocol) server within the network.

- Devices within the same private network communicate with each other using their private IP addresses.

- These addresses are not routable over the internet. They are used for internal network communication only and are hidden from the outside world.

- It is not globally unique and can be reused within different private networks without conflict.

IPv4 Address:

- IPv4 (Internet Protocol version 4) addresses are the most common type of IP addresses used today.

- They are 32-bit numeric addresses written in decimal format, separated by periods (e.g., 192.168.0.1).

- IPv4 addresses are divided into five classes: A, B, C, D and E, with classes A, B, and C being used for addressing hosts on networks.

- Each octet in an IPv4 address can have a value between 0 and 255. This is because each octet is made up of eight bits, and the maximiun value that can be represented with eight bits is 255 (which is 11111111 in binary).

# IPv6 Address:

- IPv6 (Internet Protocol version 6) addresses are designed to replace IPv4 due to the exhaustion of available IPv4 addresses.

- IPv6 addresses are 128-bit hexadecimal addresses, represented in eight groups of four hexadecimal addresses, represented in eight groups of four hexadecimal digits separated by colons (e,g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334).

- IPv6 addresses provide a much larger address space compared to IPv4, allowing for a virtually unlimited number of unique addresses.

# What is CIDR?

- CIDR, or Classless Inter-Domain Routing, makes it easier to talk about groups of IP addresses on the internet. Instead of naming each address one by one, CIDR uses a simple shortcut. It's like saying "All the houses on Main Street" instead of listing each house separately.

- For example, let's say I have the IP address 192.168.1.0. With CIDR notation, I might write it like this: 192.168.1.0/24. The "/24" part tells us that we're talking about all the houses on that street from 192.168.1.0 to 192.168.1.255.

so, CIDR helps us manage and organize IP addresses on the internet in a way that's easy to understand and work with. It's like having a shorthand for talking about big groups of addresses.

- Determining the number of available IP addresses in a CIDR block to determine the number of available IP addresses in a CIDR block, I will calculate it using the formula:

`2^(32 - CIDR notation) - 2`

The "-2" is for excluding the network address and the broadcast address.

**Example -**

Let's say we have a CIDR block of "192.168.1.0/24" Using the formula, I calculate:

`2^(32 - 24) - 2

=2^8 - 2

=256−2

=254`

# What is gateway?

Gateways are like doorways between different networks. They help data travel between the local network and other networks, like the internet. Just like a gate that  will lets me go from my backyard to the neighborhood park, a gateway that will let my data go from my computer to the internet and back again. It's like the traffic cop of the internet, directing my data where it needs to go.

- For example - Imagine I live in a city with different neighborhoods, each with its own set of houses. I am in one neighborhood, let's call it Neighborhood A, and I want to visit a friend who lives in a different neighborhood, Neighborhood B. To get from my neighborhood to my friend's neighborhood, I need to go through a gateway-a special gate that connects the two neighborhoods. This gateway act as a bridge between the two areas, allowing people and things to pass back and forth.

- So, when I leave my house in  Neighborhood A, I will walk to the gateway, pass through it, and then find my friend's house in neighborhood B. The gateway helps me navigate from one neighborhood to another, just like how a network gateway helps data travel between different networks.


# What is a Route table?

A route table is like a map that helps data find its way around a network. Just like a map shows the best route to get from one place to another, a route table tells devices on a network how to send data packets to their destinations.

- In simple terms, a route table lists different destinations and the paths ( or "routes") to reach them. When a devices receives data that it needs to send somewhere, it consults the route table to figure out where to send it.

- For example, if my computer wants to send data to a website, it looks at it's route table to find out which gateway to use to reach the internet. The route table might say, "To reach the internet, send data to the router." Then, the router knows how to forward the data to the next stop on its journey, eventually reaching its destination.

- Think of a route tables as the navigation system from data on a network, helping it find the fastest and most efficient paths to where it needs to go.

### Connection between Gateway and Route table.

Gateways:

- Gateways are devices (like routers of firewalls) that serve as entry and exit points between different networks

- They connect networks with different IP address ranges, such as my local network and the internet.

- Gateways recieve incoming data packets and determine where the send them next based on routing information.

Route Tables:

- Route tables are tables maintained by networking devices (like routers or switches) that contain information about how to route data packets to their destinations.

- Each entry in a toute table specifies a destination network and the next hop (gateway) to each that network.

- Devices consult the route table to determine the best path for forwarding data packets based on their destination IP addresses.


# Connection: 

- When a device (like computer or server) wants to send data to a destination outside of it's local network, it checks it's route table.

- The route table provides the information needed to determine the next hop (gateway) for reaching the destination network.

- The device then forwards the data packet to the specified gateway, which continues the process until the packet reaches its final destination.

In summary, gateways and route tables works together to facilitate the routing of network traffic between different networks. Gateways serve as the entry and exit points between networks, while route tables provide the necessary routing informating to determine how data packets should be forwarded to their destinations.

Now let's come to the practical part,

# Steps -

1. Setting up a Virtual Private Cloud (VPC)

2. Configuring Subnets within the VPC

3. Creating Internet Gateway and attaching it to VPC

4. Enabling Internet Connectivity with the Internet Gateway by setting up Routing tables.

5. EnablinG Outbound Internet Access through NAT Gateway

6. Estimating VPC peering Connections

# Part-1

1. Navigate to the search bar

a) Enter "VPC" Upon locating the relevant result, proceed to click on it, directing me to the Virtual Private Cloud (VPC) page.

![The image shows the virtual private cloud](image/images/vpc-page.png)

2. Please navigate to the "Create VPC" option and click on it.

![The image shows the create VPC](image/images/create-vpc.png)

3. Please select the "VPC only" option, specify the IPv4 CIDR block, and proceed by clicking on the "Create VPC" button.

![The image shows the VPC only](image/images/vpc-only.png)

**Note-** If you encounter an error message stating that the CIDR block size must be between "/16" and "/28" when creating a VPC, it indicates that your provided CIDR block falls outside of this recommended range. Adjusting the CIDR block to fall within the specified range should resolve the issue.

This is the VPC I have created.

![The image shows the VPC created](image/images/vpc-created3c.png)

I am done with part 1 now, Let's move to part2 which is Configuring Subnets within the VPC,

**Part-2**

1. Navigate to the "Subnets" option lacated on the left sidebar.

a) Upon clicking, I will be directed to the "Subnets" page.

b) From there,proceed to click on the "Create subnet" button.

![The image shows the creation of subnets](image/images/subnets.png)

2. Please, select the ID of the VPC that I have created in the previous step (part1)

![The image shows the creation of vpc ip previous](image/images/vpc-ip-previous.png)

3. Now enter the subnet name, and specify the IPV4 CIDR for the subnet.

a) Choose the availability zone

b) And specify the IPV4 for the subnet.

c) To create another subnet, click on the "Add subnet" button

![The image shows the IPV4 CIDR subnet ](image/images/subnet-name.png)

d) Repeat the same steps for the secound subnet

e) ensuring to specify the subnet name, choose the availability zone, and provide the IPV4 CIDR.

f) Once completed, click on the "Create" button to create the subnet.

To maintain consistency with our intention of creating both a public and a private subnet, ensure that the naming convention reflects this distincton appropriately.

![The image shows the IPV4 CIDR subnet ](image/images/subnet-name2.png)


![The image shows the AWS VPC Internet diagram](image/images/aws-vpc-internet.png)

Here, the subnets is being created.

![The image shows the public private subnet created](image/images/public-private-subnet-created.png)

- With the creation of subnets, the second part of the task is now completed. Let's proceed to the next part, which involves creating on Internet Gateway and attaching it to VPC.

# Part-3

1. Navigate to the "Internet Gateway"option on the left sidebar.

a) Upon clicking, then, you will be directed to the Internet Gateway Page.

b) From there, proceed to click on the "Create Internet Gateway" button.

![The image shows the creation of internet gateway](image/images/internet-geteways.png)

2. Specify the name of the Internet Gateway

a) proceed by clicking on the "Create Internet Gateway" button.

![The image shows the "create internet gateway"](image/images/create-internet-gateway.png)

Now, the Internet gateway is been created successfully.


![The image shows the "create internet gateway"](image/images/internet-gateway-created-successfully.png)


Now, you will notice that it is currently detached, indicating that it is not associated with any VPC. To enable internet connectivity, I have to attach the internet Gateway to the VPC I have previously created.


![The image shows the create internet gateway currently detached](image/images/internet-gateway-detached.png)


![The image shows the create internet gateway currently detached](image/images/internet-gateway-detached-vpc.png)

- Now, attach it to the VPC


![The image shows the create attach vpc](image/images/attach-internet-gateway-igw.png)


![The image shows the internet gateway attached](image/images/vpc-gateway-attached.png)


![The image shows the internet gateway diagram structure](image/images/aws-vpc-internate-gateway.png)


- Now, let's come to the next part which is Enabling Internet Connectivity with the Internet Gateway by setting up Routing tables.

# Part -4

1. Proceed to the "Route Tables" option located on the left sidebar.

a) Once there, click on the "Create route table" button

![The image shows the "create route table"](image/images/create-route-table.png)

2. Enter the name of the route table and select the VPC you previously created.

a) Finally, click on the "Create route table" button to proceed.

![The image shows the "create route table"](image/images/create-route-table2.png)


b) Next, click on Subnet associations, "followed by "Edit subnet associations" to associate the subnet with the route table, I will associate the public subnet with this route table. 

![The image shows the "subnets association"](image/images/edit-subnet-association2.png)


3. Choose the public subnet and click on save association.

![The image shows the public subnet association](image/images/edit-subnet-association.png)


4. Navigate to "Routes and then click on "Edit routes".

![The image shows the edit-routes](image/images/edit-route-final1.png)


5. Click on add route.

![The image shows the add routes](image/images/add-routes.png)


6. Select "Destination" as "0.0.0.0/0," indicating that every IPV4 address can access this subnet.

7. In the "Target" field, choose "Internet Gateway", and then select the Internet Gateway I have created. Finally, save the changes


![The image shows the edit routes](image/images/edit-route2.png)


The route table has now been configured to route traffic to the Internet Gateway,allowing connectivity to the Internet. Sice only the subnet named "my-public-subnet-1" is associated with the route table, only resources within that subnet can access the internet.

![The image shows the route table configured](image/images/routes-destination.png)



![The image shows the aws vpc internet gateway diagram](image/images/routes-destination.png)


- Now, let's come to the next part which is Enabling Outbound Internet Access through NAT Gateway,(bt attaching NAT Gateway to the subnet and attaching the route table).

# Part-5

1. Navigate to the "NAT Gateways" section, then click on "Create NAT Gateway"


![The image shows the "create NAT Gateway"](image/images/NAT-gateway.png)

2. mention the name of the NAT Gateway.

![The image shows the "create NAT Gateway"](image/images/NAT-gateway.png)

3. Now, choose the private subnet

![The image shows the NAT Gateway private subnet](image/images/NAT-gateway-private-subnet.png)

4. Now select the connectivity type as private.

![The image shows the  NAT Gateway private subnet connectivity"](image/images/nat-gateway-settings.png)


5. Then click on Create NAT Gateway.


![The image shows the "create  NAT Gateway"](image/images/nat-gateway-settings1.png)


Your NAT Gateway is being created successfully.

![The image shows the creation of  NAT Gateway successfully"](image/images/nat-gateway-successfully-created.png)

6. select the NAT Gateway.

7. Then navigate to the "Details" tab.

8. From there, locate the subnet ID and click on it.

![The image shows the NAT Gateway subnet ID](image/images/nat-gateway-subnet-id.png)

9. In the subnet page, navigate to the "Route Table" section.

10. Then, click on the "route table ID" -In our case - 1"rtb-************

![The image shows the route table ID](image/images/route-table-id-private-subnet.png)
