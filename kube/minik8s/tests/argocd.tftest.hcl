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

