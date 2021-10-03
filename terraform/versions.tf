terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.79.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.5.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.3.0"
    }
  }

  backend "azurerm" {
  }

  required_version = ">= 0.14"
}
