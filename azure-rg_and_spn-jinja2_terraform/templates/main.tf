resource "azurerm_resource_group" "current" {
    name = var.rg_name
    location = var.location
}
