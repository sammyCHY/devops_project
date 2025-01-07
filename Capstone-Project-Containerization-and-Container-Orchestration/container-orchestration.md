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



