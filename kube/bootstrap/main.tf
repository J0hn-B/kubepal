// Install latest ArgoCD
resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  cleanup_on_fail  = true

  // read values from file
  values = [
    file("${path.module}/argocd_chart_values.yml")
  ]
}

// Create an ArgoCd Ingress
resource "kubernetes_manifest" "argocd_ingress" {
  manifest = yamldecode(
    file("${path.module}/argocd_ingress.yml")
  )
  depends_on = [
    helm_release.argocd
  ]
}

// http://localhost:8080/argocd

// Get the password for the admin user
data "kubernetes_secret_v1" "argocd_secret" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = helm_release.argocd.namespace
  }
}

