resource "azurerm_network_security_group" "redis_nsg" {
  name                = "redis-nsg"
  location            = var.location
  resource_group_name = module.rg.resource_group_name

  security_rule {
    name                       = "AllowRedis"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["6379"]  # Default Redis port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [module.rg]
}

resource "azurerm_subnet_network_security_group_association" "redis_nsg_assoc" {
  subnet_id                 = azurerm_subnet.redis_subnet.id
  network_security_group_id = azurerm_network_security_group.redis_nsg.id
}
