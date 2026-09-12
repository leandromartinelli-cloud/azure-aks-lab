output "resource_group_name" {
  description = "Name of the Resource Group used for Terraform remote state."
  value       = azurerm_resource_group.tfstate.name
}

output "storage_account_name" {
  description = "Name of the Storage Account used for Terraform remote state."
  value       = azurerm_storage_account.tfstate.name
}

output "storage_container_name" {
  description = "Name of the Blob container used for Terraform remote state."
  value       = azurerm_storage_container.tfstate.name
}

output "storage_account_id" {
  description = "Resource ID of the Storage Account used for Terraform remote state."
  value       = azurerm_storage_account.tfstate.id
}
