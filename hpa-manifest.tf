resource "kubectl_manifest" "hpa-ecsdemo-crystal" {
  yaml_body = <<YAML
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: ecsdemo-crystal
  namespace: demoapp
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: ecsdemo-crystal
  minReplicas: 1
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
  - type: Pods
    pods:
      metric:
        name: packets-per-second
      target:
        type: AverageValue
        averageValue: 1k
YAML

  depends_on = [helm_release.demoapp]
}


resource "kubectl_manifest" "hpa-ecsdemo-frontend" {
  yaml_body = <<YAML
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: ecsdemo-frontend
  namespace: "{{ kubernetes_namespace.demoapp.metadata[0].name }}"
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: ecsdemo-frontend
  minReplicas: 1
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
  - type: Pods
    pods:
      metric:
        name: packets-per-second
      target:
        type: AverageValue
        averageValue: 1k
YAML

  depends_on = [helm_release.demoapp]
}

resource "kubectl_manifest" "hpa-ecsdemo-nodejs" {
  yaml_body = <<YAML
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: ecsdemo-nodejs
  namespace: demoapp
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: ecsdemo-nodejs
  minReplicas: 1
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
  - type: Pods
    pods:
      metric:
        name: packets-per-second
      target:
        type: AverageValue
        averageValue: 1k
YAML

  depends_on = [helm_release.demoapp]
}
