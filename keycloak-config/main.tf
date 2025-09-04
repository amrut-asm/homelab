terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
      version = "5.4.0"
    }
  }
}

provider "keycloak" {
  client_id     = "terraform-client"
  client_secret = var.keycloak_client_secret
  url           = "https://keycloak.nanibot.net"
  realm         = "master"
}