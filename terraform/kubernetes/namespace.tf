resource "kubernetes_namespace" "admin_ns" {
  metadata {
    name = var.admin_ns
  }
}