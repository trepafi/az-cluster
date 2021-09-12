terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.66.0"
    }
  }

  backend "azurerm" {
  }
  
  required_version = ">= 0.14"

}

provider "azurerm" {
  features {}
}

