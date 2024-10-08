variable "config_context" {
  description = "Context from KubeConfig file"
  type        = string
  default     = "staging"
}

variable "github_token" {
  description = "GitHub token"
  sensitive   = true
  type        = string
  default     = ""
}

variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = ""
}

variable "github_repository" {
  description = "GitHub repository"
  type        = string
  default     = ""
}

variable "flux_cluster_path" {
    description = "Path to the cluster"
    type        = string
    default     = "clusters/my-cluster"
}