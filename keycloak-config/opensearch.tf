resource "keycloak_role" "admin" {
  realm_id    = keycloak_realm.nanibot_net.id
  name        = "admin"
  description = "OpenSearch Admin Role"
}

resource "random_password" "opensearch_secret" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "keycloak_openid_client" "opensearch" {
  realm_id = keycloak_realm.nanibot_net.id
  client_id = "opensearch"
  name = "opensearch"
  enabled = true
  access_type = "CONFIDENTIAL"
  standard_flow_enabled = true
  valid_redirect_uris = [
    "https://opensearch.nanibot.net/auth/openid/login"
  ]
  web_origins = [
    "https://opensearch.nanibot.net"
  ]
  root_url = "https://opensearch.nanibot.net"
  admin_url = "https://opensearch.nanibot.net"
  base_url = "https://opensearch.nanibot.net"
}

resource "keycloak_openid_client_default_scopes" "opensearch_client_default_scopes" {
  realm_id  = keycloak_realm.nanibot_net.id
  client_id = keycloak_openid_client.opensearch.id

  default_scopes = [
    "profile",
    "email",
    "roles",
    "web-origins",
    keycloak_openid_client_scope.realm_roles.name,
  ]
}