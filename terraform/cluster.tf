resource "azurerm_kubernetes_cluster" "default" {
  name                = "${var.k8s_base_name}-aks"
  location            = resource_group.location
  resource_group_name = resource_group.name
  dns_prefix          = "${var.k8s_base_name}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = var.node_size
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = var.environment
  }
}
