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