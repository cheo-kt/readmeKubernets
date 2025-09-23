terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0" # puedes ajustarlo según la versión que tengas
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6410cf32-59bb-46b6-b0d5-f25b6725d9d5"
}

# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = "aks_sergioflorez_resource_group_plataformas"
  location = "East US"
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myAKSCluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "myakscluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  # Habilitamos RBAC
  role_based_access_control_enabled = true
}

