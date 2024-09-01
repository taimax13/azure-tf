# terraform.tfvars

client_name         = "client1"
environment         = "test"  # or "dev", "staging", etc.
stack               = "StackName"
location            = "East US"  # or "West Europe", etc.
location_short      = "eus"  # Short version like "westeu" for "West Europe"

logs_destinations_ids = [
  #"/subscriptions/your-subscription-id/resourceGroups/your-rg/providers/Microsoft.Storage/storageAccounts/your-storage-account",
  #"/subscriptions/your-subscription-id/resourceGroups/your-rg/providers/Microsoft.OperationalInsights/workspaces/your-log-analytics-workspace"
]

extra_tags = {
  project = "MyProject"
  owner   = "YourName"
}

sku = "Standard"
