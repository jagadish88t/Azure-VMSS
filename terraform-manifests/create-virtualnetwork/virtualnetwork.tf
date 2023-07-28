# Create custom name
# Create custom name for resource group
resource "azurecaf_name" "custom_vnet_name" {
    name = "vnet"
    resource_type = "azurerm_virtual_network"
    prefixes = [ "adv" ]
    suffixes = [ "01" ]
    clean_input = true
    random_length = 0
}


# Create Virtual network
resource "azurerm_virtual_network" "myvnet" {
  name = azurecaf_name.custom_vnet_name.result
  location = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  subnet {
    name = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
  subnet {
    name = "subnet2"
    address_prefix = "10.0.2.0/24"
  }
  address_space = [ "10.0.0.0/16" ]
  tags = {
    "Owner" = "Jagadish"
  }
}

resource "azurerm_subnet" "mysubnet" {
  address_prefixes = [ "10.0.3.0/24" ]
  name = "subnet3"
  resource_group_name = azurerm_resource_group.myrg1.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
}