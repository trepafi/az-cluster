provider "azurerm" {
  features {}
}

provider "local" {

}

provider "kubernetes" {
  host                   = module.aks_cluster.k8s_cluster.kube_config.0.host
  client_certificate     = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.client_certificate)
  client_key             = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.aks_cluster.k8s_cluster.kube_config.0.host
    client_certificate     = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.client_certificate)
    client_key             = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.cluster_ca_certificate)
  }
}