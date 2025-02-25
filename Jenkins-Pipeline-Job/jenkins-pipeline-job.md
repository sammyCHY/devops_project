## What is a Jenkins Pipeline Job

A Jenkins pipeline job is a way to define and automate a series of steps in the software delivery process. It allows you to script and organize your entire build, test, and deployment. Jenkins pipelines enable organizations to define, visualize, and execute intricate build, test, and deployment processes as code. This facilitates the seamless integration of continuous integration and continuous delivery (CI/CD) practices into software development.

Let's recall our docker foundations project when we created a dockerfile and made a docker image and container with it. Now let's automate the same process with jenkins pipeline code.


# Creating a Pipeline Job

Let's create our first pipeline job

i. From the dashboard menu on the left side, click on new item.

![The Image shows the jenkins dashboard menu](image/images/dashboard-menu-jenkins.png)

ii. Create a pipeline job and name it "My pipeline job"

![The Image shows the creation of "My pipeline job"](image/images/my-pipeline-job.png)


# Configuring Build Trigger

Like we did previously in the earlier project, create a build trigger for jenkins to trigger new build

i. Click "Configure" your job and add this configurations

ii. Click on build trigger to configure triggering the job from Github webhook
 

![The Image shows the configuring build trigger](image/images/configure-buildtrigger.png)


iii. Since we have created a github webhook previously, I do not need to create another one again.

Now let's work on our pipeline script

## Writing Jenkins Pipeline Script

A jenkins pipeline script refers to a script that defines and orchestrate the steps and stages of a continuous integration and continuous delivery (CI/CD) pipeline. Jenkins pipelines can be defined using either declarative or scripted syntax. Declarative syntax is a more structured and concise way to define pipelines.It uses a domain-specific language to describe the pipeline stages, steps, and other configurations while scripted syntax provides more flexibility and is suitable for complex scripting requirements.

Let's write our pipeline script

```
pipeline {
    agent any

    stages {
        stage('Connect To Github') {
            steps {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sammyCHY/jenkins-scm.git']])
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t dockerfile .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -itd -p 8081:80 dockerfile'
                }
            }
        }
    }
}
```

**Explanation of the script above**


The provided Jenkins pipeline script defines a series of stages for a continuous integration and continuous delivery (CI/CD) process. Let's break down each stage:

- **Agent Configuration:**

```
agent any
```

Specifies that the pipeline can run on any available agent (an agent can either be a jenkins master or node). This means the pipeline is not tied to a specific node type.

- **Stages:**

```
stages {
   // Stages go here
}
```

Defines the various stages of the pipeline, each representing a phase in the software delivery process.

- **Stage 1: Connect To Github:**

```
stage('Connect To Github') {
   steps {
      checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sammyCHY/jenkins-scm.git']])
   }
}
```

- This stage checks out the source code from a GitHub repository (`https://github.com/sammyCHY/jenkins-scm.git).

- It specifies that the pipeline should use the `main` branch.

- Stage 2: Build Docker Image:

```
stage('Build Docker Image') {
   steps {
      script {
         sh 'docker build -t dockerfile .'
      }
   }
}
```

- This stage builds a Docker image named 'dockerfile' using the source code obtained from the GitHub repository.

- The `docker build` command is executed using the shell (`sh`).

- Stage 3: Run Docker Container:

```
stage('Run Docker Container') {
   steps {
      script {
         sh 'docker run -itd --name nginx -p 8081:80 dockerfile'
      }
   }
}
```

- This stage runs a Docker container named 'nginx' in detached mode (`-itd`).

- The container is mapped to port 8081 on the host machine (`-p 8081:80`).

- The Docker image used is the one built in the previous stage ('dockerfile').


***Copy the Pipeline script and paste it in the section below***

Pipeline

Definition

Pipeline script

![The Image shows the jenkins pipeline script](image/images/jenkins-pipeline-script.png)

The stage 1 of the script connects jenkins to github repository. To generate syntax for my github repository, follow the steps below.


i. Click on the pipeline syntax

![The Image shows the pipeline syntax](image/images/pipeline-syntax.png)


ii. Select the drop down to search for **`checkout: Check out from version control`**


### Overview

This **Snippet Generator** will help you learn the pipeline script code which can be used to define various steps. Pick a step you are interested in from the list, configure it, click **Generate Pipeline Script** and you will see a pipeline script statement that would call the step with that configuration. You may copy and paste the whole statement that would call the step with that configuration. You may copy and paste the whole statement into my script, or pick up just the options you care about. (Most parameters are optional and can be omitted in my script, leaving them at default values.)


Steps

Sample Step

![The Image shows the version control](image/images/version-control.png)


iii. Paste your repository url and make sure your branch is "main"


![The Image shows the url repository main](image/images/url-repository-main.png)


iv. Generate your pipeline script.


![The Image shows the generation](image/images/generate-pipeline-script.png)


Now you can replace the generated script for connect jenkins with github.


### Installing Docker


Before jenkins can run docker commands, we need to install docker on the same instance jenkins was installed. From our shell scripting knowledge, let's install docker with shell script.

i. Create a file named docker.sh

![The Image shows the creation of dockerfile](image/images/creation-dockerfile.png)

ii. Open the file and paste the script below


```
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl status docker
```

iii. Save and close the file.


iv. Make the file executable

```
chmod u+x docker.sh
```
![The Image shows the docker executable file](image/images/docker.sh-executable-file.png)

*************
v. Execute the file

```
./docker.sh
```

![The Image shows the docker file been executed](image/images/executable-dockerfile1.png)

![The Image shows the docker file been executed](image/images/executable-dockerfile2.png)

![The Image shows the docker file been executed](image/images/executable-dockerfile3.png)

![The Image shows the docker file been executed](image/images/executable-dockerfile4.png)

![The Image shows the docker file been executed](image/images/executable-dockerfile5.png)

![The Image shows the docker file been executed](image/images/executable-dockerfile6.png)



I have successfully installed docker.

Now that I have docker installed on the same instance with Jenkins, I need to create a dockerfile before I can run my pipeline script. As I know. I cannot build a docker image without a dockerfile. Let's recall the dockerfile. I used to build a docker image in my docker foundations. In the main branch on `jenkins-scm`,


i. Create a new file named `dockerfile`

![The Image shows the docker file created](image/images/dockerfile-created.png)


ii. Paste the code snippet below in the file


```
# Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR  /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80
```

iii. Create an `index.html`file and paste the content below

```
Congratulations, You have successfully run your first pipeline code.
```

![The Image shows the index.html file](image/images/index-htmlfile.png)


Pushing these files `dockerfile` and `index.html` will trigger jenkins to automatically run new build for my pipeline

![The Image shows the dockerfile and html file](image/images/dockerfile&htmlfile.png)


To access the content of `index.html` on my web browser, I need to first edit inbound rules and open the port that is mapped the container to (8081)


![The Image shows the editing of the security inbound rule to port 8081](image/images/inbound-rule.png)

I can now access the content of index.html on my web browser

```
http://jenkins-ip-address:8081
```

![The Image shows the jenkins server IP displays index.html page on a web browser](image/images/jenkins-index-html-web-browser.png)

 