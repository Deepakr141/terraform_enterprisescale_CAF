# terraform.tf

# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.19.0"
      configuration_aliases = [
        azurerm.connectivity,
        azurerm.management,
        azurerm.identity,
      ]
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = "561616ba-89d8-4a9f-8900-085c38bf03a2"
  features {}
}

provider "azurerm" {
  alias           = "management"
  subscription_id = "754aaff7-034d-4ff3-be52-721ffa7809c2"
  features {}
}

provider "azurerm" {
  alias           = "identity"
  subscription_id = "52414b66-80cc-4b81-b662-8fd968a412b0"
  features {}
}
