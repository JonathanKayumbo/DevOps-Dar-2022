variable "resource_group_name" {
  type = string
  description = "RG name in Azure"

}
variable "location" {
  type = string
  description = "Resource locaion in Azure"

}
variable "cluster_name" {
  type = string
  description = "AKS name in Azure"

}
variable "kubernetes_version" {
  type = string
  description = "Kubernetes version"

}
variable "system_node_count" {
  type = number
  description = "RG name in Azure"

}
variable "acr_name" {
  type = string
  description = "ACR name"
}