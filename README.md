# azute-tf
example of usage of azure modules

## Base of the env
Terraform modules list instances
```bash
az vm list-sizes --location "eastus"
```
```Error: creating Linux Virtual Machine (Subscription: "59085fe8-defe-4423-99d5-b64014ebc86a"
│ Resource Group Name: "rg-StackName-client1-test"
│ Virtual Machine Name: "test-client1-jenkinsVM"): performing CreateOrUpdate: unexpected status 409 (409 Conflict) with error: SkuNotAvailable: The requested VM size for resource 'Following SKUs have failed for Capacity Restrictions: Standard_D2_v3' is currently not available in location 'eastus'. Please try another size or deploy to a different location or different zone. See https://aka.ms/azureskunotavailable for details.
│ 
│   with module.jenkins_vm.azurerm_linux_virtual_machine.vm_linux[0],
│   on .terraform/modules/jenkins_vm/main.tf line 94, in resource "azurerm_linux_virtual_machine" "vm_linux":
│   94: resource "azurerm_linux_virtual_machine" "vm_linux" {
│ 
╵
(.venv) talexm@tmaxim-i7-dev-pyramidanalytics-com:~/azure-devops/azure-devops$ az vm list-sizes --location "eastus" |grep  Standard_D2_v3
    "name": "Standard_D2_v3",
```

### 1. Basic Web Application
Technology Used: Python with Flask
Task Description: Created a simple "Hello World" web application.
File: app.py
Summary:
Developed a basic Flask application that responds with "Hello World!" when accessed via HTTP.
### 2. Containerization
Technology Used: Docker
Task Description: Containerized the Flask application.
File: Dockerfile
Summary:
Wrote a Dockerfile to build a Docker image for the Flask application.
The Dockerfile installs Flask, sets the working directory, copies the application code, and exposes the necessary port.
Built and ran the Docker image locally to verify that the application functions as expected.
### 3. Pushing Docker Image to Azure Container Registry (ACR)
Technology Used: Azure CLI, Docker
Task Description: Pushed the Docker image to Azure Container Registry (ACR).
Commands Used:
Tagged the Docker image for ACR: docker tag hello-world-webapp <your-acr-name>.azurecr.io/hello-world-webapp:v1
Pushed the Docker image to ACR: docker push <your-acr-name>.azurecr.io/hello-world-webapp:v1
Summary:
Time and env - constraint
Conseptually  pushed the Docker image to the Azure Container Registry for deployment in AKS. - 
### 4. CI/CD Pipeline Setup
Technology Used: Jenkins, Docker, Kubernetes
Task Description: Created a Jenkins CI/CD pipeline for the application.
File: Jenkinsfile
Summary:
Coseptually
Configured a Jenkins pipeline that builds the Docker image, pushes it to ACR, and deploys the application to AKS.
The pipeline automates the entire process, ensuring consistent and repeatable deployments.
### 5. Orchestration on AKS
Technology Used: Kubernetes, AKS
Task Description: Deployed the web application on Azure Kubernetes Service (AKS).
Files: k8s/deployment.yaml, k8s/service.yaml
Summary:
Set up a Kubernetes deployment and service configuration to deploy the Docker container to AKS.
The application is exposed via a LoadBalancer service, making it accessible over HTTP - !!! HTTP within the internal network.
### 6. Application Verification
Task Description: Verified the application is running as expected.
Summary NOT CONFIGURED:
The application is running on AKS and is accessible via the public IP provided by the LoadBalancer service.
Additional Information

Repository: The work done so far is available on GitHub: https://github.com/taimax13/azure-tf
Time Spent: Approximately 3 hours were dedicated to completing these tasks, focusing on developing, containerizing, and setting up the CI/CD pipeline.

Next Steps
Further Enhancements: If required, additional features can be added, such as enhanced monitoring, scaling, and more complex CI/CD integrations.
Feedback: Please provide any feedback or further instructions for the next steps.