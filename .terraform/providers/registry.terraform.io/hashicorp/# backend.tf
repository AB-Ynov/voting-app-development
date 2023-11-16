# backend.tf

# Configuration des backends (à adapter en fonction de votre environnement)
backend "azurerm" {
  resource_group_name   = "your-resource-group-name"
  storage_account_name  = "your-storage-account-name"
  container_name        = "your-container-name"
  key                   = "path/to/your/terraform.tfstate"
}
