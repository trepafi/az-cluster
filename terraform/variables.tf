variable "client_id" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "client_secret" {
  description = "Azure Kubernetes Service Cluster secret"
}

variable "region" {
  description = "Azure Region"
  default     = "westeurope"
}

variable "environment" {
  description = "Working enviroment"
  default     = "dev"
}

variable "k8s_base_name" {
  description = "Name for K8s cluster and resources"
  default     = "relaxing-parrot"
}