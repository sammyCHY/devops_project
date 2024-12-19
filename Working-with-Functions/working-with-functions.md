# Working with Functions

In this mini-project, I will focus on some other essential concepts in shell scripting.

The overall goal is to develope a shell script for one of ***DataWise Solutions's*** clients, that automates the setup of EC2instances and S3 buckets. Part of the critical elements we will be focusing on in this project is Functions.

## Functions

Organizing a code is key to maiantaining clarity and efficiency. One powerful technique for achieving this is through the use of functions.

By encapsulating specific logic within functions, I can streamline my scripts and improve readability. Going forward, I will be creating functions for every pieces of requirement I wish to satisfy.

Lets consider the following logic and encapsulate them in functions.

1. Check if script has an argument

2. Check id AWS CLI is installed

3. Check if environment variable exists to authenticate to AWS

To create a function in a shell script, I simply have to define it using the following syntax:

```
function_name() \{
    # Function body
    # You can place any commands or logic here
\}
```

![The image shows the function structure](image/images/function_name1)

Here's a breakdown of the syntax:

- ***function_name*** This is the name my function. Choose a descriptive name that reflects the purpose of the function.

- (): Parentheses are used to define the function. They can be omitted  in simpler cases, but it's good practice to include them for clarity.

- {}: Curly braces enclose the body of the function, where you define the commands or logic that the function will execute.

**Function: Check if script has an argument**

Lets take the same code in previous mini-project and encapsulate it in a function.

Here is the code below without a function.

```
#!/bin/bash

# Checking the number of arguments
if [ "$#" -ne 0 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

# Accessing the first argument
ENVIRONMENT=$1

# Acting based on the argument value
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Running script for Local Environment..."
elif [ "$ENVIRONMENT" == "testing" ]; then
  echo "Running script for Testing Environment..."
elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Running script for Production Environment..."
else
  echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
  exit 2
fi
```

