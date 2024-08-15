# ==========================================
# Install Age key
# ==========================================

resource "kubernetes_secret" "age_key" {
  metadata {
    name = "sops-age"
    namespace = "flux-system"
  }

  data = {
    "age.agekey" = "${var.age_key}"
  }
}
