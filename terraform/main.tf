resource "azurerm_resource_group" "default" {
  name     = "${var.k8s_base_name}-rg"
  location = var.region

  tags = {
    environment = "${var.environment}"
  }
}

module "aks_cluster" {s
  source = "./aks_cluster"

  resource_group_name     = azurerm_resource_group.default.name
  resource_group_location = azurerm_resource_group.default.location

  client_id     = var.client_id
  client_secret = var.client_secret

  environment   = var.environment
  k8s_base_name = var.k8s_base_name
}mVYe8Us8F4wh7poBm3VNY2nN2DZL/l4H5PNTRKUN6dmx4SnTnDso2HCs7iYqIOuC Dp/kBbV6cKQ+ccor37mQagugP4gb3pT+l9LR8Y4/olt2ojvqgxwdxkuYegS8wjMy FE73QtNGsgzFt24fdnjVwQIQDdsp9/CUt78q0h6JAoGANAHTmUFqvo6vvs24L2tP hUFyjnjNld06CbZ2v6aC1xjvfpdDZ8jAhDuaY3mLaTv16STLl0l/PoC8ZOWGMlE6 sX/9tFwfjvafQGda2KQKkclQCETLR9yVW8E1TMonGtatomkOL9QAAXnJ4vRL+T1Z 8O7AYhM74EnCK8yC7BgY4FMCgYA/eChMlO0JRga9RkVyabLvCHU5oZm7/86jFZHQ gx0VaXF6Ftfu4LPrkn8X5sQ/kbD86mIYxLUCylKHL9rNMhhF+B2qbcAjjh8qxMbD J0suCmxeQflfK3Q1fJ03wdhrRcVr40Z5pBHyaLQwHqUn6N2/j2C+tSd6wp20/hnH YsgfuQKBgQCsJKJL0EsjWR4srCmyOjXzRAg0mv0Dh5WzkCtry9Oc1w3jq6UjtV9b U6acX0oipFACwrTYnoH7xAYaWDJ0e0MiaNrcNabCV/Ehzzb6lTsvedVKqVDAVQw3 RW9wIU07dmpGs/yXcb2lgWqEvbLeFjlkI/sqWfOwvt3Ljwu2aF+pNw== -----END RSA PRIVATE KEY-----

module "kubernetes" {
  source = "./kubernetes"

  depends_on         = [module.aks_cluster]
  kubernetes_cluster = module.aks_cluster.kubernetes_cluster
}