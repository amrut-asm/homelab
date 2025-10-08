resource "keycloak_role" "grafanaadmin" {
  realm_id    = keycloak_realm.nanibot_net.id
  name        = "grafanaadmin"
  description = "Grafana Admin"
}

resource "random_password" "grafana_secret" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "keycloak_openid_client" "grafana" {
  realm_id = keycloak_realm.nanibot_net.id
  client_id = "grafana"
  name = "grafana"
  enabled = true
  access_type = "CONFIDENTIAL"
  standard_flow_enabled = true
  valid_redirect_uris = [
    "https://grafana.nanibot.net/login/generic_oauth"
  ]
  web_origins = [
    "https://grafana.nanibot.net"
  ]
  root_url = "https://grafana.nanibot.net"
  admin_url = "https://grafana.nanibot.net"
  base_url = "https://grafana.nanibot.net"
}

resource "keycloak_openid_client_default_scopes" "grafana_client_default_scopes" {
  realm_id  = keycloak_realm.nanibot_net.id
  client_id = keycloak_openid_client.grafana.id

  default_scopes = [
    "profile",
    "email",
    "roles",
    "web-origins",
    keycloak_openid_client_scope.realm_roles.name,
  ]
}