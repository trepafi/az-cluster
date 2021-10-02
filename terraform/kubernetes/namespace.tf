resource "kubernetes_namespace" "admin_ns" {
  metadata {
    name = var.admin_ns
  }
}

resource "kubernetes_namespace" "metrics_ns" {
  metadata {
    name = var.metrics_ns
  }
}