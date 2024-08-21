# Auomating Loadbalancer Configuration with Shell Scripting

This project is load balancer configuration with ease using scripting and simple CI/CD on jenkins. This project demonstrate how to automate the setup and maintenance of load balancer using a freestyle job, enhancing efficiency and reducing manual effort.

## Automate the Deployment of Webservers

In the Implementing load balancer with Nginx course, I deployed two backend servers, with a load balancer distributing traffic accross the webservers. I did that by typing commands right on the terminal.

In this course I will be automating the entire process. I will do that by writting a shell script that when ran, all that will did manually will be done automatically. As DevOps Engineers automation is at the heart of the work we do. Automation help us speed the deployment of services and reduce the chance of making errors in our day to day activity.

This course will give a great introduction to automation.


# Deploying and Configuring the Webservers

## Deploying and Configuring the Webservers.

- All the process I need to deploy the webservers has been codified in the shell script below:

`#!/bin/bash`

