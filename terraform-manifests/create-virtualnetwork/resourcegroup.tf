# Create custom name for resource group
resource "azurecaf_name" "custom_rg_name" {
    name = "testrg"
    resource_type = "azurerm_resource_group"
    prefixes = [ "adv" ]
    suffixes = [ "01" ]
    clean_input = true
    random_length = 0
}

resource "azurerm_resource_group" "myrg1" {
  name = azurecaf_name.custom_rg_name.result
  location = "EastUS"
  tags = {
    "Owner" = "Jagadish"
  }
}