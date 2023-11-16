Bien sûr, voici un résumé au format Markdown reflétant les dernières modifications :

```markdown
# Déploiement sur Azure avec Terraform et Helm

## Prérequis

- Terraform
- Azure CLI
- Helm

## Configuration Azure

1. Clonez le référentiel.
2. Créez un fichier `terraform.tfvars` avec vos informations Azure.

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

## Fichiers Terraform Providers Locaux

Les fichiers Terraform providers locaux pour Helm et Local ont été ajoutés.

Consultez la documentation officielle pour des détails spécifiques et des mises à jour.
