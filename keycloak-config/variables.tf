variable keycloak_admin_password {
  description = "The initial password for the admin user"
  type        = string
}

variable keycloak_client_secret {
  description = "The client secret for the terraform-client in Keycloak"
  type        = string
}