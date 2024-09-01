module "jenkins_vm" {
  source  = "Azure/virtual-machine/azurerm"
  name = "${var.environment}-${var.client_name}-jenkinsVM"
  subnet_id = azurerm_subnet.main_subnet.id  ###just for demo
  resource_group_name     = var.resource_group_name
  size = var.size
  location                = var.location
  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  image_os = "linux"
  os_simple = "UbuntuServer"
  admin_username          = "adminuser"
  admin_password          = "P@ssw0rd123!"  # You can also use SSH keys instead
  custom_data             = filebase64("${path.module}/install_jenkins.sh")
  tags = {
    Environment = "Production"
    Project     = "MyJenkinsProject"
  }
}
