resource "azurerm_resource_group" "default" {
  name     = "${var.k8s_base_name}-rg"
  location = var.region

  tags = {
    environment = "${var.environment}"
  }
}

module "aks-cluster" {
  source   = "./aks-cluster"
  
  rg_name  = azurerm_resource_group.default.name
  location = azurerm_resource_group.default.location

  client_id     = var.client_id
  client_secret = var.client_secret

  environment = var.environment
}