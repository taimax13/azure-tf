module "keyvault" {
  source  = "kumarvna/key-vault/azurerm"
  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_name = "${var.client_name}-KeyVault"

  tags = {
    Environment = "Test"
    Project     = "MyKeyVaultProject"
  }

}
