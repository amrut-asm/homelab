resource "keycloak_user" "nanibot" {
  realm_id   = resource.keycloak_realm.nanibot_net.id
  username   = "nanibot"
  enabled    = true

  email      = "nanibot@nanibot.net"
  email_verified = true
  first_name = "Amrut"
  last_name  = "Mahapatra"

  initial_password {
    value     = var.keycloak_admin_password
    temporary = false
  }
}