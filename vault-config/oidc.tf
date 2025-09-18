resource "vault_auth_backend" "oidc" {
  namespace = vault_namespace.nanibot_net.path
  type      = "oidc"
  path      = "oidc"
}

resource "vault_generic_endpoint" "oidc_config" {
  namespace = vault_namespace.nanibot_net.path
  path      = "auth/oidc/config"
  data_json = jsonencode({
    oidc_discovery_url = var.oidc_discovery_url
    oidc_client_id     = var.oidc_client_id
    oidc_client_secret = var.oidc_client_secret
  })
  depends_on = [vault_auth_backend.oidc]
}

resource "vault_policy" "admin" {
  namespace = vault_namespace.nanibot_net.path
  name      = "admin"

  policy = <<EOT
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

resource "vault_jwt_auth_backend_role" "admin" {
  namespace = vault_namespace.nanibot_net.path
  backend   = vault_auth_backend.oidc.path
  role_name = "admin"
  role_type = "oidc"

  user_claim          = "sub"
  allowed_redirect_uris = ["https://vault.nanibot.net/ui/vault/auth/oidc/oidc/callback"]
  oidc_scopes         = ["openid"]
  token_policies      = [vault_policy.admin.name]
  
  bound_claims = {
    roles = "admin"
  }
}
