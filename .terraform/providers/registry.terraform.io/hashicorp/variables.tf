variable "subscription_id" {
  description = "ID de l'abonnement Azure"
  type        = string
}

variable "location" {
  description = "Emplacement pour les ressources Azure"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  type        = string
}

variable "virtual_network_name" {
  description = "Nom du réseau virtuel Azure"
  type        = string
}

variable "subnet_name" {
  description = "Nom du sous-réseau Azure"
  type        = string
}

variable "aks_cluster_name" {
  description = "Nom du cluster Azure Kubernetes Service (AKS)"
  type        = string
}
