# Create RG in East US with Default Provider
resource "azurerm_resource_group" "myrg1" {
  name     = "mytestrg1"
  location = "East US"
}

# Create RG in East US with "provider2-westus" provider which has customized features
resource "azurerm_resource_group" "myrg2" {
  name     = "mytestrg2"
  location = "West US"
  provider = azurerm.provider2-westus
}

resource "random_string" "myrandomstring" {
  length  = 16
  special = false
  upper   = false
}

resource "azurerm_storage_account" "mystorageaccount" {
  name                              = "mystg${random_string.myrandomstring.id}"
  location                          = azurerm_resource_group.myrg1.location
  resource_group_name               = azurerm_resource_group.myrg1.name
  account_tier                      = "Standard"
  account_replication_type          = "GRS"
  infrastructure_encryption_enabled = true
}

resource "azurerm_storage_encryption_scope" "mystorageencrption" {
  name               = "microsoftmanaged"
  storage_account_id = azurerm_storage_account.mystorageaccount.id
  source             = "Microsoft.Storage"
}