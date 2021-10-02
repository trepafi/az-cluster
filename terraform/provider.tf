provider "azurerm" {
  features {}
}

provider "local" {}

provider "kubernetes" {
  alias            = "akz"
  load_config_file = "true"
  config_path      = ".tfkubeconfig"
}