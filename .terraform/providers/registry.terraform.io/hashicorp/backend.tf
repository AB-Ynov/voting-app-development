# backend.tf

# Configuration des backends (à adapter en fonction de votre environnement)
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
