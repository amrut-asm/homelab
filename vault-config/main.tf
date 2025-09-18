terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "5.3.0"
    }
  }
}

provider "vault" {
  address = "https://vault.nanibot.net"
  token = var.vault_token
}