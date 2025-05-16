terraform {
  backend "azurerm" {
    resource_group_name  = "fastapi-rg"
    storage_account_name = "aksgithubtf"
    container_name       = "terraform-state"
    key                 = "terraform.tfstate"
    use_cli_auth = false   # Explicitly disables CLI authentication
    use_msi = false      # Explicitly disables Managed Service Identity authentication
    use_oidc  = false     # Explicitly disables OIDC authentication
  }
}

provider "azurerm" {
  features {}
    subscription_id = var.subscription_id
    #client_id       = var.client_id
    #client_secret   = var.client_secret
    tenant_id       = var.tenant_id

}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
  #tags     = local.default_tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = "system"
    vm_size             = var.node_vm_size
    auto_scaling_enabled = true
    min_count           = var.min_node_count
    max_count           = var.max_node_count
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  #tags = local.default_tags
}
