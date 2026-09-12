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

output "acr_name" {
  description = "Name of the Azure Container Registry."
  value       = azurerm_container_registry.acr.name
}

output "acr_id" {
  description = "Resource ID of the Azure Container Registry."
  value       = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  description = "Login server of the Azure Container Registry."
  value       = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  description = "Name of the Azure Kubernetes Service cluster."
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_id" {
  description = "Resource ID of the Azure Kubernetes Service cluster."
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_node_resource_group" {
  description = "Name of the Azure-managed Resource Group used by AKS."
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "aks_kubelet_identity_object_id" {
  description = "Object ID of the managed identity used by the AKS kubelet."
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "aks_user_node_pool_id" {
  description = "Resource ID of the AKS user node pool."
  value       = azurerm_kubernetes_cluster_node_pool.user.id
}
