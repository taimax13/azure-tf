resource "azurerm_virtual_network" "main" {
  name                = "${var.client_name}-Vnet"
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  address_space       = ["10.0.0.0/16"]
  depends_on = [module.rg]
}

resource "azurerm_subnet" "main_subnet" {
  name                 = "main-subnet"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
  depends_on = [module.rg]
}

resource "azurerm_subnet" "redis_subnet" {
  name                 = "redis-subnet"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [module.rg]
}
