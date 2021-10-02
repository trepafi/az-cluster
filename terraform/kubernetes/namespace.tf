resource "kubernetes_namespace" "webapp" {
  provider = kubernetes.aks
  metadata {
    name = var.webapp_namespace
  }
}