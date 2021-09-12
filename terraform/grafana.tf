# resource "helm_release" "grafana" {
#   repository = "https://grafana.github.io/helm-charts"
#   chart      = "stable/grafana"
#   name       = "grafana"
#   values     = [file("./grafana/config.yml")]
# }