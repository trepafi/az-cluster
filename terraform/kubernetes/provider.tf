provider "helm" {
  kubernetes {
    # config_path = pathexpand(var.kube_config)
  }
}

data "azurerm_kubernetes_cluster" "k8s_cluster" {
  name                = var.k8s_cluster.name
  # resource_group_name = "my-example-resource-group"
}

provider "kubernetes" {
  # host = var.k8s_cluster.host

  # client_certificate     = base64decode(var.k8s_cluster.client_certificate)
  # client_key             = base64decode(var.k8s_cluster.client_key)
  # cluster_ca_certificate = base64decode(var.k8s_cluster.cluster_ca_certificate)

  host                   = "${data.azurerm_kubernetes_cluster.k8s_cluster.kube_config.0.host}"
  client_certificate     = "${base64decode(data.azurerm_kubernetes_cluster.k8s_cluster.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(data.azurerm_kubernetes_cluster.k8s_cluster.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(data.azurerm_kubernetes_cluster.k8s_cluster.kube_config.0.cluster_ca_certificate)}"
}
