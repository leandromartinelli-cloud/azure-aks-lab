# AKS Architecture V1

This document describes the initial architecture for the Azure Kubernetes Service (AKS) lab.

## Region

- Azure Region: Brazil South

## High-Level Architecture

```text
                        Microsoft Entra ID
                               │
                               │ Authentication
                               ▼
GitHub ── GitHub Actions ──► Azure
                               │
                         Resource Group
                               │
                  ┌────────────┴────────────┐
                  │                         │
                 VNet                     ACR
                  │                         │
             AKS Subnet ◄──────────────────┘
                  │
                  ▼
             AKS Cluster
          ┌───────┴────────┐
          │                │
     System Pool      User Pool
          │                │
          └───────┬────────┘
                  │
             Workloads
                  │
        ┌─────────┴─────────┐
        │                   │
 Azure Monitor        Log Analytics
