// Extract the config_path values from the backend.tf file
// and use it to configure the kubernetes provider
// and the helm provider
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

locals {

  // Return a list with all the values between double quotes
  list_values = flatten(regexall("\"(.*?)(?:,)?\"", tostring(file("${path.module}/backend.tf"))))

  // Determine the right path to the kube config file based on the OS
  kube_config_path = fileexists(local.list_values[3]) ? local.list_values[3] : local.list_values[2]
}


# Configure Kubernetes provider
provider "kubernetes" {
  config_paths = [
    local.kube_config_path
  ]

}

# Configure Helm provider
provider "helm" {
  kubernetes {
    config_paths = [
      local.kube_config_path
    ]
  }
}


