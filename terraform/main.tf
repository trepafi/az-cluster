resource "azurerm_resource_group" "default" {
  name     = "${var.k8s_base_name}-rg"
  location = var.region

  tags = {
    environment = "${var.environment}"
  }
}

module "aks_cluster" {
  source = "./aks_cluster"

  resource_group_name     = azurerm_resource_group.default.name
  resource_group_location = azurerm_resource_group.default.location

  client_id     = var.client_id
  client_secret = var.client_secret

  environment   = var.environment
  k8s_base_name = var.k8s_base_name
}

module "kubernetes" {
  source = "./kubernetes"

  depends_on         = [module.aks_cluster]
  k8s_cluster = module.aks_cluster.k8s_cluster
}