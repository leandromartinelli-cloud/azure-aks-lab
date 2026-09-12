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

variable "aks_cluster_name" {
  description = "Name of the Azure Kubernetes Service cluster."
  type        = string
  default     = "aks-akslab-lab-brazilsouth-001"
}

variable "aks_dns_prefix" {
  description = "DNS prefix used by the AKS cluster."
  type        = string
  default     = "akslab"
}

variable "aks_kubernetes_version" {
  description = "Kubernetes version used by the AKS cluster. Null uses the default version supported by Azure."
  type        = string
  default     = null
}

variable "aks_system_node_pool_vm_size" {
  description = "VM size used by the AKS system node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "aks_system_node_pool_count" {
  description = "Initial number of nodes in the AKS system node pool."
  type        = number
  default     = 1

  validation {
    condition     = var.aks_system_node_pool_count >= 1
    error_message = "The AKS system node pool must contain at least one node."
  }
}

variable "aks_user_node_pool_name" {
  description = "Name of the AKS user node pool."
  type        = string
  default     = "user"
}

variable "aks_user_node_pool_vm_size" {
  description = "VM size used by the AKS user node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "aks_user_node_pool_count" {
  description = "Initial number of nodes in the AKS user node pool."
  type        = number
  default     = 1

  validation {
    condition     = var.aks_user_node_pool_count >= 1
    error_message = "The AKS user node pool must contain at least one node."
  }
}

variable "tenant_id" {
  description = "Microsoft Entra ID tenant ID used by the AKS cluster."
  type        = string
  default     = null
}

variable "aks_admin_group_object_ids" {
  description = "Microsoft Entra ID group object IDs that will have administrative access to the AKS cluster."
  type        = list(string)
  default     = []
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
