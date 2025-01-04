# Setting Up MiniKube

## Container Orchestration With Kubernetes

Imagine orchestrating a vibrant culinary event with various chefs preparing different dishes. Container orchestration, seamlessly coordinates each chef (container) to ensure the perfect serving, timing, and overall dining experience. Just as a skilled event planner brings order to chaos, Kubernetes, a notable orchestrator, orchestrates containers, making it the go-to choice for managing the intricate dance of modern applications. Container orchestration is a critical aspect of managing and scaling containerized applications efficiently. It involves automating the deployment, scaling, and operation of containerized applications, ensuring seamless coordination among multiple containers to deliver high availability and optimal performance. One widely used container orchestration tool is Kubernetes. Developed by Google, Kubernetes has become the de facto standard for automating the deployment, scaling, and management of containerized applications

## What is Kubernetes?

Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. Developed by Google and later open-sourced. Kubernetes is widely adopted for its ability to streamline and automate the deployment, scaling, and management of containerized applications is a highly efficient and consistent manner. It provides a centralized platform that abstracts away the complexities of distributed systems. offering features such as automated load balancing, self-healing capabilities, and seamless rolling updates.

![The Image shows the componentes of a Kubernetes Cluster](image/images/kubernetes-cluster.png)


- **Control Plane or Master Node:** The Control Plane, often referred to as the master node, is the brain of a Kubernetes cluster. It manages the entire cluster, making high-level decisions about the state of the system. Components like the API Server, Scheduler, Controller Manager, and etcd (key-value store for cluster data) constitute the Control Plane.

- **Nodes:** Nodes are individual machines within a Kubernetes cluster responsible for running containerized applications. Each node is equipped with a container runtime (e.g., Docker) a Kubelet (communicates with the master and manages containers on the node), and a kube-proxy (maintains network rules). Nodes execute and manage containers, distribute workloads, and communicate with the control plane to maintain the desired state of the system. The collaborations of multiple nodes creates a scalable and resilient environment, forming the foundation for deploying and orchestrating containerized applications in Kubernetes.

- **Pods:** Pods are the fundamental deployment units in Kubernetes, representing one or more closely related containers that share the same network namespace, storage, and set of specifications. Containers within a Pod work together and are scheduled to run on the same node. Pods encapsulate the basic building blocks for deploying and scaling applications, fostering tight communication between co-located containers.

- **Containers:** Containers in Kubernetes encapsulate and package applications, along with their dependencies and runtime environment, ensuring consistency across various computing environments. Leveraging containerization technology, such as Docker, containers provide a lightweight, portable, and efficient way to deploy and run applications. In Kubernetes, containers are organized into Pods, The smallest deployable units.

![The Image shows the Kubernetes Master Node](image/images/kubernetes-master-node.png)


- API Server: The API Server is the control plane component in Kubernetes that serves as the front end for the Kubernetes control plane. It exposes the Kubernetes API, allowing users, other components, and external entities to interact with the cluster, managing resources, and initiating various actions.

- **Controller Manager:** The Controller Manager is a control plane component in Kubernetes responsible for maintaining the desired state of the cluster. It includes various controllers that watch the state of the cluster through the API Server and take corrective actions to ensure that the actual state aligns with the desired state.

- **Scheduler:** The scheduler is a control plane component in Kubernetes that assigns workloads to nodes in the cluster based on resource requirements, constraints, and availability. It plays a crucial role in distributing workloads evenly and efficiently across the worker nodes, optimizing resource utilization.

- **etcd:**etcd is a distributed key-value store that acts as the cluster's single source of truth for all persistent cluster data. In Kubernetes, etcd is used to store configuration details, state information, and metadata, providing a reliable and consistent data store that ensures the integrity of the cluster's information.

- **Kubelet:** The Kubelet is a vital component in Kubernetes running on each node in the cluster. It communicates with the Kubernetes control plane, specifically the API Server, to ensure that containers are running in a Pod as expected. Kubelet plays a key role in managing the containers on a node, handling tasks such as starting, stopping, and monitoring container processes based on the specifications recieves from the control plane.

- **Kube Proxy:** Kube Proxy, or Kubernetes Proxy, is responsible for maintaining network rules on nodes. It enables communication between Pods and external entities, handling network routing and ensuring that the correct network policies are applied.

## Project Prerequisities

- Completion of foundations core program 1 & 2 Projects
- 2 CPUs or more.
- 2GB of free memory
- 20GB of free disk space

Project Goals

By the end of this project, learners should have:

- Gained a comprehensive understanding of Kubernetes and its fundamental concepts.
- Mastered the usage of Minikube for local Kubernetes cluster deployment and experimentation.
- Acquired hands-on experience with Docker, understanding containerization principles and how to create, manage, and distribute containerized applications.
- Built and deployed applications on minikube.

### Minikube

Now that I have an Idea of what Kubernetes is, let's set up a minikube. But what is minikube?

Minikube is an open-source tool that enables us to run Kubernetes clusters locally our machines. As we now know that kubernetes is a container orchestration platform that automates the deployment, scaling and management of containerized applications. Minikube streamlines the creation of a local Kubernetes environment, providing a user-friendly playground where we can safely build and test their applications before deploying them to a production setting.

Let's get started with setting up Minikube.

## Getting Started With Minikube

Installing Minikube on Windows

To install minikube on windows, we need to use [chocolatey](https://chocolatey.org/). Chocolatey, just like `apt` and `yum` is a windows package manager for installing, updating and removing software packages on windows.

i. Go to the windows search bar and launch a terminal with administrative access

![The Video shows how to launch a terminal with administrative access](image/images/epicpen_Do1SUrpEld.gif)

If `choco` is not already installed, then follow the steps to install it:

1. Open **PowerShell** as an Administrator.

2. Run the following command to enable script execution:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

![The image shows the script that will recognise `choco`](image/images/install-choco1.png)


![The image shows the script that will recognise `choco`](image/images/install-choco2.png)

![The image shows the choko version](image/images/choco-version.png)

ii. Install Minikube

```
choco install minikube
```

![The image shows the installation of choko minikube](image/images/choco-install-minikube.png)

![The image shows the installation of choko minikube](image/images/choco-install-minikube1.png)

- **Note:** If I don't have [chocolatey](https://chocolatey.org/). install, follow the [official documentation](https://chocolatey.org/) to install it.

iii. Minikube needs docker as a driver and also to pull it's base image, therefore I need to install docker desktop for windows.

![The image shows the installation of docker desktop for window](image/images/docker-installed.png)

Go to [docker desktop](https://docs.docker.com/desktop/setup/install/windows-install/) official documentation to install it if not installed

iv. Run the command below to start minikube using docker as the driver.

```
minikube start --driver=docker
```

![The image shows the minikube start driver docker](image/images/minikube-start-driver-docker.png)

## Installing Minikube on Linux

For Linux users, let's install minikube

i. Launch a terminal with administrative access
ii. I need to install docker as a driver for minikube and also for minikube to pull base images for the kebernetes cluster.

```
sudo apt-get update
```
![The image shows the update of the installed app](image/images/sudo-apt-get-update.png)

This is a Linux command that refreshes the package list on a Debian-based system, ensuring the latest software information is available for installation.

```
sudo apt-get install ca-certificates curl gnupg
```

![The image shows the installation of essential packages](image/images/sudo-apt-get-install-ca-certificate.png)

This is a Linux command that installs essential packages including certificate authorities, a data transfer tool (curl), and the GNU Privacy Guard for secure communication and package verification.

```
sudo install -m 0755 -d /etc/apt/keyrings
```
![The image shows the creation of directory](image/images/sudo-install-keyrings.png)

The command above creates a directory (/etc/apt/keyrings) with specific permissions (0755) for storing keyring files, which are used for docker's authentication.

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

![The image shows the docker GPG key](image/images/download-docker-key.png)

This downloads the Docker GPG key using `curl`

```
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

![The image shows the permission user on the Docker](image/images/sudo-chmod-docker.png)

Set read permission for all users on the Docker GPG key file within the APT keyring directory.

### Let's add the repository to Apt sources

```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

![The image shows the apt sources of the repository](image/images/add-repository.png)

The "echo" command creates a Docker APT repository configuration entry for the Ubuntu system, incorporating the system architecture and Docker GPG key, and then "sudo tee /etc/apt/sources.list.d/docker.list> /dev/null" writes this configuration to the "/etc/apt/sources.list.d/docker.list" file.

```
sudo apt-get update
```
![The image shows the update of the installed packages](image/images/sudo-apt-get-update2.png)

- Install latest version of docker

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

![The image shows the latest version of docker](image/images/docker-latest-version.png)

![The image shows the update of the installed packages](image/images/docker-latest-version1.png)

- Verify that docker has been successfully installed.

```
sudo systemctl status docker
```
![The image shows the status of the installed docker](image/images/sudo-systemctl-status-docker.png)


iii. Install minikube

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
```

![The image shows the installation of minikube](image/images/install-minikube.png)

If there was an error during the time of running the command above, then, I have to reach out to the technical support.


```
sudo dpkg -i minikube_latest_amd64.deb
```

![The image shows the installation of minikube binary](image/images/minikube-binary.png)

- The command above downloads minikube's binary and install minikube using dpkg

![The image shows the downloads of minikubes binary and install minikube using dpkg](image/images/downloads-install- minikubes-binary-dpkg.png)

iv. Start minikube

```
minikube start --driver=docker 
```
![The image shows the start driver docker](image/images/minikube-start-driver-docker1.png)

v. Kubectl is the command-line interface (CLI) tool for interacting with and managing kubernetes clusters, allowing users to deploy, inspect, and manage applications within the Kubernetes environment. Let's install kubectl.

```
sudo snap install kubectl --classic
```

- This will download the kubernetes command line (kubectl) tool to interact with kubernetes cluster.

![The image shows the downloads of kubernetes CLI](image/images/sudo-snap-install-kubectl.png)


Installing Minikube on Mac

For mac users, let's install minikube

i. Launch a terminal with adminstrative access

ii. Install minikube

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
```

```
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
```
The command above downloads minikube's binary and install minikube.

iv. Just like windows and linux, I need docker desktop as a driver for minikube. To install docker desktop for mac go to [docker desktop](https://docs.docker.com/desktop/setup/install/mac-install/) official documentation to install it if not installed.

v. Run the command below to start minikube using virtualbox as the driver

```
minikube start --driver=docker
```

