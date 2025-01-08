# Containerization and Container Orchestration

### Phase 1: Base Frontend Application with Docker and Kubernetes

1. Hypothetical Use Case

You are developing a simple static website (HTML and CSS) for a company's landing page.The goal is to containerize this application using Docker, deploy it to a Kubernetes cluster, and access it through Nginx.


2. Tasks

Task 1: Set up your project

- Create a new project directory.

- Inside the directory, create an HTML file (`index.html`) and a CSS file (`styles.css`).

## The Steps to follow

## 1. Create a new project directory:

```
mkdir my-project
```
![The Image shows the creation of project directory](image/images/my-project-directory.png)

2. I have to move into the directory:

```
cd my-project
```
![The Image shows to move into the project directory](image/images/cd-my-project.png)


## 2. Create the HTML File (index.html)

**Using a Code Editor (e.g., Vs Code, nano, vim etc).**

- Open the code editor

- In the "My-Project Directory" I have to create a new file named `index.html`.

- Add a basic HTML structure inside the file. Here's an example:

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Project</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Welcome to My Project</h1>
    <p>This is a simple HTML project.</p>
</body>
</html>
```

![The Image shows the creation of index.html file](image/images/index.html.png)


![The Image shows the creation of index.html file](image/images/index.html1.png)

- Save the file.

## 3. Create the CSS File (styles.css)

 **Using a Code Editor:**

 1. In the `my-project` folder, I have to create a new file named `styles.css`.

 2. Add some basic CSS styles: 

```
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

h1 {
    color: #333;
    text-align: center;
    margin-top: 50px;
}

p {
    text-align: center;
    color: #666;
}
```

![The Image shows the creation of styles.css styles](image/images/styles-css.png)


![The Image shows the creation of styles.css styles](image/images/styles-css1.png)


# Task 2: Initialize Git

- Initialize a Git repository in my project directory.


# Task 3: Git Commit

- Add and commit my initial code to the Git repository.


# Task 4: Dockerize the application

- Create a `Dockerfile` specifying Nginx as the base image.

```
# Use Nginx as the base image
FROM nginx:alpine

# Copy your HTML and CSS files into the default Nginx HTML directory
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/

# Expose port 80 (default Nginx HTTP port)
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
```

![The Image shows the creation of Dockerfile](image/images/dockerfile.png)

- Copy your HTML and CSS files into the Nginx HTML directory. (Use ChatGPT to generate a basic HTML and CSS code for a simple web application)

![The Image shows the creation of Dockerfile, index.html file, css file](image/images/ls-directory.png)


# Task 5: Push to Docker Hub

- Log in to Docker Hub.

To push my Docker image to "Docker Hub" follow these steps:

Step 1: Create a Docker Hub Account 

1. Go to [Docker Hub](https://hub.docker.com/)

![The Image shows the creation of Docker-hub account](image/images/docker-hub-account.png)

- Push my Docker image to Docker Hub.