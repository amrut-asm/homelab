output "talosconfig" {
  value     = "${module.talos-init.talosconfig}"
  sensitive = true
}

output "kubeconfig" {
  value     = "${module.talos-init.kubeconfig}"
  sensitive = true
}