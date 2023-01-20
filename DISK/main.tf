resource "azurerm_resource_group" "rg" {
  name     = "diskrg"
  location = "West US"
  tags = {
    "env" = "test"
  }

}

resource "azurerm_managed_disk" "rg" {
  name                 = "disk1"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  tags = {
    environment = "staging"
  }
}

