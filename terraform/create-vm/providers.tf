# terraform {
#   backend "azurerm" {
#     subscription_id      = "<subscription ID>"
#     tenant_id            = "<TENANT ID>"
#     resource_group_name  = "aks-cluster-av-tfstate"
#     storage_account_name = "aksclusterstorage"
#     container_name       = "tfstate"
#     key                  = "aks-cluster.tfstate"
#     snapshot             = true
#   }
# }

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.39.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "<subscription ID>"
  tenant_id       = "<tenent ID>"
}
