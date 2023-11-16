# providers.tf

# Fournisseur Azure
provider "azurerm" {
  features = {}
  
  # Spécifiez les informations d'authentification Azure
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
}

# Fournisseur Random
provider "random" {
  # Utilisez la seed définie dans les variables
  seed = var.random_seed
}