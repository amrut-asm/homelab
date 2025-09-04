resource "keycloak_role" "consoleAdmin" {
  realm_id    = keycloak_realm.nanibot_net.id
  name        = "consoleAdmin"
  description = "MinIO Console Admin"
}

resource "random_password" "minio_secret" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "keycloak_openid_client" "minio" {
  realm_id = keycloak_realm.nanibot_net.id
  client_id = "minio"
  name = "minio"
  enabled = true
  access_type = "CONFIDENTIAL"
  standard_flow_enabled = true
  valid_redirect_uris = [
    "https://minio.nanibot.net/oauth_callback"
  ]
  web_origins = [
    "https://minio.nanibot.net"
  ]
  root_url = "https://minio.nanibot.net"
  admin_url = "https://minio.nanibot.net"
  base_url = "https://minio.nanibot.net"
}

resource "keycloak_openid_client_default_scopes" "minio_client_default_scopes" {
  realm_id  = keycloak_realm.nanibot_net.id
  client_id = keycloak_openid_client.minio.id

  default_scopes = [
    "profile",
    "email",
    "roles",
    "web-origins",
    keycloak_openid_client_scope.realm_roles.name,
  ]
}