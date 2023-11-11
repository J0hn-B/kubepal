# Teraform backend configured as k8s secret
terraform {
  backend "kubernetes" {
    secret_suffix = "state"

    // Warning: Variables, locals and functions may not be used here.
    config_paths = [
      "/mnt/c/Users/devops/.kube/config",
      "c:\\Users\\devops\\.kube\\config"
    ]
  }
}

