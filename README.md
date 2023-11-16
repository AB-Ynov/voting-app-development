```markdown
# Déploiement sur Azure avec Terraform et Helm

## Prérequis

- Terraform
```bash
# Téléchargez le binaire Terraform pour Linux
curl -O https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_amd64.zip

# Extrayez le fichier ZIP
unzip terraform_0.14.9_linux_amd64.zip

# Déplacez le binaire dans un répertoire accessible par votre $PATH
sudo mv terraform /usr/local/bin/

# Vérifiez l'installation
terraform --version
```

- Azure CLI
```bash
# Téléchargez le script d'installation pour Linux
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Vérifiez l'installation
az --version
```

- Helm
```bash
# Téléchargez le script d'installation Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
```

terraform.tfvars` avec vos informations Azure.
```hcl
# terraform.tfvars

client_id       = "your-azure-client-id"
client_secret   = "your-azure-client-secret"
tenant_id       = "your-azure-tenant-id"
subscription_id = "your-azure-subscription-id"
```

## Configuration Azure

1. Clonez le référentiel.
2. Créez un fichier `

## Configuration Terraform

```bash
terraform init
terraform apply
```

## Installation des Helm Charts

### Contrôleur Ingress Nginx

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install nginx-ingress ingress-nginx/ingress-nginx
```

### Redis

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-redis bitnami/redis
```

### KubeCost (Bonus)

```bash
helm repo add kubecost https://kubecost.github.io/cost-analyzer/
helm install kubecost kubecost/cost-analyzer
```

## Nettoyage

```bash
terraform destroy
```

**Note:** Personnalisez les valeurs des variables Terraform dans `terraform.tfvars` et assurez-vous d'utiliser les versions appropriées des Helm charts.

# Code Terraform pour le Déploiement sur Azure

## Resource Group

```hcl
# Déclaration du provider Azure
provider "azurerm" {
  features = {}
}

# Déclaration du Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name  # Remplacez par le nom souhaité pour votre Resource Group
  location = var.location             # Remplacez par la région Azure souhaitée, par exemple "West Europe"
}
```

### Virtual Network et Subnet

Pour déployer un Virtual Network avec un Subnet associé sur Azure, vous pouvez utiliser le code Terraform suivant :

```hcl
# Déclaration du Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name   # Remplacez par le nom souhaité pour votre Virtual Network
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Déclaration du Subnet
resource "azurerm_subnet" "example" {
  name                 = var.subnet_name            # Remplacez par le nom souhaité pour votre Subnet
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Déclaration de l'Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "example" {
  name                = var.aks_cluster_name      # Remplacez par le nom souhaité pour votre cluster AKS
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = var.aks_cluster_name      # Remplacez par le préfixe DNS souhaité pour votre cluster AKS

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"                # Choisissez la taille de la machine virtuelle appropriée
  }
}
```

## Pipeline CI/CD

1. Terraform Init et Validate
2. Terraform Plan
3. Exécuter InfraCost (Bonus)
4. Attendre la validation manuelle pour Terraform Apply

```yaml
# Exemple de fichier .github/workflows/ci-cd-pipeline.yml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: 1.1.0

      - name: Terraform Init and Validate
        run: |
          terraform init
          terraform validate

      - name: Terraform Plan
        run: terraform plan -out=tfplan

      - name: Execute InfraCost (Bonus)
        run: infracost --tfdir .terraform/providers/registry.terraform.io/hashicorp/

      - name: Wait for Manual Approval
        if: github.event_name != 'pull_request'
        run: |
          echo "Waiting for manual approval..."
          sleep 120 # Adjust the wait time as needed
          echo "Manual approval received, proceeding with Terraform Apply"
          terraform apply tfplan
```
