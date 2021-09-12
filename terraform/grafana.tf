resource "helm_release" "grafana" {
  chart  = "stable/grafana"
  name   = "grafana"
  values = [file("./config.yml")]
}