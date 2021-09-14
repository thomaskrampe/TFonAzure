# Configure the Azure Provider
# <https://www.terraform.io/docs/providers/Getazurerm/index.html>
provider "azurerm" {
   features {}
}

# Azure Remote Backend
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate12703"
    container_name       = "tfstateblob"
    key                  = "ghactions.terraform.tfstate"
  }
}

# Create a resource group
# <https://www.terraform.io/docs/providers/azurerm/r/resource_group.html>
resource "azurerm_resource_group" "rg-ghactions-tf" {
  name     = var.resource_group_name
  location = var.azure_region
  tags = {
    "OwnerName" = "t.krampe@loginconsultants.de"
    "Environment" = "Test"
    "ApplicationName" = "TF-GHA-Azure"
  }
}
