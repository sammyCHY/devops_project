# Jenkins Freestyle Project

### Jenkins Job

In Jenkins, a job is a unit of work or a task that can be executed by the jenkins automation server.

A Jenkins job represents a specific task or set a tasks that needs to be performed as part of a build or deployment process. Jobs in Jenkins are created to automate the execution of various steps such as compiling code, running tests, packaging applications, and deploying them to servers. Each Jenkins job is configured with a series of build steps, Post-build actions, and other settings that define how the job should be executed.

Creating a Freestyle Project

Let's create our first build job

i. From the dashboard menu on the left side, click on new item.

![The Image shows the jenkins console](image/images/jenkins-console.png)

ii. Create a freestyle project and name it "my-first-job"

![The Image shows the creation of a "freestyle project"](image/images/jenkins-dashboard1.png)



### Connecting Jenkins To Our Source Code Management.

**Now that I have created a freestyle project, let connect jenkins with github.**


i. Creating a new github repository called jenkins-scm with a README.md file



![The Image shows the connection of jenkin to jenkins-scm in the github source code management console](image/images/jenkins-to-jenkins-scm.png)


iii. Save configuration and run "build now" to connect jenkins to our repository

![The Image shows the connection of jenkins to repository](image/images/connect-jenkins-to-repository.png)

I have successfully connected jenkins with my github repository (jenkins-scm)


Configuring Build Trigger

AS an engineer, I need to be able to automate things and make our work easier in possible ways. I have connected `jenkins` to `jenkins-scm`, but I cannot run a new build with clicking on `Build Now`. To eliminate this, I need to configure a build trigger to our jenkins job. With this, jenkins will run a new build anytime a change is made to our github repository.


i. Click "Configure" my job and addd this configurations


ii. Click on build trigger to configure triggering the job from GitHub webhook.  


![The Image shows the configure jenkins build trigger](image/images/jenkins-configure-build-trigger.png)


iii. Create a github webhook using jenkins ip address and port


![The Image shows the configure webhook using jenkins ip address and port](image/images/jenkins-webhook.png)