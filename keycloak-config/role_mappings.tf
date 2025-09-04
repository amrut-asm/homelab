resource "keycloak_user_roles" "role_mappings" {
  realm_id = keycloak_realm.nanibot_net.id
  user_id  = keycloak_user.nanibot.id

  role_ids = [
    keycloak_role.grafanaadmin.id,
    keycloak_role.consoleAdmin.id,
    keycloak_role.admin.id
  ]
}
