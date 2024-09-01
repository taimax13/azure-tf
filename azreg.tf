module "azure_region" {
  source  = "claranet/regions/azurerm"
  azure_region = var.location
}

