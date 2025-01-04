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