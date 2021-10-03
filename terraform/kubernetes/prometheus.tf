resource "helm_release" "prometheus" {
  chart      = "prometheus-community/kube-prometheus-stack"
  version    = "6.1.11"
  name       = "my-prometheus"
  namespace  = var.metrics_ns
  repository = "https://prometheus-community.github.io/helm-charts/"

  ## Overriding values
  values = [
    file("./kubernetes/kube-prometheus-stack.yml")
  ]
}