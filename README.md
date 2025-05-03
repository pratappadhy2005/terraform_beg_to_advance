# Terraform Setup: Beginner to Advanced

This repository provides a Terraform-based approach to provisioning infrastructure, ranging from initial setup to advanced usage with modules, remote state, and CI/CD.

## 🔧 Usage Guide

### 1. Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) v1.0+
- Cloud CLI (e.g., AWS CLI, Azure CLI)
- Configured credentials (e.g., `~/.aws/credentials`)

### 2. Basic Workflow
```bash
terraform init          # Initialize working directory
terraform validate      # Validate configuration
terraform plan          # Review execution plan
terraform apply         # Apply infrastructure changes
terraform destroy       # Tear down resources
