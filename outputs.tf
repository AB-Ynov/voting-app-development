# outputs.tf

# Exemple de sortie avec une valeur spécifique
output "example_output" {
  value = "Ceci est une valeur de sortie d'exemple."
}

# Exemple de sortie liée à une ressource Azure créée
output "vm_public_ip" {
  description = "Adresse IP publique de la machine virtuelle"
  value       = azurerm_virtual_machine.example.public_ip_address
}