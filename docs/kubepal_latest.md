#

This release focuses on Taskfile tasks and Go templating examples in tasks.

## Features and Tools

- `[Task](https://taskfile.dev/):` a cross-platform alternative to Make, supporting and showcasing `Go templates`.

- `Terraform:` bootstraps the cluster and applies the ArgoCD helm chart.

## Getting Started

> **In this example, a WSL distro using a kubeconfig file located in the Windows user's home directory**

1. Update the `KUBE` variable in [Taskfile.yml](../Taskfile.yaml) to match your path.

   ```yaml
   env:
     CLUSTER_NAME: kubepal
     KUBE: export KUBECONFIG=/mnt/c/Users/{{.USER}}/.kube/config
   ```

2. Update the `kube/bootstrap/backend.tf` to match `the path of your local kubeconfig file`:

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

3. Run `task --list` in WSL or PowerShell to see the available tasks and the updated kubeconfig path.

   ```shell
   $ task
   task: Available tasks for this project:

   * create:       Create and access a k3d cluster.
   * delete:            Delete cluster
   * deploy:            Bootstrap cluster and deploy apps
   * tf_init:           Initialize terraform
   * run:connect:       Get a shell to a running container
   * run:pod:           Create a temporary interactive pod, install some tools on it, and experiment
   * run:start:         Go template if statement
   * run:test:          Go template functions and examples using Powershell and Bash
   ```

4. The `task deploy` command will create the cluster, deploy ArgoCD, and deploy the apps.
5. The `task delete` command will delete the cluster.
