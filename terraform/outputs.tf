output "resource_group_name" {
  value = azurerm_resource_group.default.name
}

output "k8s_cluster_name" {
  value = module.aks_cluster.k8s_cluster.name
}

output "k8s_cluster_name" {
  value = module.aks_cluster.k8s_cluster.kube_config.0.host
}

# output "host" {
#   value = a8s_cluster.default.kube_config.0.host
# }

# output "client_key" {
#   value = a8s_cluster.default.kube_config.0.client_key
# }

# output "client_certificate" {
#   value = a8s_cluster.default.kube_config.0.client_certificate
# }

# output "kube_config" {
#   value = a8s_cluster.default.kube_config_raw
# }

# output "cluster_username" {
#   value = a8s_cluster.default.kube_config.0.username
# }

# output "cluster_password" {
#   value = a8s_cluster.default.kube_config.0.password
# }
