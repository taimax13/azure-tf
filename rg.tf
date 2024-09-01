module "rg" {
  source  = "claranet/rg/azurerm"
  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}