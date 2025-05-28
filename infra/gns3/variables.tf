variable "external_ip" {
    type = string
}

variable "internal_ip" {
    type = string
}

variable "internal_mac" {
  type = string
}

variable "external_mac" {
  type = string
}

variable internal_bridge {
  type = string
}

variable external_bridge {
  type = string
}

variable "internal_gateway" {
  type = string
}

variable external_gateway {
  type = string
}

variable internal_subnet {
  type = string
}

variable external_subnet {
  type = string
}

variable "dns_server" {
  type = string
}

variable "user_name" {
  type = string
}

variable "hostname" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "ssh_key" {
  type = string
}
