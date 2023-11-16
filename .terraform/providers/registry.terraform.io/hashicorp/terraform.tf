# terraform.tf

# Déclaration de la version Terraform requise
terraform {
  required_version = ">= 0.13, < 0.14"

  # Configuration des backends (à adapter en fonction de votre environnement)
  backend "azurerm" {
    resource_group_name   = "your-resource-group-name"
    storage_account_name  = "your-storage-account-name"
    container_name        = "your-container-name"
    key                   = "path/to/your/terraform.tfstate"
  }
}

# Spécification des fournisseurs Terraform et de leurs versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
