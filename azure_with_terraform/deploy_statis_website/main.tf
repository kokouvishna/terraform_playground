terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.5.0"
    }
  }
}

# create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location_name
}

# create a storage account
resource "azurerm_storage_account" "storage_account" {
  name                     = "mekoarstorage"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}

# create a blobstorage (within the storage container $web)
# add a index.html file
resource "azurerm_storage_blob" "blob" {
  name                   = var.html_file # "index.html"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = var.container_name # azurerm_storage_container.storage_container.name # "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = var.html_file
}