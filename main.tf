terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
  required_version = ">= 1.1.2"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k8s-autoscaling-cluster"
}
