resource "random_id" "prefix" {
  byte_length = 8
}
locals {
  nodes = {
    for i in range(1) : "worker${i}" => {
      name                  = substr("worker${i}${random_id.prefix.hex}", 0, 8)
      vm_size               = "Standard_D2s_v3"
      node_count            = 1
      vnet_subnet_id        = azurerm_subnet.main_subnet.id  ###just for demo
      create_before_destroy = i % 2 == 0
    }
  }
}
module "aks" {
  source  = "Azure/aks/azurerm"
  resource_group_name  = var.resource_group_name
  cluster_name         = "${var.environment}-${var.client_name}-myAKSCluster"
  identity_type = "SystemAssigned"
  node_pools          = local.nodes

  tags = {
    Environment = "Production"
    Project     = "MyProject"
  }
}
