# Terraform Bootstrap - Remote State

This directory contains the Terraform configuration responsible for provisioning the Azure resources required to store the remote Terraform state for the Azure AKS Lab.

## Purpose

The bootstrap configuration creates the backend infrastructure before the main AKS infrastructure is deployed.

Terraform cannot use an Azure Storage backend before that Storage Account exists. For this reason, the backend resources are provisioned separately through this bootstrap configuration.

## Architecture

The bootstrap configuration provisions:

- Azure Resource Group
- Azure Storage Account
- Azure Blob Container
- Blob versioning
- Private container access
- TLS 1.2 minimum version

High-level architecture:

```text
Azure Subscription
       │
       ▼
Resource Group
rg-tfstate-akslab-lab-brazilsouth-001
       │
       ▼
Storage Account
sttfstateakslab001
       │
       ▼
Blob Container
tfstate
       │
       ▼
Terraform State
aks-lab.tfstate
```

## Files

```text
bootstrap/
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── README.md
```

### providers.tf

Defines the Terraform and AzureRM provider requirements.

### variables.tf

Defines the configuration variables used by the bootstrap infrastructure.

### main.tf

Creates the Azure resources required for the Terraform remote backend.

### outputs.tf

Returns the Resource Group, Storage Account and Blob Container information required by the main Terraform configuration.

## Resources

The following Azure resources are created:

### Resource Group

Default name:

```text
rg-tfstate-akslab-lab-brazilsouth-001
```

Default region:

```text
Brazil South
```

### Storage Account

Default name:

```text
sttfstateakslab001
```

The Storage Account uses:

- Standard performance tier
- Locally Redundant Storage (LRS)
- TLS 1.2 minimum version
- Blob versioning enabled
- Public nested items disabled

> The Storage Account name must be globally unique in Azure. If the default name is already in use, change `storage_account_name` before deployment.

### Blob Container

Default container:

```text
tfstate
```

Container access is configured as private.

## Prerequisites

Before deploying the bootstrap configuration, ensure that the following tools are installed:

- Terraform
- Azure CLI
- Git

An Azure subscription and sufficient permissions to create Resource Groups and Storage Accounts are also required.

## Authentication

Authenticate with Azure:

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

## Initialize

Navigate to the bootstrap directory:

```bash
cd bootstrap
```

Initialize Terraform:

```bash
terraform init
```

## Format

```bash
terraform fmt -recursive
```

## Validate

```bash
terraform validate
```

## Plan

Review the resources that Terraform intends to create:

```bash
terraform plan
```

## Apply

Provision the remote state infrastructure:

```bash
terraform apply
```

Review the execution plan before confirming the deployment.

## Outputs

After deployment, Terraform returns information similar to:

```text
resource_group_name
storage_account_name
storage_container_name
storage_account_id
```

These values are used when configuring the AzureRM backend for the main Terraform infrastructure.

## Main Terraform Backend

After the bootstrap infrastructure exists, the main Terraform configuration can use an AzureRM backend similar to:

```hcl
terraform {
  backend "azurerm" {}
}
```

Backend parameters can then be supplied during initialization:

```bash
terraform init \
  -backend-config="resource_group_name=rg-tfstate-akslab-lab-brazilsouth-001" \
  -backend-config="storage_account_name=sttfstateakslab001" \
  -backend-config="container_name=tfstate" \
  -backend-config="key=aks-lab.tfstate"
```

This keeps environment-specific backend configuration outside the Terraform source code.

## Security

Do not commit:

- Azure credentials
- Client secrets
- Access tokens
- Storage Account keys
- Terraform state files
- Sensitive variable files

Terraform state may contain sensitive infrastructure information and should not be stored directly in Git.

## CI Validation

GitHub Actions validates both Terraform configurations:

```text
terraform/
bootstrap/
```

The validation workflow executes:

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
```

This validates Terraform syntax, formatting and provider configuration before infrastructure changes are deployed.

## Deployment Flow

The expected deployment sequence is:

```text
1. Bootstrap
      │
      ▼
2. Azure Storage Backend
      │
      ▼
3. Configure Terraform Remote State
      │
      ▼
4. Terraform Plan
      │
      ▼
5. Terraform Apply
      │
      ▼
6. AKS Infrastructure
```

## Destroy

The bootstrap infrastructure should normally be the last component removed because it contains the Terraform state used to manage the main environment.

Before destroying the backend, ensure that the main infrastructure has already been destroyed or that the Terraform state has been safely migrated or backed up.

## Next Steps

After the bootstrap infrastructure is deployed:

- Configure the AzureRM remote backend
- Migrate Terraform state to Azure Storage
- Configure GitHub Actions authentication with Azure using OIDC
- Add Terraform Plan workflow
- Add controlled Terraform Apply workflow
- Implement branch protection and pull request validation
