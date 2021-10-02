variable "namespace" {
  type        = string
  default     = "dev"
  description = "Default namespace"
}

variable "k8s_cluster" {
  description = "Kubernetes cluster configuration"
}

# variable "grafana_password" {
#   description = "Grafana password"
#   type        = string
# }