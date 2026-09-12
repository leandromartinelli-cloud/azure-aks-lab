output "resource_group_name" {
  description = "Name of the Resource Group created for the AKS lab."
  value       = azurerm_resource_group.aks_lab.name
}

output "resource_group_id" {
  description = "Resource ID of the Resource Group."
  value       = azurerm_resource_group.aks_lab.id
}

output "vnet_name" {
  description = "Name of the Virtual Network."
  value       = azurerm_virtual_network.aks_lab.name
}

output "vnet_id" {
  description = "Resource ID of the Virtual Network."
  value       = azurerm_virtual_network.aks_lab.id
}

output "aks_subnet_name" {
  description = "Name of the subnet dedicated to AKS."
  value       = azurerm_subnet.aks.name
}

output "aks_subnet_id" {
  description = "Resource ID of the subnet dedicated to AKS."
  value       = azurerm_subnet.aks.id
}
