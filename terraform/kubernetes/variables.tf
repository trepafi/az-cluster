variable "webapp_namespace" {
  type        = string
  default     = "webapp"
  description = "Namespase for a web application"
}

variable "k8s_cluster" {
  description = "Kubernetes cluster configuration"
}


# variable "grafana_password" {
#   description = "Grafana password"
#   type        = string
# }