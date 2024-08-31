resource "terraform_data" "generate-openshift-generated" {
  provisioner "local-exec" {
    interpreter = [ "bash", "-ceu"]
    command = <<-EOL
        nslookup quay.${var.domain}
        nslookup registry-1.${var.domain}
        nslookup registry-k8s.${var.domain}
        nslookup gcr.${var.domain}
        nslookup ghcr.${var.domain}
        nslookup openshift-ci.${var.domain}
        nslookup api.openshift.${var.domain}
        nslookup api-int.openshift.${var.domain}
        nslookup *.apps.openshift.${var.domain}
        nslookup bootstrap.openshift.${var.domain}
        nslookup control-plane-1.openshift.${var.domain}
        nslookup control-plane-2.openshift.${var.domain}
        nslookup control-plane-3.openshift.${var.domain}
        nslookup compute-1.openshift.${var.domain}
        nslookup compute-2.openshift.${var.domain}
        nslookup compute-3.openshift.${var.domain}
        nslookup compute-4.openshift.${var.domain}
        nslookup compute-5.openshift.${var.domain}
        nslookup compute-6.openshift.${var.domain}
        nslookup compute-7.openshift.${var.domain}
        nslookup compute-8.openshift.${var.domain}
        nslookup compute-9.openshift.${var.domain}
        nslookup compute-10.openshift.${var.domain}
    EOL
  }
}
