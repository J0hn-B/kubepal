# Kubepal

A local [`k3d`](https://k3d.io) cluster setup, ready to deploy your apps, pre-packaged with a few useful tools.
Designed to be used with both, WSL and Powershell simultaneously.

- [Task](https://taskfile.dev/) used as a `make` alternative, supports Go templates and is cross-platform.

- Terraform used to deploy the ArgoCD helm chart after the cluster is up and running.

GitOps focused, will try to replicate an easy to use, temporary local cluster setup for development/testing purposes.

A tools and code snippets collection for future reference.

## Getting started

- On [`Taskfile.yml`](./Taskfile.yaml), update the KUBE variable ( if necessary ) to match your WSL path to kubeconfig file on Windows host:

```yml
env:
  CLUSTER_NAME: kubepal
  KUBE: export KUBECONFIG=/mnt/c/Users/{{.USER}}/.kube/config # WSL path to kubeconfig file on Windows host
```

- Update the [`config_paths`](./kube/bootstrap/backend.tf) list to match your local `kubeconfig file` path:

```hcl
    // Warning: Variables, locals and functions may not be used here.

    config_paths = [
      "/mnt/c/Users/devops/.kube/config",
      "c:\\Users\\devops\\.kube\\config"
    ]
```

- Run `task --list` on WSL or Powershell to see the available tasks and the updated `kubeconfig` path.

```bash
task: Available tasks for this project:
* create:       Create and access a k3d cluster.

If operating on WSL, the KUBECONFIG env var will point to the Windows host.



Kubeconfig path: /mnt/c/Users/devops/.kube/config

* delete:             Delete cluster
* deploy:             Bootstrap cluster and deploy apps
* tf_init:            Initialize terraform
* run:clean:          Clean up /.kube/config
* run:connect:        Get a shell to a running container
* run:path:           Convert a string from / path format to \
* run:start:          Go template if statement
* run:temp_pod:       Create a temporary interactive pod, install some tools on it, and experiment
* run:test:           Go template functions and examples using Powershell and Bash
```

- `task deploy` will perform all steps to create the cluster, deploy ArgoCD and deploy the apps.

- `task delete` will delete the cluster.
