variable "cluster_name" {
  type        = string
}

variable "cluster_endpoint" {
  type        = string
}

variable "talos_controlplane_nodes" {
  description = "A list of control plane node IPs"
  type        = list(string)
}

variable "talos_worker_nodes" {
  description = "A list of worker node IPs"
  type        = list(string)
}

variable "kubernetes_version" {
  description = "The Kubernetes version to install"
  type        = string
}
