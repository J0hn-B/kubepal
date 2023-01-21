// Extract the config_path value from the backend.tf file
// and use it to configure the kubernetes provider
// and the helm provider

# Configure Kubernetes provider
provider "kubernetes" {
  config_path = regex("config_path\\s*=\\s*\"(.*)\"", tostring(file("${path.module}/backend.tf")))[0]
}

# Configure Helm provider
provider "helm" {
  kubernetes {
    config_path = regex("config_path\\s*=\\s*\"(.*)\"", tostring(file("${path.module}/backend.tf")))[0]
  }
}
