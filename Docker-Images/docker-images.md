# Docker Images

### Working with Docker Images

### Introduction to Docker Images

Docker images are the building blocks of containers. They are lightweight, portable, and self-sufficient packages that contain everything needed to run a software application, including the code, runtime, libraries, and system tools. Images are created from a set of instructions known as a Dockerfile, which specifies the environment and configuration for the application.

### Pulling Images for Docker Hub

[Docker Hub](https://hub.docker.com/) is a cloud-based registry that hosts a vast collection of Docker images. I can pull images from Docker Hub to my local machine using the `docker pull` command.

To explore available images on Docker Hub, the docker command provides a search subcommand. For instance, to find the Ubuntu image, you can execute:

```
docker search ubuntu
```

This command allows me to discover and explore various images hosted on Docker Hub by providing relevant search results. In this case, the output will be similar to this:

![The Image shows the docker search ubuntu](image/images/sudo-docker-search-ubuntu.png)

In the "OFFICIAL" column, the "OK" designation signifies that an image has been constructed and is officially supported by the organization responsible for the project. Once you have Identified the desired image, you can retrieve it to your local machine using the "pull" subcommand.

To download the official Ubuntu image to my computer, I have to use the following command:

```
docker pull ubuntu
```
Executing this command will fetch the official Ubuntu image from Docker Hub and store it locally on my machine, making it ready for use in creating containers.

![The Image shows the docker pull ubuntu](image/images/sudo-docker-pull-ubuntu.png)

Once an image has been successfully downloaded, you can proceed to run a container using that downloaded image by employing the "run" subcommand. Similar to the hello-world example, if an image is not present locally when the `docker run` subcommand is invoked, Docker will automatically download the required image before initiating the container.

To view the list of images that have been downloaded and are available on your local machine, enter the following command:

```
docker images
```
Executing this command provides a comprehensive list of all the images stored locally, allowing you to verify the presence of the downloaded image and gather information about its size, version, and other relevant details.

![The Image shows the docker pull ubuntu](image/images/sudo-docker-images.png)

As we move in this course, I will get to know the images to work with containers.

### Dockerfile

A Dockerfile is a plaintext configuration file that contains a set of instructions for building a Docker image. It serves as a blueprint for creating a reproducible and consistent environment for my application. Dockerfile are fundamental to the containerization process, allowing me to define the steps to assemble an image that encapsulates my application and its dependencies.

### Creating a Dockerfile.

In this dockerfile file, we will be using an nginx image. `Nginx` is an open source software for web serving, reverse proxying, caching, load balancing media streaming, and more. It started out as a web server designed for maximum performance and stability. It is recommended to study more on [Nginx here](https://www.f5.com/glossary).

To create a Dockerfile, use a text editor of your choice, such as vim or nano. Start by specifying a base image, defining the working directory, copying files, installing dependencies, and configuring the runtime environment.

Here's a simple example of a Dockerfile for a html file: Let's create an image with using a dockerfile. Paste the code snippet below in a file named `dockerfile` This example assumes you have a basic HTML file named `index.html` in the same directory as my Dockerfile.


![The Image shows the Dockerfile](image/images/mkdir-docker-file.png)

![The Image shows the index.html file](image/images/index-htmlfile1.png)

![The Image shows the index.html file](image/images/index-htmlfile2.png)

![The Image shows the dockerfile](image/images/sudo-nano-dockerfile1.png)

![The Image shows the dockerfile](image/images/sudo-nano-dockerfile2.png)


```
# Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR  /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# No need for CMD as NGINX image comes with a default CMD to start the server
```

Explanation of the code snippet above.

1. **FROM nginx:latest:** Specifies the official NGINX base image from Docker Hub.

2. WORKDIR /usr/share/nginx/html/:Specifies the 
working directory in the container.

3. Copy index.html /usr/share/nginx/html/: Copies the local `index.html` file to the NGINX default public directory, which is where NGINX serves static content from.

4. EXPOSE 80: Informs Docker that the NGINX server will use port 80. This is a documentation feature and doesn't actually publish the port.

5. CMD: NGINX images come with a default CMD to start the server, so there's no need to specify it explicitly.

HTML file named `index.html`in the same directory as your dockerfile.

![The Image shows the HTML file named index.html in the same directory](image/images/dockerfile&index-html-directory.png)

```
echo "Welcome to Darey.io" >> index.html
```
![The Image shows the index.html](image/images/echo-index-html.png)

To build an image from this Dockerfile, navigate to the directory containing the file and run:

```
docker build -t dockerfile .
```

![The Image shows the docker build -t dockerfile](image/images/sudo-docker-build-dockerfile.png)

![The Image shows the docker images](image/images/docker-images.png)

To run a container based on the custom NGINX image we created with a dockerfile, run the command.

```
docker run -p 8080:80 dockerfile
```

![The Image shows the docker file](image/images/sudo-run-dockerfile.png)

Running the command above will create a container that listens on port 8080 using the nginx image I have created earlier.So I need to create a new rule in security group of EC2 instance.

Let's recall the hands-on project I did in the advanced Techops curriculum. Now let's add new rules to the security group

i. On the EC2 instance, click on the security tab

![The Image shows the EC2 Instance security](image/images/ec2-instance-security-tab.png)


ii. Click on edit inbound rules to add new rules. This will allow incoming traffic to instance associated with the security group. Our aim is to allow incoming traffic on port 8080

![The Image shows the EC2 Instance security](image/images/inbound-rule-security-group.png)


iii. Click on `Add rule`to add a new rule.

![The Image shows the add rule on security group](image/images/security-group-add-rule.png)

Let see the list of available containers.

```
docker ps -a
```

![The Image shows the list of available containers](image/images/docker-ps-a.png)

The image above show our container is not running yet. I can start it with the command below

```
docker start CONTAINER_ID
```

 ![The Image shows the start of container](image/images/docker-start-container_id1.png)

 ![The Image shows the start of container](image/images/docker-ps-a1.png)


Now that I have started my container, I will access the content on our web browser with

http://publicip_address:8080


![The Image shows the start of container via web browser](image/images/start-container-web-browser.png)


**Pushing Docker Images To Docker Hub**

Let's recall my git project, where I push changes made on my local computer to a remote repository (github) so everyone can track the changes I made and also collaborate on it. Now that I have created a docker images on my computer, I need to think about how to reuse this image in the future or how do people in other region make use of this image and possibly collaborate on it. This is where [Docker Hub](https://hub.docker.com/) comes in. Let's go ahead and push my image to docker hub

i. Create an account on [Docker Hub](https://hub.docker.com/) incase none is created.

ii. Create a repository on docker hub

![The Image shows the created repository on a docker hub](image/images/my-docker-account1.png)


![The Image shows the created repository on a docker hub](image/images/my-docker-account2.png)


iii. Tag Your Docker Image Before Pushing, ensure that my Docker image is appropriately tagged. I typically tag my Image with my Docker Hub username and the repository name. 

```
docker tag <your-image-name> <your-dockerhub-username>/<your-repository-name>:<tag>
```

![The Image shows the docker tag](image/images/docker-tag.png)


iv. Login to Docker hub.

```
docker login -u <your-docker-hub-username>
```

Running the command above will prompt you for a password. Authenticate using your docker hub password.

![The Image shows the docker login via CLI](image/images/docker-login.png)

v. Push my image to docker hub

```
docker push <your-dockerhub-username>/<your-repository-name>:<tag>
```

![The Image shows the docker push](image/images/docker-push.png)


vi. Verify the image is in my docker hub repository

![The Image shows the docker hub repository tag](image/images/docker-hub-repository-tag.png)

Now anyone can make use of the image I have on my docker rub repository

**Side Hustle Task: Dockerize a Basic Web Static Page**

1. Launch an instance and create a Dockerfile:

- Launch an ubuntu EC2 instance and connect to it.
- Create a dockerfile, in the file;
- Use the official nginx images as the base.
- Copy the web static page file (e.g. a html file) to the appropriate location within the container.
- Expose the port my web application runs (e.g.,80)

2. **Build the Docker Image**
   - Navigate to the directory containing my Dockerfile if not there.
   - Build the image using the dockerfile

3. **Run the Docker Container:**
   - Once the image is build, run a container  using the build image.

4. **Verify in Browser:**
   - Open a web browser and navigate to `http://public-ip:8080` (or the port I specified in the `docker run` command). 
   
   - Confirm that my web application is running successfully.

### Tips:

   - Ensure my web static page is accessible on the specified port within the container.

   - Use clear and concise names for my Docker image and container.

   - Provide comments in my Dockerfile to explain each step for better understanding.