# Teraform backend configured as k8s secret
terraform {
  backend "kubernetes" {
    secret_suffix = "state"
    config_path   = "/mnt/c/Users/devops/.kube/config"
  }
}
