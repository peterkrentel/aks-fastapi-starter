output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}
