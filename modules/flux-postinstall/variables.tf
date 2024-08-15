variable "config_context" {
  description = "Context from KubeConfig file"
  type        = string
  default     = "staging"
}

variable "age_key" {
    description = "The age key"
    type        = string
}