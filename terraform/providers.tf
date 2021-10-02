provider "azurerm" {
  features {}
}

provider "local" {}

provider "kubernetes" {
  # alias            = "aks"
  # load_config_file = "true"
  config_path      = ".tfkubeconfig"
}