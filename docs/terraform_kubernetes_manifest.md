# Terraform Kubernetes Manifest

- [Information about the kubepal cluster info](/docs/kubepal_start_here.md)

  Based on [Terraform Kubernetes Provider limits](https://github.com/hashicorp/terraform-provider-kubernetes/issues/1367), the `kubernetes_manifest` resource **reaches out to the Kubernetes API during the planning phase to retrieve structural information (schema) for the particular resource kind that it needs to manage.**

  If the CRD has not yet been created on the Kubernetes API, the `kubernetes_manifest` resource will [fail to plan](https://github.com/hashicorp/terraform-provider-kubernetes/issues/1782).

  Suggested solution is to split configuration into two directories:

  1. Provision Kubernetes cluster and install Helm charts
  2. Create Kubernetes objects applying the yaml configs

  This approach allows for quicker iteration. The first directory can be run once and then the `config` directory can be run as many times as needed.

  Each directory has a separate backend configuration and state file.
