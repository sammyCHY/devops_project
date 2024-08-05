
# Understanding Client-Server Architecture with MySQL:

### Client-Server Architecture:

is a network design framework where client devices request and receive services from a centralized server. In the context of MySQL, this architecture is fundamental to how the database operates, allowing multiple clients to interact with a MySQL server to store, retrieve, and manipulate data. Inorder words Client-Server refers to an architecture in which two or more computer are connected together over a network to send and receive requests between one another.In their communication, each machine has its own role: the machine sending request is usually referred as "Client" and the machine responding (Serving) is called "Server".


### Components of Client-Server Architecture with MySQL:

#### 1. Client:

- A client is any device or application that connects to the MySQL server to perform database operations. Clients can be command-line interfaces, GUI applications, web applications, or other servers.

- Examples: MySQL Workbench, phpMyAdmin, custom applications written in programming languages such as PHP, Python, Java, etc.

### 2. Server:

- The MySQL server is the central component that manages the database. It processes SQL queries sent by clients, performs the requested operations, and returns the results.

- The server handles data storage, security, transaction processing, and concurrent access by multiple clients.

## How It Works:

### 1. Client Connection:

- A client establishes a connection to the MySQL server over a network. This can be done using a MySQL client tool or through a programming language's MySQL driver.

### 2. Authentication:
- The MySQL server authenticates the client using credentials (username and password) and ensures the client has the necessary permissions to access the requested data.

### 3. Request Processing:
- The client sends SQL queries to the MySQL server. These queries can be for data retrieval (SELECT), data modification (INSERT, UPDATE, DELETE), or database structure changes (CREATE, ALTER, DROP).

### 4. Query Execution:
- The MySQL server parses, optimizes, and executes the SQL queries. It then accesses the database storage to perform the requested operations.

### 5. Response:
- The server sends the results of the query back to the client. This can include data rows, confirmation of a successful operation, or error messages.

### 6. Connection Termination:
Once the client has finished interacting with the database, it closes the connection to the MySQL server.


# Advantages of Client-Server Architecture with MySQL:

- Centralized Management:
The MySQL server centrally manages all the data, providing a single point of control for security, backup, and administration.

- Scalability:
Multiple clients can connect to the MySQL server simultaneously, supporting many users and applications.

- Security:
MySQL provides robust security features such as user authentication, access control, and encrypted connections.

- Resource Sharing:
Clients can share the server’s resources, allowing efficient use of hardware and data consistency across different applications.

### Example Scenario:
Consider a web application with the following components:

- Web Browser (Client):
The user interacts with the web application through a web browser.

- Web Server (Client):
The web server (e.g., Apache, Nginx) hosts the web application and acts as a client to the MySQL server.

The web application code (written in PHP, Python, etc.) sends SQL queries to the MySQL server to retrieve and store data.

- MySQL Server:
The MySQL server processes the queries, manages the database, and returns the results to the web server.

### Interaction Flow:

- User Request:
The user enters a URL in the web browser to request information (e.g., a list of products).

- Web Server Processing:
The web server receives the request and executes the web application code.

The web application generates a SQL query to fetch the product data from the MySQL server.

- Database Query:
The web server, acting as a MySQL client, sends the SQL query to the MySQL server.

- MySQL Server Response:
The MySQL server processes the query, retrieves the product data from the database, and sends the results back to the web server.

- Response to User:
The web server formats the data into HTML and sends it back to the user’s web browser.

- User View:
The user sees the list of products displayed in the web browser.

The command below:

`curl -Iv http://servername.com`

In this example above, a machine that is trying to access a web site using web browser or simply `curl` command is a client and it sends HTTO requests to a web server (Apache,Nginx,IIs or any other) over the internet.

If we extend this concept further and add a Database Server to our architecture, we can get some discription below.

Client---Internet---Web_server---local_network---data_base (DB-Server)

`$ curl -Iv www.google.com`

![The image shows the response from remote server](image/images/CURL_IV.png)


![The image shows the response from remote server](image/images/curl_iv2.png)



# Implement a Client Server Architecture using MySQL Database Management System (DBMS).

To demonstrate a basic client-server using MySQL RDBMS, the prompt below is the instruction.

### 1. Create and configure two Linux-Based virtual servers (EC2 instances in AWS).

- `server A name - MySQL Server`
- `Server B name - MySQL Client`

![The image shows the two virtual server](image/images/two-virtual-based-server.png)


By default both of the EC2 virtual servers are located in the same local virtual network, so they can communicate to each other using **local IP addresses**. I have to use `MySQL Server's` local IP address to connect from `MySQL Client`. *MySQL servers uses TCP port 3306 by default*, therefore, I have to open it by creating a new entry in **Inbound rules** in *MySQL server*  Security Groups. For extra security, I will not allow all IP addresses to reach *MySQL server* - allow access only to the specific local IP address of the *MySQL client*


![The image shows the addition of IP the Inbound rule](image/images/inbound_rule.png)


To configure MySQL server to allow connections from remote hosts.

run the command below.

`sudo vi /etc/mysql.conf.d/mysql.cnf`

**Replace** `127.0.0.1` to `0.0.0.0` like the image below

![The image shows the MySQL server configuration](image/images/sudo_vi_config.png)


`Show databases`

Image below shows the fully functionally Mysql Client-server set up.

![The image shows the functional mysql-client-server](image/images/show_database1.png)





