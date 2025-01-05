# Working with Kubernetes Resources

### Introduction To YAML

A Kubernetes YAML file is a text file written in YAML syntax is a human-readable data serialization format that is commonly used for configuration files. In the context of kebernetes, these YAML file serve as a declarative way to specify the desired state of the resources such as pods, container, service and deployment I want to deploy and manage within a Kubernetes cluster.

Basic Structure Of YAML File

YAML uses identation to represent the hierarchy of data, and it uses whitespace (usually spaces, not tabs) for indentation.

```
key1: value1
key2:
  subkey1: subvalue1
  subkey2: subvalue2
key3:
  - item1
  - item2
```

Data Types 

**Scalars** Scalars are single values.

- Strings:

```
name: John Doe
```

- Numbers:

```
age: 25
```

- Booleans:

```
is_student: true
```

# Collections

- Lists (arrays):

```
fruits:
  - apple
  - banana
  - orange
```

- Maps (key-value pairs):

```
person:
  name: Alice
  age: 30
```

**Nested Structures** YAML allows nesting of structures:

```
employee:
  name: John Doe
  position: developer
  skills:
    - Python
    - JavaScript
```

**Comments:**

In YAML, comments starts with `#`:


```
# This is a comment
key: value
```
Multiline Strings

Multiline strings can be represented using the `|` or `>` characters:

```
description: |
  This is a multiline
  string in YAML.
```

Anchors and Aliases

You can use `&` to create an anchor and `*` to create an alias:


```
first: &name John
second: *name
```

In this example, `second` has the same value as `first`.
Now that I've got the basics, practice writing and reading YAML to become comfortable with its syntax. It's widely used in configuration file for various tools and systems.

## Deploying Applications in Kubernetes

In Kubernetes, deploying applications is a fundamental skill that every beginner needs to grasp. Deployment involves the process of taking the application code and running it on a Kubernetes cluster, ensuring that it scales, manages resources efficiently, and stays resilient. This hands-on project will guilde me through deploying my first application using Minikube, a lightweight, single-node Kubernetes cluster perfect for beginners.


## Deployments in Kubernetes:

In Kubernetes, a **Deployment** is a declarative approach to managing and scaling applications. It provides a blueprint for the desired state of my application, allowing Kubernetes to handle the complexities of deploying and managing replicas. Whether I've running a simple web server or a more complex microservices architecture, Deployments are the cornerstone for maintaining application consistency and availability.

## Services in Kubernetes:

Once an application is deployed, it needs a way to be accessed by other parts of my system or external users. This is where **Services** come into play. In Kubernetes, a service is an abstraction that defines a logical set of Pods and a policy by which to acccess them. It acts as a stable endpoint to connect to my application, allowing for easy communication within the cluster or from external sources. Some of the several types of services in kubernetes;

- ***ClusterIP:***Purpose: The default type. Exposes the Service on a cluster-internal IP. Accessible only within the cluster.

- ***NodePort:*** Exposes the Service on each Node's IP at a static port (NodePort). Accessible externally using `NodeIP`

- ***LoadBalaner:***Exposes the service externally using a cloud provider's load balancer. Accessible externally through the load balancer's IP.

In subsequent sections, I will dive deep into deployment strategies and service configurations within the Kubernetes ecosystem, delving into the intricacies of these components to ensure a thorough understanding and proficiency in their utilization.

- **Deploying a Minikube Sample Application** Using YAML files for deployments and services in Kubernetes is like crafting a detailed plan for my application, while direct deployment with `kubectl` commands is more like giving quick, on-the-spot instructions to launch and manage my application. Let's create a minikube deployment and service with `kubectl`

```
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
```
