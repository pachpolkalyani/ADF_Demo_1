# ARM provider block 
provider "azurerm"{
version = ">=2.0.0"
features {}
}

# Terraform backend configuration block 
terraform {
backend "azurerm" {
resource_group_name = "rg-cloudquickpocs"
storage_account_name = "ccpsazuretf0001"
container_name = "ccpterrraformstatefile"
key = "ccpsterraform.tfstate"
}
}
