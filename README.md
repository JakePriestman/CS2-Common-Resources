# 🏗️ CS2-Common-Resources

![GitHub last commit](https://img.shields.io/github/last-commit/JakePriestman/CS2-Common-Resources)
![GitHub license](https://img.shields.io/github/license/JakePriestman/CS2-Common-Resources)
![GitHub issues](https://img.shields.io/github/issues/JakePriestman/CS2-Common-Resources)
![GitHub pull requests](https://img.shields.io/github/issues-pr/JakePriestman/CS2-Common-Resources)
![Azure](https://img.shields.io/badge/Provisioned%20via-Azure%20Bicep-blue?logo=microsoftazure)

> Centralized Azure infrastructure for my CS2 projects — shared, consistent, and fully automated.

---

## 🧠 Overview

**CS2-Common-Resources** contains the **shared Azure infrastructure** used by my other two repositories:

- 🌱 [PickemsPlanter](https://github.com/JakePriestman/PickemsPlanter) — Razor Pages web app for CS2 Pick’Ems  
- 🌾 [CS2SeedLoader](https://github.com/JakePriestman/CS2SeedLoader) — backend service for tournament data ingestion

This repo provides a **single source of truth** for all common cloud resources, ensuring both applications run on a stable, secure, and consistent foundation.

---

## 🧰 Infrastructure Stack

| Resource | Purpose |
|----------|----------|
| **Azure Key Vault** | Secure storage for secrets, API keys, and app credentials |
| **App Service Plan** | Shared compute layer for hosting both applications |
| **Storage Account** | Central storage for blobs and tables |
| **Blob Containers** | Used for storing CS2-related assets and data |
| **Table Storage** | Lightweight structured storage for app data |
| **Bicep Modules** | Declarative IaC for reproducible deployments |

---

## 🗂️ Repository Structure
```
CS2-Common-Resources/
│             
├── infrastructure/
│   ├── deploy.bicep
│   └── parameters.json
├── LICENSE
└── README.md
```
---

## ⚙️ Deployment

### Prerequisites
- Azure CLI  
- Azure subscription access  
- Git  

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/JakePriestman/CS2-Common-Resources.git
   cd CS2-Common-Resources
   
2. **Login to Azure**
   ```bash
   az login
   
3. Deploy the infrastructure
   ```bash
   az deployment sub create \
    --location westeurope \
    --template-file deploy.bicep
---

🔗 Integration With Other Repos

Both dependent projects reference the resources created here:
- [PickemsPlanter](https://github.com/JakePriestman/PickemsPlanter) uses the App Service Plan, Key Vault, and Storage Account for hosting and data storage.
- [CS2SeedLoader](https://github.com/JakePriestman/Cs2SeedLoader) uses the same shared infrastructure for ingestion, processing, and storage.

This ensures:
- Consistent configuration
- Reduced duplication
- Easier maintenance
- Lower Azure cost footprint
    
---
🧩 Features  
- 🏗️ Fully automated Azure infrastructure using Bicep
- 🔐 Secure secret management via Key Vault
- 📦 Shared storage for CS2 data ingestion and web app usage
- 🔄 Reusable modules for clean, maintainable IaC
- ☁️ Designed to support multiple dependent applications  
    
---

📝 License
This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
