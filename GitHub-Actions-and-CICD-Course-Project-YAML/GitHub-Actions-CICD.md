# GitHub Actions and CI/CD Course Project - YAML.

### GitHub Actions and CI/CD Course Project - YAML

Welcome to this engaging and practical course on GitHubs Actions and Continuous Integration/Continuous Deployment (CI/CD). In this course, I will embark on a  journey to master the art of automating your software development processes using one of the most powerful tools available on Github. Whether you're a seasoned developer or a beginner, this course is designed to equip you with the essential skills needed to streamline your development workflow, enhance the quality of your code, and significantly reduce the time to deploy new features and fixes.


## Why This Course is Relevant for Learners

![The Image is the ci/cd image orchestration architecture](image/images/cicd-orchestration.png)

Imagine you are a conductor of an orchestra. Each musician (developer) plays a different instrument (code) and must synchronize perfectly to create harmonious music (software). In this scenario, GitHub Actions and CI/CD processes are like your conductor's baton, helping you to orchestrate the diverse elements of software development. Just as a conductor ensures that each musician enters at the right time and the music flows smoothly, CI/CD coordinates the various stages of development, testing, and deployment, ensuring that the final product is delivered seamlessly and efficiently. This course, therefore, is not just about learning the technicalities of GitHub Actions; It's about learning how to conduct your software development orchestra with skill and precision, leading to a symphony of streamlined processes and high-quality outcomes.   


Lesson 3: Workflow Syntax and Structure

Objectives:

- Understand YAML syntax for workflows.

- Learn the structure and components of a workflow.

Pre-requisites


1. GitHub Account:

    - Necessary for repository management and GitHub Actions.

    - Sign up at [GitHub](https://github.com/).


2. Git Installed:

    - Required for version control and managing code changes.

    - Installation guide: [Git Installation](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

3. Basic Knowledge of Git:

    - Understanding of basic Git commands (`clone`, `commit`, `push`, `pull`).

    - Tutorial: [Git Basics.](https://git-scm.com/docs/gittutorial)


4. Node.js and npm Installed:

    - Node.js is the runtime for the project, and npm is the package manager.

    - Download ans installation: [Node.js Downloads.](https://nodejs.org/en/download/)

    - Verify installation with `node -v` and `npm -v` in the terminal.


5. Familiarity with JavaScript:

    - Basic understanding of JavaScript Programming.

    - Tutorial: [JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)


6. Text Editor or IDE:

    - A code editor such as Visual Studio Code, Atom, or Sublime Text.

    - Visual Studio Code: [Download VS code](https://code.visualstudio.com/download)


7. Access to a Command Line Interface (CLI):

    - Terminal on macOS /Linux or Command Prompt/PowerShell on Windows


    - Guide: [The Command Line Interface.](https://www.codecademy.com/article/command-line-interface)


8. Basic Understanding of YAML:

    - YAML is used for writing GitHub Actions workflows.

    - Tutorial: [Learn YAML in Y Minutes.](https://learnxinyminutes.com/yaml/)


9. Internet Connection:


    - Required for accessing GitHub, documentation, and online resources.


10. Willingness to Learn and Experiment:


    - Openness to exploring new tools and troubleshooting.



Lesson Details:

1. YAML Syntax for Workflows:

    - YAML is a human-readable data serialization standard used for configuration files.

    - Key concepts: indentation, key-value pairs, lists.

    - Example snippet:

    ```
    name: Example Workflow
    on: [push]
    ```

2. Workflow Structure and Components:

    - Workflow File: Located in `.github/workflows` directory, e.g., `main.yml`.

    - Jobs: Define tasks like building, testing, deploying.

    - Steps: Individual tasks within a job.

    - Actions: Reusable units of code within steps.

    - Events: Triggers for the workflow, e.g., `push`, `pull_request`. 

    - Runners: The server where the job runs, e.g., `ubuntu-latest`.


**Module 3: Implementing Continuous Integration.**

**Lesson 1: Building and Testing Code.**

**Objectives:**

- Set up build steps in GitHub Actions.
- Run tests as part of the CI process.

***Setting Up Build Steps:***

1. Defining the Build Job:

    - In your GitHub Actions workflow file (e.g.,`.github/workflows/main.yml`), start by defining a job named `build`.

    ```
    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
        # Steps will be defined next
    ```

![The Image shows the build steps on the Github action workflow](build-step1.png)

**Adding Build Steps:**

- Each step in the job performs a specific task.

- Here, we add three steps: checking out the code, installing dependencies, and running the build script.

```
steps:
- uses: actions/checkout@v2
  # 'actions/checkout@v2' is a pre-made action that checks out your repository under $GITHUB_WORKSPACE, so your workflow can access it.

- name: Install dependencies
  run: npm install
  # 'npm install' installs the dependencies defined in your project's 'package.json' file.

- name: Build
  run: npm run build
  # 'npm run build' runs the build script defined in your 'package.json'. This is typically used for compiling or preparing your code for deployment.
```
![The Image shows the build steps on the Github action workflow](build-step2.png)

Running Tests in the Workflow:

1. Adding Test Steps: 

    - After the build steps, include steps to execute your test scripts.

    - This ensures that your code is not only build also passes all the tests.

```
  - name: Run tests
  run: npm test
  # 'npm test' runs the test script defined in your 'package.json'. It's crucial for ensuring that your code works as expected before deployment.
```  

![The Image shows the run test on the Github action workflow](run-test.png)

**Learner Notes:**

  - The `build`job consists of steps to check out the code, install dependencies, build the code, and run tests.
  - The `runs-on: ubuntu-latest` line specifies that the job should run on the latest version of Ubuntu provided by GitHub Actions.

  - Using actions like `actions/checkout@v2` helps in leveraging community-maintained actions to simplify command tasks.


  - Commands like `npm install`, `npm run build`, and `npm test`are standard Node.js commands used for managing dependencies, building, and testing Node.js applications.


## Additional YAML Concepts in GitHub Actions.

Objectives:

- Deepen understanding of advanced YAML features used in GitHub Actions.

- Explore the use of environment variables and secrets in workflows.


Detailed Steps and Code Explanation:

1. Using Environment Variables:

    - Environment variables can be defined at the workflow, job, or step level.

    - They allow you to dynamically pass configuration and settings. 


```
env:
  CUSTOM_VAR: value
  # Define an environment variable 'CUSTOM_VAR' at the workflow level.

jobs:
  example:
    runs-on: ubuntu-latest
    steps:
    - name: Use environment variable
      run: echo $CUSTOM_VAR
      # Access 'CUSTOM_VAR' in a step.
```

![The Image shows the environment variable on the Github action workflow](environmental_variables.png)

2. ### Working with Secrets: 

    - Secrets are encrypted variables set in   your GitHub repository settings.

    - Ideal for storing sensitive data like access tokens, passwords, etc.


```
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Use secret
      run: |
        echo "Access Token: ${{" secrets.ACCESS_TOKEN "}}"
        # Use 'ACCESS_TOKEN' secret defined in the repository settings.
```

3. Conditional Execution:

- You can control when jobs, steps, or workflows run based on conditions.
 

```
jobs:
  conditional-job:
    runs-on: ubuntu-latest
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    # The job runs only for push events to the 'main' branch.
    steps:
    - uses: actions/checkout@v2
```

4. Using Outputs and Inputs between Steps:

    - Share data between steps in a job using outputs.

```
jobs:
  example:
    runs-on: ubuntu-latest
    steps:
    - id: step-one
      run: echo "::set-output name=value::$(echo hello)"
      # Set an output named 'value' in 'step-one'.
    - id: step-two
      run: |
        echo "Received value from previous step: ${{" steps.step-one.outputs.value "}}"
        # Access the output of 'step-one' in 'step-two'.
```

![The Image shows the pipeline deployment on the Github action workflow](build-completed2.png)


![The Image shows the pipeline deployment on the Github action workflow](build-completed.png)


![The Image shows the pipeline deployment on the Github action workflow](git-yaml-final1.png)


**Learner Notes:**

   - Environment variable and secrets are crucial for managing configurations and sensitive data in your CI/CD pipelines.

   - Conditional execution helps tailor the workflow based on specific criteria, making your CI/CD process more efficient.

   - Sharing data between steps using outputs and inputs allows for more complex workflows where the output of one step can influence or provide data to subsequent steps.

   - These advanced features enhanced the flexibility and security of your GitHub Actions Workflows, enabling a more robust CI/CD process.


Lesson 2: Configuring Build Matrices

**Objectives:**

   - Implement parallel and matrix builds.

   - Manage dependencies across different environments.   
