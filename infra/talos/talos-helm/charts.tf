resource "helm_release" "flux_operator" {
  name        = "flux-operator"
  namespace   = "flux-system"
  repository  = "oci://ghcr.io/controlplaneio-fluxcd/charts"
  chart       = "flux-operator"
  create_namespace = true
  wait = false
}

resource "helm_release" "cilium" {
  name        = "cilium"
  namespace   = "kube-system"
  repository  = "https://helm.cilium.io"
  chart       = "cilium"
  version = "1.18.1"
  create_namespace = true
  wait = false
  set {
    name  = "operator.replicas"
    value = "1"
  }

  set {
    name  = "ipam.mode"
    value = "kubernetes"
  }

  set {
    name  = "kubeProxyReplacement"
    value = "true"
  }

  set_list {
    name = "securityContext.capabilities.ciliumAgent"
    value = [
      "CHOWN",
      "KILL",
      "NET_ADMIN",
      "NET_RAW",
      "IPC_LOCK",
      "SYS_ADMIN",
      "SYS_RESOURCE",
      "DAC_OVERRIDE",
      "FOWNER",
      "SETGID",
      "SETUID",
    ]
  }

  set_list {
    name = "securityContext.capabilities.cleanCiliumState"
    value = [
      "NET_ADMIN",
      "SYS_ADMIN",
      "SYS_RESOURCE",
    ]
  }

  set {
    name  = "cgroup.autoMount.enabled"
    value = "false"
  }

  set {
    name  = "cgroup.hostRoot"
    value = "/sys/fs/cgroup"
  }

  set {
    name  = "k8sServiceHost"
    value = "api-int.talos.nanibot.net"
  }

  set {
    name  = "k8sServicePort"
    value = "6443"
  }

  set {
    name  = "bgpControlPlane.enabled"
    value = "true"
  }
}