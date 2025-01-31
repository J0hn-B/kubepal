
// Install latest ArgoCD
resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  cleanup_on_fail  = true
  version          = "7.7.22"

  // https://github.com/argoproj/argo-helm/blob/main/charts/argo-cd/values.yaml

  // Settings for using ArgoCD locally
  set {
    # Run server without TLS
    name  = "configs.params.server\\.insecure"
    value = true
  }
  # Used if Argo CD is running behind reverse proxy under subpath different from /
  set {
    name  = "configs.params.server\\.rootpath"
    value = "/argocd"
  }

  # Enable Annotation Resource Tracking: (Crossplane: https://docs.crossplane.io/knowledge-base/integrations/argo-cd-crossplane/)
  set {
    name  = "configs.cm.application\\.resourceTrackingMethod"
    value = "annotation"
  }

  # Enable GZIP compression
  set {
    name  = "configs.params.server\\.enable.\\gzip"
    value = "false"
  }

  # Enable an ingress resource for the Argo CD server
  set {
    name  = "server.ingress.enabled"
    value = true
  }

  # Specific implementation for ingress controller. One of `generic`, `aws` or `gke`
  set {
    name  = "server.ingress.controller"
    value = "generic"
  }

  # Argo CD server hostname
  set {
    name  = "server.ingress.hostname"
    value = "localhost"
  }

  # Argo CD server path
  set {
    name  = "server.ingress.path"
    value = "/argocd"
  }

}

// Get the password for the admin user
data "kubernetes_secret_v1" "argocd_secret" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = helm_release.argocd.namespace
  }
}




