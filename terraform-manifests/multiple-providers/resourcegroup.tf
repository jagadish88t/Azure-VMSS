# Create RG in East US with Default Provider
resource "azurerm_resource_group" "myrg1" {
  name = "myrg1"
  location = "East US"
}

# Create RG in East US with "provider2-westus" provider which has customized features
resource "azurerm_resource_group" "myrg2" {
  name = "myrg2"
  location = "West US"
  provider = azurerm.provider2-westus
}