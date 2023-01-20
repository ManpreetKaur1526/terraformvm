
locals {
  name_prefix = "${var.organization}-${var.environment}-${var.app}-${var.tier}"
}


resource "azurerm_resource_group" "example" {
  name     = "${local.name_prefix}-${var.rgname}"
  location = var.loc
  tags = var.tagging
  
}

resource "azurerm_virtual_network" "main" {
  name                = "${local.name_prefix}-${var.vnet}"
  address_space       = var.vnet_address
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

 resource "azurerm_subnet" "subnet1" {
   name                 = "${var.vnet}-${var.subnet_name}"
   resource_group_name  = azurerm_resource_group.example.name
   virtual_network_name = azurerm_virtual_network.main.name
   address_prefixes     = var.subnet_address
 }

# resource "azurerm_subnet" "subnet2" {
#   name                 = "${var.vnet}-${var.subnet[1]}"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.0.2.0/24"]
# }


resource "azurerm_network_interface" "main" {
  name                = "${local.name_prefix}-${var.nic}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

  resource "azurerm_public_ip" "pip" {
  name                = "${var.vnet}-${var.pip}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

//NSG

resource "azurerm_network_security_group" "example" {
  name                = "${local.name_prefix}-${var.NSG}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${local.name_prefix}-${var.vmname}"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

 

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-DataCenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_windows_config {
    #disable_password_authentication = false
  }
  tags = var.tagging
  }


