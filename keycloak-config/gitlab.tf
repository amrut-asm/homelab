resource "random_password" "gitlab_secret" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "keycloak_openid_client" "gitlab" {
  realm_id = keycloak_realm.nanibot_net.id
  client_id = "gitlab"
  name = "gitlab"
  enabled = true
  access_type = "CONFIDENTIAL"
  standard_flow_enabled = true
  valid_redirect_uris = [
    "https://gitlab.nanibot.net/users/auth/openid_connect/callback"
  ]
  web_origins = [
    "https://gitlab.nanibot.net"
  ]
  root_url = "https://gitlab.nanibot.net"
  admin_url = "https://gitlab.nanibot.net"
  base_url = "https://gitlab.nanibot.net"
}

resource "keycloak_openid_client_default_scopes" "gitlab_client_default_scopes" {
  realm_id  = keycloak_realm.nanibot_net.id
  client_id = keycloak_openid_client.gitlab.id

  default_scopes = [
    "profile",
    "email",
    "roles",
    "web-origins",
    keycloak_openid_client_scope.realm_roles.name,
  ]
}