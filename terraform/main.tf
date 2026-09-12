resource "azurerm_resource_group" "aks_lab" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "aks_lab" {
  name                = var.vnet_name
  location            = azurerm_resource_group.aks_lab.location
  resource_group_name = azurerm_resource_group.aks_lab.name
  address_space       = var.vnet_address_space

  tags = var.tags
}

resource "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  resource_group_name  = azurerm_resource_group.aks_lab.name
  virtual_network_name = azurerm_virtual_network.aks_lab.name
  address_prefixes     = var.aks_subnet_address_prefixes
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.aks_lab.name
  location            = azurerm_resource_group.aks_lab.location
  sku                 = var.acr_sku
  admin_enabled       = false

  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_lab.location
  resource_group_name = azurerm_resource_group.aks_lab.name
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.aks_kubernetes_version

  default_node_pool {
    name           = "system"
    node_count     = var.aks_system_node_pool_count
    vm_size        = var.aks_system_node_pool_vm_size
    vnet_subnet_id = azurerm_subnet.aks.id

    only_critical_addons_enabled = true

    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = var.aks_user_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.aks_user_node_pool_vm_size
  vnet_subnet_id        = azurerm_subnet.aks.id
  mode                  = "User"

  auto_scaling_enabled = true
  min_count            = var.aks_user_node_pool_min_count
  max_count            = var.aks_user_node_pool_max_count

  upgrade_settings {
    max_surge = "10%"
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
