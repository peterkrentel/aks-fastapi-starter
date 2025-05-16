#variable "client_id" {
#  description = "Azure Client ID (Service Principal)"
#  default = "value"
#  type        = string
#}

#variable "client_secret" {
#  description = "Azure Client Secret (Service Principal)"
#  type        = string
#  default     = "value"
#}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for AKS"
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster"
  type        = string
  default     = "eastus"
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
  default     = 3
}

variable "node_vm_size" {
  description = "Size of the VMs in the node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
}

variable "min_node_count" {
  description = "Minimum number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes in the node pool"
  type        = number
  default     = 5
}
