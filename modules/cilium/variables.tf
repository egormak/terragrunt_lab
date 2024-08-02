variable "config_context" {
  description = "Context from KubeConfig file"
  type        = string
  default     = "staging"
}

variable "kube_api_port" {
  description = "Kubernetes Api Port"
  type        = string
  default     = "8443"
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