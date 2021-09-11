# resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "${var.resource_group_name}"
    storage_account_name = "${var.storage_account_name}"
    container_name       = "${var.tfstate_filename}"
    key                  = "${var.tfstate_filename}-${var.environment}"
  }
}

resource "azurerm_resource_group" "default" {
  name     = "${var.k8s_base_name}-rg"
  location = "${var.region}"

  tags = {
    environment = "${var.environment}"
  }
}