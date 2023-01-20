provider "azurerm" {
  features {}

  subscription_id = "e92f96e1-d0a9-4a78-a545-fc79b4e612dd"
  client_id       = "43f3bad2-407f-48a7-813a-5c1077817ad2"
  client_secret   = "WHp8Q~gzAlMZtV-5C39iuVlCnFtvAZhUaThxfbII"
  tenant_id       = "d2e12119-14a3-4115-a91f-a301f944fda6"
}

resource "azurerm_resource_group" "rg" {
  name     = "testrg"
  location = "East US"
  tags = {
    environment = "prod"
    tier = "backend"
  }
}
resource "azurerm_public_ip" "rg"{
  name = "pip1"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
   allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_public_ip" "rg1"{
  name = "pip2"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
   allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}