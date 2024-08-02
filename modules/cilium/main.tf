provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = var.config_context
  }
}


resource "helm_release" "cilium" {
  name            = "cilium"
  repository      = "https://helm.cilium.io"
  chart           = "cilium"
  version         = var.cilium_version
  namespace       = "kube-system"
  cleanup_on_fail = true
  wait            = true
  max_history     = 1
  force_update    = true

  set {
    name  = "k8sServiceHost"
    value = "127.0.0.1"
  }
  set {
    name  = "k8sServicePort"
    value = var.kube_api_port
  }
  set {
    name  = "hubble.relay.enabled"
    value = "true"
  }
  set {
    name  = "hubble.ui.enabled"
    value = "true"
  }
  set_list {
    name  = "ipam.operator.clusterPoolIPv4PodCIDRList"
    value = ["${var.cilium_cidr_list}"]
  }
  set {
    name  = "localRedirectPolicy"
    value = "true"
  }
  set {
    name  = "kubeProxyReplacement"
    value = "strict"
  }

}
