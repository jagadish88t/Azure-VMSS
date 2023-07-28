# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.66"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

# Provider1 Block
provider "azurerm" {
  features {
    # Features block is used to customize the behaviour of certain Azure Provider resources.
  }
}

# Provider2 Block
provider "azurerm" {
  features {
    # Features block is used to customize the behaviour of certain Azure Provider resources.
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
  alias = "provider2-westus"
  #client_id = 
  #subscription_id = 
  #client_secret =
}

/*
    Multiple providers with separate configurations can be used to create resources in Azure.
    In this sample code Provider1 is going to be default provider.
    Provider2 is going to be customized provider for resources created in West US region.
}
*/