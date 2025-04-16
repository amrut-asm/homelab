resource "template_dir" "docker_services" {
  source_dir      = "${path.module}/docker-services-template"
  destination_dir = "${path.module}/docker-services-generated"

  vars = {
    do_token = var.do_token,
    domain_name = var.domain_name,
    do_name = split(".", var.domain_name)[0]
    do_domain = join(".", [ split(".", var.domain_name)[1], split(".", var.domain_name)[2] ]),
    external_ip = var.external_ip,
    internal_openshift_lb_address = var.internal_openshift_lb_address
    external_openshift_lb_address = var.external_openshift_lb_address
    internal_subnet = var.internal_subnet
    external_subnet = var.external_subnet
    internal_gateway = var.internal_gateway
    external_gateway = var.external_gateway
    internal_quay_registry_address = var.internal_quay_registry_address
    internal_docker_registry_address = var.internal_docker_registry_address
    internal_k8s_registry_address = var.internal_k8s_registry_address
    internal_gcr_registry_address = var.internal_gcr_registry_address
    internal_ghcr_registry_address = var.internal_ghcr_registry_address
    internal_openshift_ci_registry_address = var.internal_openshift_ci_registry_address
    internal_registry_address = var.internal_registry_address
  }
}

resource tls_private_key ca_private_key {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource local_file ca_private_key {
  content = tls_private_key.ca_private_key.private_key_pem
  filename = "${path.module}/docker-services-generated/proxy-cache/certs/ca.key"
  depends_on = [
    template_dir.docker_services
  ]
}

resource tls_self_signed_cert ca_cert {
  private_key_pem = tls_private_key.ca_private_key.private_key_pem

  is_ca_certificate = true

  subject {
    common_name = "ca.${var.domain_name}"
    country = "IN"
    province = "Odisha"
    locality = "Jharsuguda"
  }

  validity_period_hours = 876600

  allowed_uses = [
    "cert_signing",
    "crl_signing",
    "digital_signature"
  ]
}

resource local_file ca_cert {
  content = tls_self_signed_cert.ca_cert.cert_pem
  filename = "${path.module}/docker-services-generated/proxy-cache/certs/ca.crt"
  depends_on = [
    template_dir.docker_services
  ]
}

resource tls_private_key tls_key {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource local_file tls_key {
  content = tls_private_key.tls_key.private_key_pem
  filename = "${path.module}/docker-services-generated/proxy-cache/certs/tls.key"
  depends_on = [
    template_dir.docker_services
  ]
}

resource tls_cert_request internal_csr {

  private_key_pem = tls_private_key.tls_key.private_key_pem

  dns_names = ["*.${var.domain_name}"]

  subject {
    common_name = "*.${var.domain_name}"
    country = "IN"
    province = "Odisha"
    locality = "Jharsuguda"
  }
}

resource tls_locally_signed_cert internal_cert {
  cert_request_pem   = tls_cert_request.internal_csr.cert_request_pem
  ca_private_key_pem = tls_private_key.ca_private_key.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca_cert.cert_pem

  validity_period_hours = 876600

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth"
  ]
}

resource local_file tls_cert {
  content = tls_locally_signed_cert.internal_cert.cert_pem
  filename = "${path.module}/docker-services-generated/proxy-cache/certs/tls.crt"
  depends_on = [
    template_dir.docker_services
  ]
}

resource "terraform_data" "docker_services_copy" {
  provisioner "file" {
    source      = "${path.module}/docker-services-generated"
    destination = "/home/${var.user_name}/docker-services"

    connection {
      type     = "ssh"
      user     = "${var.user_name}"
      private_key = file("${var.private_key_path}")
      host     = "${var.external_ip}"
      timeout  = "10m"
    }
  }

  depends_on = [
    libvirt_domain.services_server,
    template_dir.docker_services,
    local_file.ca_private_key,
    local_file.ca_cert,
    local_file.tls_cert,
    local_file.tls_key
  ]
}