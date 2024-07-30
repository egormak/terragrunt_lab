terraform {
  required_version = ">= 1.7.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.12"
    }
    kind = {
      source  = "tehcyx/kind"
      version = ">= 0.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.27"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0"
    }
  }
}
