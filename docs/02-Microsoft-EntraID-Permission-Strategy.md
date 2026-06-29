# Microsoft Entra ID Permission Strategy

## Purpose

This document defines the access strategy for Azure Databricks based on Microsoft Entra ID security groups.

The proposed model follows the Principle of Least Privilege, assigning only the permissions required for each role to perform its responsibilities within the analytics platform.

---

# Microsoft Entra ID Security Groups

The following Microsoft Entra ID security groups are proposed.

| Microsoft Entra ID Group | Assigned Role |
|---------------------------|---------------|
| DBX-Cloud-Engineers | Cloud Engineer |
| DBX-Data-Architects | Data Architect |
| DBX-Data-Engineers | Data Engineer |
| DBX-Data-Quality | Data Quality |

These groups are synchronized with Azure Databricks to manage access to the workspace and its components.

---

# Workspace Entitlements

Workspace Entitlements define the capabilities available to each role within the Azure Databricks Workspace.

| Workspace Entitlement | Cloud Engineer | Data Architect | Data Engineer | Data Quality |
|------------------------|:--------------:|:--------------:|:-------------:|:------------:|
| Workspace Access | yes | yes | yes | yes |
| Consumer Access | yes | yes | yes | yes |
| Databricks SQL Access | yes | yes | yes | yes |
| Unrestricted Cluster Creation | yes | No | No | No |
| Allow Instance Pool Creation | yes | No | No | No |
| Admin Access | yes | No | No | No |

---

# Azure Databricks Component Access Matrix

After a user has access to the Azure Databricks Workspace, permissions are assigned over the different Databricks components according to each role.

| Azure Databricks Component | Cloud Engineer | Data Architect | Data Engineer | Data Quality |
|----------------------------|:--------------:|:--------------:|:-------------:|:------------:|
| Workspace | Administration | Administration | Access | Access |
| Compute | Manage | Manage | Use | View |
| Jobs & Pipelines | Manage | Manage | Create / Execute | View |
| SQL Warehouses | Manage | Use | Use | Use |
| Unity Catalog | Manage | Manage | Read / Write | Read |
| Catalogs & Schemas | Manage | Manage | Read / Write | Read |
| Notebooks | Manage | Manage | Edit | View |
| Repositories | Manage | Manage | Edit | View |

---

# Access Model

The proposed authentication and authorization model follows Microsoft Entra ID group-based access management.

```text
Microsoft Entra ID
        │
        ▼
Security Groups
        │
        ▼
Azure Databricks Workspace
        │
        ├── Workspace Entitlements
        ├── Compute
        ├── Jobs & Pipelines
        ├── SQL Warehouses
        ├── Unity Catalog
        ├── Catalogs & Schemas
        ├── Notebooks
        └── Repositories
```

---

# Role Summary

| Role | Primary Responsibility |
|------|-------------------------|
| Cloud Engineer | Platform administration, infrastructure management and operational support. |
| Data Architect | Data platform design, governance and metadata management. |
| Data Engineer | Development and execution of data pipelines, notebooks and workloads. |
| Data Quality | Data validation, monitoring and quality verification activities. |

---
