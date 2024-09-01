resource "kubernetes_horizontal_pod_autoscaler" "nginx_ingress_hpa" {
  metadata {
    name      = "nginx-ingress-hpa"
    namespace = "default"
  }

  spec {
    max_replicas = 10
    min_replicas = 2

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = helm_release.nginx_ingress.name # Name of the NGINX deployment created by Helm
    }

    metric {
      type = "Resource"

      resource {
        name = "cpu"
        target {
          type                = "Utilization"
          average_utilization = 70
        }
      }
    }

    metric {
      type = "Resource"

      resource {
        name = "memory"
        target {
          type                = "Utilization"
          average_utilization = 85
        }
      }
    }
  }
}
