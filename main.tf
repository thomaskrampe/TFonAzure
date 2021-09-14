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
    "OwnerName"       = "t.krampe@loginconsultants.de"
    "Environment"     = "Test"
    "ApplicationName" = "TF-GHA-Azure"
  }
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vNet99" {
  name                = "vNet99"
  address_space       = ["10.99.99.0/24"]
  location            = "${azurerm_resource_group.rg-ghactions-tf.location}"
  resource_group_name = "${azurerm_resource_group.rg-ghactions-tf.name}"
}

