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

![The Video shows how to launch a terminal with administrative access](image/images/epicpen_oAuhoRgvUg.gif)

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

