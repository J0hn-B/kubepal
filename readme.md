# Kubepal

A local [`k3d`](https://k3d.io) cluster setup, ready to deploy your apps, prepackaged with a few useful tools.
Designed to be used with both, WSL and Powershell simultaneously.

## Getting started

- Setup consists of 2 main directories: `app` and `bootstrap`

  - `kube/app` contains the kubernetes manifests for the apps/configs.

  - `kube/bootstrap` contains the terraform configuration to prepare the cluster.

1. From the project root directory, run [`task list`](./Taskfile.yaml) to see the available tasks. If on Powershell, `task list` will return the default kubeconfig path. If on WSL, `task create` will generate the export command for the kubeconfig path. Both cases will point to the same kubeconfig file, hosted by the windows host.

   > Your cluster must now be accessible from both WSL and Powershell, Try running `kubectl get namespaces` from both environments. and verify access to the k3d cluster.

2. Navigate to the `kube/bootstrap` directory and update the `config_paths` values in [`backend.tf`](/kube/bootstrap/backend.tf) to match your environment.

   > Both `config_paths` values must point to the same directory, and the directory must exist.

3. Run `task deploy` to create, bootstrap the cluster with terraform and deploy the apps.

4. Run `task delete` to destroy the cluster.
