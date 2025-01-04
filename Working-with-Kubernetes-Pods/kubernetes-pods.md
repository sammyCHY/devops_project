# Working with Kubernetes Pods

### Pods in Kubernetes

## Definition and Purpose:

A Pod in Kubernetes is like a small container for running parts of an application. It can have one or more containers inside it that work closely together. These containers share the same network and storage, which makes them communicate and cooperate easily. A pod is the smallest thing you can create and manage in Kubernetes . In Minikube, which is a tool to run Kubernetes easily, Pods are used to set up, change the size and control applications.

### Creating and Managing Pods:

Interaction with Pods in Mininkube involves using the powerful `kubectl` command-line tool. `kubectl` is the command-line interface (CLI) tool for interacting with Kubernetes clusters. It allows users to deploy and manage applications, inspect and manage cluster resources, and execute various commands
 against Kubernetes clusters.

 1. List Pods:

 ```
 kubectl get po -A
 ```

 This commands provides an overview of the current status of Pods within the Minikube cluster.

 
