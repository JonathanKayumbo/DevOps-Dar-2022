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
