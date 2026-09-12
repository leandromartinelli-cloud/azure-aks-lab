# Azure AKS Lab

Production-oriented Azure Kubernetes Service (AKS) architecture built with Terraform and Azure cloud-native services.

The goal of this project is to demonstrate how to design and automate a secure, scalable and maintainable AKS environment using Infrastructure as Code and cloud architecture best practices.

## 🎯 Project Goals

- Provision Azure infrastructure using Terraform
- Deploy an Azure Kubernetes Service (AKS) cluster
- Implement a dedicated Virtual Network and subnets
- Integrate AKS with Microsoft Entra ID
- Apply Azure RBAC and Kubernetes authorization concepts
- Implement secure networking
- Deploy containerized workloads
- Implement monitoring and observability
- Document architecture decisions and troubleshooting scenarios

## 🏗️ Architecture

The environment will evolve through multiple stages:

```text
Azure Subscription
        │
        ▼
Resource Group
        │
        ▼
Virtual Network
        │
        ▼
AKS Subnet
        │
        ▼
Azure Kubernetes Service
        │
        ▼
Node Pools
        │
        ▼
Kubernetes Workloads
```

Additional components will be introduced as the project evolves, including:

- Azure Container Registry (ACR)
- Azure Monitor
- Log Analytics Workspace
- Managed Identities
- Azure RBAC
- Network Security
- Private connectivity

A detailed architecture diagram and design decisions will be maintained in the `architecture/` directory.

## 🛠️ Technologies

| Technology | Purpose |
|---|---|
| Microsoft Azure | Cloud platform |
| Azure Kubernetes Service (AKS) | Managed Kubernetes platform |
| Terraform | Infrastructure as Code |
| Kubernetes | Container orchestration |
| Microsoft Entra ID | Identity and authentication |
| Azure RBAC | Authorization |
| Azure Container Registry | Container image registry |
| Azure Monitor | Monitoring and observability |
| Log Analytics Workspace | Centralized logging |
| GitHub | Source control |
| GitHub Actions | CI/CD automation |

## 📂 Repository Structure

```text
azure-aks-lab/
├── architecture/
│   └── architecture.md
│
├── docs/
│   ├── deployment.md
│   ├── security.md
│   └── troubleshooting.md
│
├── kubernetes/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
│
├── terraform/
│   ├── providers.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── outputs.tf
│   └── terraform.tfvars.example
│
├── .gitignore
├── LICENSE
└── README.md
```

The repository will evolve incrementally as new infrastructure and Kubernetes components are implemented.

## 🔐 Security

Security is treated as a core architecture requirement rather than an additional configuration step.

The project will explore practices including:

- Microsoft Entra ID authentication
- Azure RBAC
- Kubernetes authorization
- Least-privilege access
- Managed identities
- Network segmentation
- Secure access to Azure resources
- Secrets management
- Private connectivity
- Container and workload security

No credentials, passwords, access tokens, Terraform state files or sensitive production information should be committed to this repository.

## 🌐 Networking

The AKS environment will use a dedicated Azure Virtual Network architecture.

The networking design will evolve to demonstrate concepts such as:

- Dedicated AKS subnet
- Azure Virtual Network
- Network segmentation
- Kubernetes networking
- Private connectivity
- Secure outbound connectivity
- Integration with Azure services
- Hybrid connectivity concepts

Detailed networking decisions will be documented as the architecture evolves.

## 🔑 Identity & Access

Identity and authorization will be implemented using Microsoft Entra ID and Azure-native security capabilities.

The project will demonstrate the separation between:

```text
Authentication
      │
      ▼
Microsoft Entra ID
      │
      ▼
Authorization
      │
      ├── Azure RBAC
      │
      └── Kubernetes Authorization
```

This distinction is especially important when troubleshooting AKS access scenarios where authentication succeeds but Kubernetes operations return authorization errors such as:

```text
Error from server (Forbidden)
```

## 📊 Monitoring & Observability

Monitoring will be introduced using Azure-native services.

Planned capabilities include:

- Azure Monitor
- Log Analytics Workspace
- AKS monitoring
- Container insights
- Platform metrics
- Kubernetes logs
- Alerts
- Troubleshooting scenarios

## ⚙️ Infrastructure as Code

Azure infrastructure will be provisioned using Terraform.

The Terraform implementation will follow practices such as:

- Reusable configuration
- Variables for environment-specific values
- Outputs for important resources
- Consistent naming
- Infrastructure version control
- Separation of configuration and sensitive information
- Terraform formatting and validation

Terraform state files and sensitive variable files will not be committed to the repository.

## 🚀 CI/CD

GitHub Actions will be introduced later in the project to automate validation and infrastructure workflows.

Planned pipeline stages include:

```text
Pull Request
     │
     ▼
Terraform Format
     │
     ▼
Terraform Validate
     │
     ▼
Terraform Plan
     │
     ▼
Review
     │
     ▼
Terraform Apply
```

Infrastructure deployment will only be introduced after the architecture and Terraform configuration are validated.

## 🧪 Troubleshooting

One of the objectives of this repository is to document real-world AKS troubleshooting scenarios.

Examples may include:

- Kubernetes `Forbidden` errors
- Azure RBAC configuration
- Kubernetes authorization
- Microsoft Entra ID authentication
- Network connectivity
- DNS resolution
- Container startup issues
- AKS node troubleshooting
- Azure resource permissions

Troubleshooting documentation will be maintained in the `docs/` directory.

## 🗺️ Roadmap

### Phase 1 — Foundation

- [x] Create GitHub repository
- [x] Configure repository documentation
- [ ] Define AKS architecture
- [ ] Create architecture diagram
- [ ] Define Azure naming convention

### Phase 2 — Azure Infrastructure

- [ ] Create Resource Group
- [ ] Create Virtual Network
- [ ] Create AKS subnet
- [ ] Create Log Analytics Workspace
- [ ] Create Azure Container Registry
- [ ] Deploy AKS cluster

### Phase 3 — Identity & Security

- [ ] Integrate AKS with Microsoft Entra ID
- [ ] Configure Azure RBAC
- [ ] Configure managed identities
- [ ] Implement least-privilege access
- [ ] Document authorization model

### Phase 4 — Kubernetes

- [ ] Create namespace
- [ ] Deploy sample workload
- [ ] Create Kubernetes Service
- [ ] Validate application connectivity
- [ ] Document Kubernetes deployment

### Phase 5 — Observability

- [ ] Enable AKS monitoring
- [ ] Integrate Log Analytics
- [ ] Review container logs
- [ ] Review Kubernetes metrics
- [ ] Create monitoring examples

### Phase 6 — DevOps

- [ ] Create GitHub Actions workflow
- [ ] Implement Terraform formatting validation
- [ ] Implement Terraform validation
- [ ] Implement Terraform plan
- [ ] Evaluate automated deployment workflow

## 📚 Documentation

As the project evolves, additional documentation will be available in:

```text
architecture/
docs/
terraform/
kubernetes/
```

The objective is not only to provide working code, but also to document the architectural decisions behind the implementation.

## 👤 Author

**Leandro Martinelli**

Cloud Infrastructure Specialist focused on:

- Microsoft Azure
- Cloud Architecture
- Azure Kubernetes Service (AKS)
- Kubernetes
- Terraform
- DevOps
- Cloud Security
- Hybrid Cloud
- FinOps

This repository is part of my continuous learning and knowledge-sharing journey around Azure Cloud Infrastructure and Architecture.

## 📄 License

This project is licensed under the MIT License.
