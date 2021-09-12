variable "node_size" {
  description = "Size for Azure instances to be used as K8s nodes"
  default     = "Standard_D2_v2"
}

variable "k8s_base_name" {
  description = "Name for K8s cluster and resources"
  default     = "relaxing-parrot"
}