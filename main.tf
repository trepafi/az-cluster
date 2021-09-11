# resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "${var.k8s_base_name}-rg"
  location = var.region

  tags = {
    environment = "${var.environment}"
  }
}