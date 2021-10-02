variable "admin_ns" {
  type        = string
  default     = "lt-admin"
  description = "Admin namespace"
}

variable "metrics_ns" {
  type        = string
  default     = "lt-metrics"
  description = "Metrics namespace"
}

# variable "grafana_password" {
#   description = "Grafana password"
#   type        = string
# }