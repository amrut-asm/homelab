resource "random_password" "vault_secret" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "keycloak_openid_client" "vault" {
  realm_id = keycloak_realm.nanibot_net.id
  client_id = "vault"
  name = "vault"
  enabled = true
  access_type = "CONFIDENTIAL"
  standard_flow_enabled = true
  valid_redirect_uris = [
    "https://vault.nanibot.net/oidc/callback"
  ]
  web_origins = [
    "https://vault.nanibot.net"
  ]
  root_url = "https://vault.nanibot.net"
  admin_url = "https://vault.nanibot.net"
  base_url = "https://vault.nanibot.net"
}

resource "keycloak_openid_client_default_scopes" "vault_client_default_scopes" {
  realm_id  = keycloak_realm.nanibot_net.id
  client_id = keycloak_openid_client.vault.id

  default_scopes = [
    "profile",
    "email",
    "roles",
    "web-origins",
    keycloak_openid_client_scope.realm_roles.name,
  ]
}