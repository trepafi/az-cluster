terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.66.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.3"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.1.0"
    }
  }

  backend "azurerm" {
  }

  required_version = ">= 0.14"

}

provider "azurerm" {
  features {}
}

provider "local" {}

provider "kubernetes" {
  alias            = "akz"
  load_config_file = "true"
  config_path      = ".tfkubeconfig"
}