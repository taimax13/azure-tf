resource "azurerm_public_ip" "nginx_ip" {
  name                = "nginxPublicIP"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "default"
  values = [
    "controller.service.loadBalancerIP=${azurerm_public_ip.nginx_ip.ip_address}"
  ]
}
