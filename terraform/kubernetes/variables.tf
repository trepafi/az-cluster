# variable "kube_config" {
#   type        = string
#   description = "Kubectl config file"
#   default     = "~/.kube/config"
# }

variable "namespace" {
  type    = string
  default = "dev"
}

# variable "grafana_password" {
#   description = "Grafana password"
#   type        = string
# }