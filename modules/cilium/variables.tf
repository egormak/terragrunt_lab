variable "config_context" {
  description = "Context from KubeConfig file"
  type        = string
  default     = "staging"
}

variable "kube_api_host" {
  description = "Kubernetes Api Host"
  type        = string
  default     = "127.0.0.1"
}

variable "kube_api_port" {
  description = "Kubernetes Api Port"
  type        = string
  default     = "6443"
}

variable "operator_replicas" {
  description = "Operator Replicas"
  type        = string
  default     = "2"
}

variable "ipam_mode" {
  description = "IPAM Mode"
  type        = string
  default     = "cluster-pool"
}

variable "cilium_version" {
  description = "Context from KubeConfig file"
  type        = string
}

variable "cilium_cidr_list" {
  description = "Cilium CIDR List"
  type        = string
  default     = "10.1.0.0/16"
}