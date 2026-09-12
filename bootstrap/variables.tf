variable "location" {
  description = "Azure region where the Terraform backend resources will be deployed."
  type        = string
  default     = "Brazil South"
}

variable "resource_group_name" {
  description = "Name of the Resource Group used for the Terraform backend."
  type        = string
  default     = "rg-tfstate-akslab-lab-brazilsouth-001"
}

variable "storage_account_name" {
  description = "Globally unique name of the Azure Storage Account used for Terraform remote state."
  type        = string
  default     = "sttfstateakslm001"
}

variable "storage_container_name" {
  description = "Name of the Blob container used to store Terraform state files."
  type        = string
  default     = "tfstate"
}

variable "tags" {
  description = "Common tags applied to the Terraform backend resources."
  type        = map(string)

  default = {
    Environment = "Lab"
    Project     = "Azure AKS Lab"
    Purpose     = "Terraform Remote State"
    ManagedBy   = "Terraform"
    Repository  = "azure-aks-lab"
  }
}
