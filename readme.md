# Kubepal

`Kubepal` is a local k3d cluster setup designed for cluster configuration development and app deployment experimentation.

Key features:

- Disposable and Quick-to-Use: Create and delete the cluster set up with a single command

- GitOps Ready: Replicate GitOps practices in a local environment using ArgoCD

- Modular: Each directory is a self-contained module that can be used independently

## Prerequisites

- [Task](https://taskfile.dev/#/installation) | [Docker](https://www.docker.com/products/docker-desktop) | [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) | [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Getting started

```shell
# Clone the repo
git clone https://github.com/J0hn-B/kubepal.git

# Change to the kubepal directory
cd kubepal

# List all available tasks
task --list
```

[Configure Kubepal to use the local kubeconfig file](/docs/kubepal_start_here.md)

---

```shell
# create cluster deploy helm charts using terraform
task deploy

# delete cluster
task delete
```

---

<!-- markdownlint-disable -->
<details>

<summary>Available tasks for this project</summary>
<!-- markdownlint-enable -->

```shell
$ task --list

* create:       Create and access a k3d cluster.

If operating on WSL, the KUBECONFIG env var will point to the Windows host.

Kubeconfig path: /mnt/c/Users/devops/.kube/config

* delete:               Delete cluster
* deploy:               Bootstrap cluster and deploy apps
* test:                 Run static tests
* tf_init:              Initialize terraform
* run:checkov:          Checkov, find cloud infra misconfigurations
* run:diff:             Git diff to return changed files
* run:kube_scape:       Kubescape security platform
* run:lint:             GitHub Super-Linter
* run:trivy:            Trivy security scanner

```

</details>

---

- [kubepal overview](/docs/kubepal_structure.md)

---

- Notes:

  - [Terraform Kubernetes Manifest Limitations](/docs/terraform_kubernetes_manifest.md)
