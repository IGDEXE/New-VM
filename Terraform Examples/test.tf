# Link de referencia:
# https://docs.microsoft.com/pt-br/azure/virtual-machines/linux/terraform-install-configure

provider "azurerm" {
}

resource "azurerm_resource_group" "rg" {
    name     = "testResourceGroup"
    location = "westus"
}