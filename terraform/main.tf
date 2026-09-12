resource "azurerm_resource_group" "aks_lab" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "aks_lab" {
  name                = var.vnet_name
  location            = azurerm_resource_group.aks_lab.location
  resource_group_name = azurerm_resource_group.aks_lab.name
  address_space       = var.vnet_address_space

  tags = var.tags
}

resource "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  resource_group_name  = azurerm_resource_group.aks_lab.name
  virtual_network_name = azurerm_virtual_network.aks_lab.name
  address_prefixes     = var.aks_subnet_address_prefixes
}
