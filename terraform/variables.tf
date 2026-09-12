variable "location" {
  description = "Azure region where the resources will be deployed."
  type        = string
  default     = "Brazil South"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "lab"
}

variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
  default     = "akslab"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
  default     = "rg-akslab-lab-brazilsouth-001"
}

variable "vnet_name" {
  description = "Name of the Azure Virtual Network."
  type        = string
  default     = "vnet-akslab-lab-brazilsouth-001"
}

variable "vnet_address_space" {
  description = "Address space assigned to the Azure Virtual Network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "aks_subnet_name" {
  description = "Name of the subnet dedicated to Azure Kubernetes Service."
  type        = string
  default     = "snet-aks-001"
}

variable "aks_subnet_address_prefixes" {
  description = "Address prefixes assigned to the AKS subnet."
  type        = list(string)
  default     = ["10.10.0.0/22"]
}

variable "acr_name" {
  description = "Name of the Azure Container Registry."
  type        = string
  default     = "acrakslablab001"
}

variable "acr_sku" {
  description = "SKU of the Azure Container Registry."
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.acr_sku)
    error_message = "The ACR SKU must be Basic, Standard, or Premium."
  }
}

variable "tags" {
  description = "Common tags applied to Azure resources."
  type        = map(string)

  default = {
    Environment = "Lab"
    Project     = "Azure AKS Lab"
    ManagedBy   = "Terraform"
    Repository  = "azure-aks-lab"
  }
}
