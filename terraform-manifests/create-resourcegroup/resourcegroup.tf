resource "azurerm_resource_group" "terraform_test" {
  name = "terraform_test1"
  location = "EastUS"
  tags = {
    "Owner" = "Jagadish"
  }
}