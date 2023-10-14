
run "argocd_helm_release" {

  command = plan

  # Verify ArgoCD helm chart name
  assert {
    condition     = helm_release.argocd.chart == "argo-cd"
    error_message = "ArgoCD helm chart did not match expected"
  }

  # Verify ArgoCD helm chart repository
  assert {
    condition     = helm_release.argocd.repository == "https://argoproj.github.io/argo-helm"
    error_message = "ArgoCD helm chart repository did not match expected"
  }

}

run "argocd_ingress" {

  command = plan

  # Verify ArgoCD yaml manifest apiVersion
  assert {
    condition     = kubernetes_manifest.argocd_ingress.manifest.apiVersion == "networking.k8s.io/v1"
    error_message = "ArgoCD yaml manifest apiVersion did not match expected"
  }

}
