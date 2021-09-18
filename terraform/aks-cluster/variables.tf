variable "node_size" {
  description = "Size for Azure instances to be used as K8s nodes"
  default     = "Standard_D2_v2"
}


# Inherited vars
variable "k8s_base_name" {}
variable "environment" {}
variable "client_id" {}
variable "client_secret" {}
variable "resource_group_name" {}
variable "resource_group_location" {}