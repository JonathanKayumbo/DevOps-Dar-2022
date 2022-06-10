# terraform {
#   backend "azurerm" {
#     subscription_id      = "3ff9fa51-9d4f-4e3e-8b7b-841b7c136712"
#     tenant_id            = "6b7dddea-ad8f-4522-be45-cb8e69a29a5a"
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
  subscription_id = "3ff9fa51-9d4f-4e3e-8b7b-841b7c136712"
  tenant_id       = "6b7dddea-ad8f-4522-be45-cb8e69a29a5a"
}
