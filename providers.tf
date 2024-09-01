provider "azurerm" {
 features {}
 #use_cli_auth = true
}
#### I do not have active subscription, but I managed to run lint
# ╷
# │ Error: populating Resource Provider cache: listing Resource Providers: loading results: unexpected status 404 (404 Not Found) with error: SubscriptionNotFound: The subscription 'bd4f0481-b137-40f1-9e64-20cfd55fbf49' could not be found.
# │
# │   with provider["registry.terraform.io/hashicorp/azurerm"],
# │   on providers.tf line 1, in provider "azurerm":
# │    1: provider "azurerm" {
# │
# (.venv) talexm@tmaxim-i7-dev-pyramidanalytics-com:~/azure-devops/azure-devops$ az group list
# (SubscriptionNotFound) The subscription 'bd4f0481-b137-40f1-9e64-20cfd55fbf49' could not be found.
# Code: SubscriptionNotFound
# Message: The subscription 'bd4f0481-b137-40f1-9e64-20cfd55fbf49' could not be found.
