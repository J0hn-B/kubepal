// Export kubernetes provider config_path
output "kube_config_path" {
  value = var.enable_output ? regex("config_path\\s*=\\s*\"(.*)\"", tostring(file("${path.module}/backend.tf")))[0] : null
}

// Export helm provider config_path
output "helm_config_path" {
  value = var.enable_output ? regex("config_path\\s*=\\s*\"(.*)\"", tostring(file("${path.module}/backend.tf")))[0] : null
}

