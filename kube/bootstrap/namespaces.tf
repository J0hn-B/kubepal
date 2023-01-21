resource "kubernetes_namespace" "openfaas" {
  metadata {
    name = "openfaas"
  }
}
