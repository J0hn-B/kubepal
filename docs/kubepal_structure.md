# Repository Overview

Every directory has an autonomous nature and can be used independently, like a module

```shell
# $ tree -d kubepal
kubepal
|-- docs
`-- kube
    |-- argocd
    |-- base
    |-- minik8s


```

---

<!-- textlint-disable -->

- `.github/`

  - [.gitHub](/.github/): CI/CD pipeline, with [local](/Taskfile.yaml) and [Github Actions mode](/.github/workflows/ci.yml)

    - [How CI works at GitHub and locally](/.github/gh_actions.md)

    - [Taskfile](https://taskfile.dev/#/) for local development

<!-- textlint-enable -->

```yml
# Include the github actions tasks in your main Taskfile
includes:
  run: .github/Taskfile.yml
```

---

- `docs/`

  - [Documentation](/docs/)

    - [Getting started with kubepal](/docs/kubepal_start_here.md)

    - [Terraform Kubernetes Manifest limitations](/docs/terraform_kubernetes_manifest.md)

---

- `kube/`

  ```bash
  # $ tree -d kube

  |-- kube
     |-- argocd  # ArgoCD manifests
     |-- base  # Kubernetes yaml manifests
     |-- minik8s # Kubernetes cluster provisioned with terraform and helm charts

          # dir named after the cluster description (minik8s, azure, gke, eks, etc)
  ```

---
