provider "azurerm" {
   features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate12703"
    container_name       = "tfstateblob"
    key                  = "ghactions.terraform.tfstate"
  }
}

resource "azurerm_resource_group" "rg-ghactions-tf" {
  name     = "${var.resource_group_name}"
  location = "${var.azure_region}"
}
