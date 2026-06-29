# Installation and Deployment Runbook

## Purpose

This document describes the steps required to deploy and remove the Azure Databricks infrastructure using Terraform.

---

# Prerequisites

Before starting, verify the following requirements:

- Azure Subscription
- Contributor permissions on the target subscription
- Terraform v1.13.x or later
- Azure CLI installed

Verify installed versions.

```bash
terraform -version

az version
```

---

# Repository Structure

Navigate to the Terraform project directory.

```bash
cd terraform
```

---

# Authentication

Authenticate against Azure.

```bash
az login
```

Verify the active subscription.

```bash
az account show
```

If necessary, change the subscription.

```bash
az account set --subscription "<subscription-id>"
```

---

# Configuration

Copy the example variables file.

```bash
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
```

Update the required values according to your Azure environment.

Example:

- Subscription ID
- Location
- Resource Group Name
- Virtual Network Name
- Azure Databricks Workspace Name

---

# Initialize Terraform

Initialize the Terraform working directory.

```bash
terraform init
```

---

# Validate Configuration

Validate the Terraform configuration.

```bash
terraform validate
```

Optionally format all Terraform files.

```bash
terraform fmt -recursive
```

---

# Review Execution Plan

Generate the deployment plan.

```bash
terraform plan \
-var-file=environments/dev/terraform.tfvars
```

Review the resources that will be created before deployment.

---

# Deploy Infrastructure

Deploy the infrastructure.

```bash
terraform apply \
-var-file=environments/dev/terraform.tfvars
```

Confirm the execution by typing:

```text
yes
```

---

# Validate Deployment

After the deployment completes successfully, verify the following resources in the Azure Portal:

- Resource Group
- Virtual Network
- Public Subnet
- Private Subnet
- Private Endpoint Subnet
- Network Security Group
- Azure Databricks Premium Workspace
- Front-End Private Endpoint
- Browser Authentication Private Endpoint
- Private DNS Zone

You can also review the Terraform outputs.

```bash
terraform output
```

---

# Destroy Infrastructure

To remove all deployed resources.

```bash
terraform destroy \
-var-file=environments/dev/terraform.tfvars
```

Confirm the execution.

```text
yes
```

---

# Troubleshooting

If Terraform reports configuration issues, execute:

```bash
terraform validate
```

To verify the current infrastructure state.

```bash
terraform state list
```

To verify planned changes.

```bash
terraform plan \
-var-file=environments/dev/terraform.tfvars
```

---

# Deployment Outcome

At the end of the deployment, the following components are provisioned:

- Azure Databricks Premium Workspace
- Secure Cluster Connectivity (No Public IP)
- Virtual Network Injection
- Network Security Group
- Front-End Private Endpoint
- Browser Authentication Private Endpoint
- Private DNS Zone
- Private DNS Zone Virtual Network Link
