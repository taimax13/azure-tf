##https://itnext.io/kubernetes-cert-manager-with-azure-workload-identity-for-dns-01-challenge-6371e03a0ac9 - also can be used
resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "cert-manager"

  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  set {
    name  = "replicaCount"
    value = "2"
  }

  set {
    name  = "extraArgs[0]"
    value = "--enable-certificate-owner-ref=true"
  }
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
  namespace  = "external-dns"

  create_namespace = true

  set {
    name  = "provider"
    value = "azure"
  }

#   set {
#     name  = "azure.subscriptionId"
#     value = azurerm_subscription.current.subscription_id
#   }
##
#   set {
#     name  = "azure.resourceGroup"
#     value = module.rg.resource_group_name
#   }

#   set {
#     name  = "azure.tenantId"
#     value = data.azurerm_client_config.current.tenant_id
#   }

  set {
    name  = "azure.aadClientId"
    value = azurerm_user_assigned_identity.workload_identity.client_id
  }

  set {
    name  = "azure.aadClientSecret"
    value = module.keyvault.key_vault_id  ##not sure
  }

  set {
    name  = "domainFilters[0]"
    value = "your-domain.com"
  }

  set {
    name  = "extraArgs[0]"
    value = "--source=service"
  }

  set {
    name  = "extraArgs[1]"
    value = "--source=ingress"
  }

  set {
    name  = "extraArgs[2]"
    value = "--azure-resource-group=$(azurerm_resource_group.main.name)"
  }
}

resource "azurerm_user_assigned_identity" "workload_identity" {
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  name                = "workload-identity"
  depends_on = [module.rg]
}
