

// Determine the right path to the kube config file based on the OS
output "terraform_providers_path" {
  value = fileexists(local.list_values[3]) ? local.list_values[3] : local.list_values[2]
}
