# Mini Project-Working with Helm Chart

## Step 1: Customize Your Helm Chart

Understanding Helm Charts, Values, and Templates

Why Helm Charts Are Needed:

   - Helm charts are packages or collections of pre-configured Kubernetes resources.

   - They simplify the deployment and management of applications in Kubernetes by bundling all necessary resources into a single, manageable unit.

   - Helm charts promote reusability and consistency,    allowing you to define, install, and upgrade even the  most complex Kubernetes applications easily.  


What are Charts, Values and Templates:

   - Charts: A Helm chart is a directory with a predefined structure. It contains think of it as a recipe with instructions on how to create and run a Kubernetes application.

   - Values: The `values.yaml` file inside a chart provides configuration values for a chart's templates. These values can be overridden during chart installation or upgrades, allowing for flexibility and customization without altering the chart's core logic.

   - Templates: The `templates/` directory contains the template files. These are standard Kubernetes YAML files with placeholders (`{{" .Values.SomeParameter "}}`). Helm dynamically fills these placeholders with the values from the `values.yaml` file or override values provided during runtime. This allows you to customize the deployment without changing the actual YAML files.


1. Explore the `webapp` Directory:

   - Navigate to the `Webapp` directory created by Helm. Inside, you'll find:
    
    - `Chart.yaml` : Contains metadata about the chart such as name, version, and description.

    - `values.yaml` : Provides configuration values that Helm will inject into the templates. Here you set default configuration values.

    - `templates/`: Contains the template files that will generate Kubernetes manifest files. These templates reference the values defined in `values.yaml`.

2. Modify `values.yaml`:

    - Open `values.yaml` in a text editor.

    - Set the image to use the Nginx stable version
 
    ```
    replicaCount: 2

    image:
        repository: nginx
        tag: stable
        pullPolicy: IfNotPresent
    ```

    - This configuration will deploy two replicas (`replicaCount: 2`) of the Nginx server.

    - Save your changes.

3. Customize `templates/deployment.yaml`:

    - Open the `deployment.yaml` file in the templates/` directory.

    - Remove the line below from under `spec.template.spec.containers.resources`.

    ```
    {"{- toYaml .Values.resources | nindent 12 "}}
    ```

    - Add a simple resources request and limit under `spec.template.spec.containers.resources`. This helps Kubernetes manage resources efficiently. 

    ```
    resources:
       requests:
         memory: "128Mi"
         cpu: "100m"
       limits:
          memory: "256Mi"
          cpu: "200m"
    ```
4. Commit and Push Changes:

    ```
    git add .
    git commit -m "Customized Helm chart"
    git push
    ```

### Step 2: Deploying Your Application

1. Deploy with Helm: Navigate to the root of your project directory `helm-web-app`

   Deploy the the application on Kubernetes using the below command:
   
   ```
   helm install my-webapp ./webapp
   ```

2. Check Deployment:

    ```
    kubectl get deployments
    ```

3. Visit Application URL: Get the application URL by running these commands:


    ```
    export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=webapp,app.kubernetes.io/instance=my-webapp" -o jsonpath="{".items[0].metadata.name"}")

    export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{".spec.containers[0].ports[0].containerPort"}")

    kubectl --namespace default port-forward $POD_NAME 8081:$CONTAINER_PORT
    ```
 Visit http://127.0.0.1:8081 to use your application