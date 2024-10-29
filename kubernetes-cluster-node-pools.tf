resource "azurerm_kubernetes_cluster_node_pool" "rg_pri_wl_aks_cl_nd_pl" {
  name                  = "workerpool"
  mode                  = local.aks.node_pool.mode.user
  kubernetes_cluster_id = azurerm_kubernetes_cluster.rg_pri_wl_aks_cl.id
  enable_auto_scaling   = true
  enable_node_public_ip = false
  vnet_subnet_id        = azurerm_subnet.rg_pri_spk_vn_wl_sub.id
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_type          = local.aks.node_pool.os_disk_type.managed
  os_sku                = local.aks.node_pool.os_sku.azure_linux
  scale_down_mode       = local.aks.node_pool.scale_down_mode.delete
  min_count             = var.wl_aks_worker_pool_min_node_count
  node_count            = var.wl_aks_worker_pool_node_count
  max_count             = var.wl_aks_worker_pool_max_node_count
  max_pods              = var.wl_aks_pod_count_per_node
  vm_size               = var.wl_aks_vm_size
  zones                 = var.wl_aks_zones
  os_disk_size_gb       = var.wl_aks_os_disk_size_gb
  kubelet_disk_type     = local.aks.kubelet_disk_type.os
  node_labels = {
    "node.kubernetes.io/infra" = "false"
  }

  tags = {
    enable_auto_diag_settings = true
    name                      = "Azure Kubernetes Service Cluster Worker Node Pool (Workload)"
  }
}

#--

resource "azurerm_kubernetes_cluster_node_pool" "rg_sec_wl_aks_cl_nd_pl" {
  name                  = "workerpool"
  mode                  = local.aks.node_pool.mode.user
  kubernetes_cluster_id = azurerm_kubernetes_cluster.rg_sec_wl_aks_cl.id
  enable_auto_scaling   = true
  enable_node_public_ip = false
  vnet_subnet_id        = azurerm_subnet.rg_sec_spk_vn_wl_sub.id
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_type          = local.aks.node_pool.os_disk_type.managed
  os_sku                = local.aks.node_pool.os_sku.azure_linux
  scale_down_mode       = local.aks.node_pool.scale_down_mode.delete
  min_count             = var.wl_aks_worker_pool_min_node_count
  node_count            = var.wl_aks_worker_pool_node_count
  max_count             = var.wl_aks_worker_pool_max_node_count
  max_pods              = var.wl_aks_pod_count_per_node
  vm_size               = var.wl_aks_vm_size
  #zones                 = var.wl_aks_zones # Availability zone is not available in GermanyNorth
  os_disk_size_gb   = var.wl_aks_os_disk_size_gb
  kubelet_disk_type = local.aks.kubelet_disk_type.os
  node_labels = {
    "node.kubernetes.io/infra" = "false"
  }

  tags = {
    enable_auto_diag_settings = true
    name                      = "Azure Kubernetes Service Cluster Worker Node Pool (Workload)"
  }
}