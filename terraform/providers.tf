provider "azurerm" {
  features {}
}

provider "local" {}

provider "kubernetes" {
  # alias            = "aks"
  # load_config_file = "true"
  # config_path = ".tfkubeconfig"

  # module.aks_cluster.k8s_cluster.kube_config_raw
  # host                   = module.aks.host
  # client_certificate     = base64decode(module.aks.client_certificate)
  # client_key             = base64decode(module.aks.client_key)
  # cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)

  host                   = module.aks_cluster.k8s_cluster.kube_config.0.host
  client_certificate     = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.client_certificate)
  client_key             = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(module.aks_cluster.k8s_cluster.kube_config.0.cluster_ca_certificate)
}