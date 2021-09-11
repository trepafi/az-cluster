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

variable "node_size" {
  description = "Size for Azure instances to be used as K8s nodes"
  default     = "Standard_D2_v2"
}

variable "k8s_base_name" {
  description = "Name for K8s cluster and resources"
  default     = "relaxing-parrot"
}

# variable "storage_account_name" {
#   description = "Azure Storage Account name"
#   default = "azk8sstorage"
# }

# variable resource_group_name {
#   description = "Azure Resource Group name"
#   default = "az-k8s-resource-group"
# }

# variable "tfstate_filename" {
#   description = "Terraform state filename"
#   default = "tfstate"
# }