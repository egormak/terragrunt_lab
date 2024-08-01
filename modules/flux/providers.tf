provider "flux" {
  kubernetes = {
    config_path = "~/.kube/config"
    config_context = var.config_context 
  }
  git = {
    url = "ssh://git@github.com/${var.github_org}/${var.github_repository}.git"
    ssh = {
      username    = "git"
      private_key = tls_private_key.flux.private_key_pem
    }
  }
}

# Configure the GitLab Provider
provider "github" {
  owner = var.github_org
  token = var.github_token
}