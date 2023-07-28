# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.66"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
      version = "2.0.0-preview3"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {
    # Features block is used to customize the behaviour of certain Azure Provider resources.
  }
}

provider "azurecaf" {
  # Configuration options
}