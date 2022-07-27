resource "kubernetes_namespace" "demoapp" {
  metadata {
    name   = "demoapp"
    labels = {}
  }
}

resource "helm_release" "demoapp" {
  name             = "demoapp"
  chart            = "./demoapp"
  namespace        = kubernetes_namespace.demoapp.metadata[0].name
  create_namespace = false
  recreate_pods    = false
  reuse_values     = false
  reset_values     = true
  force_update     = false
  wait             = true

  #   set {
  #     name  = ""
  #     value = ""
  #   }

  depends_on = [kubernetes_namespace.demoapp]
}

