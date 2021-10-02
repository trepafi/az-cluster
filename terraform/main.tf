# Creating Azure resource group
resource "azurerm_resource_group" "default" {
  name     = "${var.k8s_base_name}-rg"
  location = var.region

  tags = {
    environment = "${var.environment}"
  }
}

# Deploying AKS cluster
module "aks_cluster" {
  source = "./aks_cluster"

  resource_group_name     = azurerm_resource_group.default.name
  resource_group_location = azurerm_resource_group.default.location

  client_id     = var.client_id
  client_secret = var.client_secret

  environment   = var.environment
  k8s_base_name = var.k8s_base_name
}

# Creatin Kubectl file
resource "local_file" "kubeconfig" {
  sensitive_content  = base64decode(module.aks_cluster.k8s_cluster.kube_config_raw)
  filename = ".tfkubeconfig"
}

# Deploying on K8s cluster
module "kubernetes" {
  source = "./kubernetes"

  depends_on  = [module.aks_cluster, local_file.kubeconfig]
  k8s_cluster = module.aks_cluster.k8s_cluster
}