// Determine the right path to the kube config file based on the OS
output "terraform_providers_path" {
  value = fileexists(local.list_values[3]) ? local.list_values[3] : local.list_values[2]
}

// Get the password for the admin user
output "argocd_secret" {
  value       = data.kubernetes_secret_v1.argocd_secret.data.password != "" ? nonsensitive(data.kubernetes_secret_v1.argocd_secret.data.password) : "No password found"
  description = "Login --> username: admin --> password:"

  depends_on = [
    kubernetes_manifest.argocd_ingress
  ]
}

// Access argocd web ui
output "argocd_web_ui" {
  value = "http://localhost:8080/argocd"
}
