locals {
  azure_ad_group_names = ["ADGroupName1", "ADGroupName2"]
}

module "keyvault" {
  source              = "kumarvna/key-vault/azurerm"
  version             = "2.2.0"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  key_vault_name      = "${var.client_name}-KeyVault"

  access_policies = [
    {
      azure_ad_user_principal_names = ["Talex@2bcloudsandbox.onmicrosoft.com"]
      key_permissions               = ["Get", "List"]
      secret_permissions            = ["Get", "List"]
      certificate_permissions       = ["Get", "Import", "List"]
      storage_permissions           = ["Backup", "Get", "List", "Recover"]
    },
    {
      azure_ad_group_names    = local.azure_ad_group_names
      key_permissions         = ["Get", "List"]
      secret_permissions      = ["Get", "List"]
      certificate_permissions = ["Get", "Import", "List"]
      storage_permissions     = ["Backup", "Get", "List", "Recover"]
    },
    {
      azure_ad_service_principal_names = ["displayName"]
      key_permissions                  = ["Get", "List"]
      secret_permissions               = ["Get", "List"]
      certificate_permissions          = ["Get", "Import", "List"]
      storage_permissions              = ["Backup", "Get", "List", "Recover"]
    }
  ]

  tags = {
    Environment = "Test"
    Project     = "MyKeyVaultProject"
  }

  depends_on = [module.rg]
}
