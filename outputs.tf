output "kube_admin_config_raw" {
  description = "Kubeconfig (admin) - sensitive"
  value       = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
  sensitive   = true
}

output "kube_config_raw" {
  description = "Kubeconfig (user) - sensitive"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

