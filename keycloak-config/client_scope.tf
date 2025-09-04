resource "keycloak_openid_client_scope" "realm_roles" {
  realm_id    = keycloak_realm.nanibot_net.id
  name        = "realm-roles"
  description = "Include realm roles in the ID token"
}

resource "keycloak_openid_user_realm_role_protocol_mapper" "realm_roles_mapper" {
  realm_id            = keycloak_realm.nanibot_net.id
  client_scope_id     = keycloak_openid_client_scope.realm_roles.id
  name                = "realm-roles-mapper"
  claim_name          = "roles"
  multivalued         = true
  add_to_id_token     = true
  add_to_access_token = true
  add_to_userinfo     = true
}