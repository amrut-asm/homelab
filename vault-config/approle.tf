resource "vault_auth_backend" "approle" {
  namespace = vault_namespace.nanibot_net.path
  type      = "approle"
  path      = "approle"
}

resource "vault_policy" "read_only" {
  name = "read-only"
  namespace = vault_namespace.nanibot_net.path
  policy = <<EOT
path "kubernetes-secrets/data/*" {
  capabilities = ["read", "list"]
}

path "kubernetes-secrets/metadata/*" {
  capabilities = ["read", "list"]
}
EOT
}

resource "vault_approle_auth_backend_role" "read_only_approle" {
  namespace = vault_namespace.nanibot_net.path
  backend        = vault_auth_backend.approle.path
  role_name      = "eso-role"
  secret_id_num_uses = 0
  token_policies = [vault_policy.read_only.name]
}

resource "vault_approle_auth_backend_role_secret_id" "read_only_approle_secret" {
  namespace = vault_namespace.nanibot_net.path
  role_name = vault_approle_auth_backend_role.read_only_approle.role_name
}
