# Kubepal

A local [`k3d`](https://k3d.io) cluster setup, ready to deploy your apps, prepackaged with a few useful tools.
Designed to be used with both, WSL and Powershell simultaneously.

## Getting started

- On [`Taskfile.yml`](./Taskfile.yaml), update the KUBE variable to match your WSL path to kubeconfig file on Windows host:

  ![image](https://user-images.githubusercontent.com/40946247/220986094-d73a105f-10de-4ceb-a1c5-a0a5f6c89871.png)

- Update the [`config_paths`](./kube/bootstrap/backend.tf) list to match your local `kubeconfig file` path:

![image](https://user-images.githubusercontent.com/40946247/220987710-494c74ee-fc11-4b4d-bc3a-8873c7fc79bb.png)

- Run `task --list` on WSL or Powershell to see the available tasks and the updated `kubeconfig` path.
