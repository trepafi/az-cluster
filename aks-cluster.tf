# resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  # name     = "${random_pet.prefix.id}-rg"
  name     = "${var.k8s_base_name}-rg"
  location = var.region

  tags = {
    environment = var.environment
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name = "${var.k8s_base_name}-aks"
  # name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.k8s_base_name}-k8s"
  # dns_prefix          = "${random_pet.prefix.id}-k8s"

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
