resource "kubernetes_namespace" "this" {
  provider = kubernetes.lke
  metadata {
    name = var.namespace
  }
}