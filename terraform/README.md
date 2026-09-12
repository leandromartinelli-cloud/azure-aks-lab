# Terraform - Azure AKS Lab

This directory contains the Terraform configuration used to provision the Azure infrastructure for the Azure AKS Lab.

## Architecture

The current Terraform configuration provisions the following components:

- Azure Resource Group
- Azure Virtual Network
- Dedicated AKS Subnet
- Azure Container Registry (ACR)
- Azure Kubernetes Service (AKS)
- AKS System Node Pool
- AKS User Node Pool
- AKS Cluster Autoscaler
- System-assigned Managed Identity
- ACR Pull authorization for the AKS kubelet identity

## Prerequisites

Before running this Terraform configuration, ensure that the following tools are installed:

- Terraform
- Azure CLI
- Git

You also need an Azure subscription and sufficient permissions to create the required resources.

## Authentication

Authenticate to Azure using the Azure CLI:

```bash
az login
```

Verify the active subscription:

```bash
az account show
```

If necessary, select the appropriate subscription:

```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

## Configuration

Copy the example variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Review and customize the values inside `terraform.tfvars`.

Do not commit environment-specific or sensitive values to the repository.

## Initialize Terraform

```bash
terraform init
```

## Format

Format the Terraform configuration:

```bash
terraform fmt -recursive
```

## Validate

Validate the Terraform configuration:

```bash
terraform validate
```

## Plan

Review the infrastructure changes before deployment:

```bash
terraform plan
```

Or explicitly use the variables file:

```bash
terraform plan -var-file="terraform.tfvars"
```

## Apply

Deploy the infrastructure:

```bash
terraform apply
```

Review the execution plan carefully before confirming the deployment.

## Destroy

To remove the lab infrastructure:

```bash
terraform destroy
```

Use this command carefully.

## CI Validation

GitHub Actions automatically validates Terraform changes when Terraform files or the validation workflow are modified.

The pipeline executes:

```text
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
```

This ensures that committed Terraform code follows the expected formatting and passes Terraform validation.

## Current Structure

```text
terraform/
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
├── terraform.tfvars.example
└── README.md
```

## Security

This repository must not contain:

- Azure credentials
- Client secrets
- Access tokens
- Private keys
- Production configuration values
- Sensitive Terraform variable files

Environment-specific `terraform.tfvars` files should remain outside version control.

## Next Steps

Planned improvements include:

- Remote Terraform state
- Azure Storage backend
- GitHub Actions authentication with Azure using OIDC
- Terraform Plan workflow
- Terraform Apply workflow
- Microsoft Entra ID integration
- Azure RBAC improvements
- Azure Monitor integration
- Log Analytics Workspace
- Kubernetes workloads
- Network security improvements
