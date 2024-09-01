Log in to Azure using the CLI:
az login

Log in to your Azure Container Registry:
az acr login --name <your-acr-name>


Tag the image for your ACR:
docker tag hello-world-webapp <your-acr-name>.azurecr.io/hello-world-webapp:v1

Push the image to ACR:
docker push <your-acr-name>.azurecr.io/hello-world-webapp:v1