# Getting Started

> **In this example: deploy from a WSL distro using a kubeconfig file located in the Windows user's home directory**

1. Update the `KUBE` variable in [Taskfile.yml](../Taskfile.yaml) to match your path.

   ```yaml
   env:
     CLUSTER_NAME: kubepal
     KUBE: export KUBECONFIG=/mnt/c/Users/{{.USER}}/.kube/config
   ```

2. Update the [backend.tf](/kube/minik8s/backend.tf) to match `the path of your local kubeconfig file`:

   > Warning: Variables, locals, and functions may not be used here.

   ```hcl

    terraform {
      backend "kubernetes" {
        secret_suffix = "state"

        config_paths = [
          "/mnt/c/Users/devops/.kube/config",      # WSL path
          "c:\\Users\\devops\\.kube\\config"       # PowerShell path
        ]
      }
    }


   ```
