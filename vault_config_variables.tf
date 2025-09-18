variable vault_namespace {
  description = "Namespace for the Vault instance"
  type        = string
}

variable vault_token {
  description = "Token for Vault authentication"
  type        = string
  sensitive   = true
}

variable oidc_client_id {
  description = "OIDC Client ID"
  type        = string
}

variable oidc_client_secret {
  description = "OIDC Client Secret"
  type        = string
  sensitive   = true
}

variable oidc_discovery_url {
  description = "OIDC Discovery URL"
  type        = string
}

