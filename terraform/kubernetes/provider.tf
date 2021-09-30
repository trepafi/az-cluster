provider "helm" {
  kubernetes {
    # config_path = pathexpand(var.kube_config)
  }
}

provider "kubernetes" {
  # host = var.kubernetes_cluster.host

  # client_certificate     = base64decode(var.kubernetes_cluster.client_certificate)
  # client_key             = base64decode(var.kubernetes_cluster.client_key)
  # cluster_ca_certificate = base64decode(var.kubernetes_cluster.cluster_ca_certificate)
}
