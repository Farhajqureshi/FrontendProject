variable "key_name" { type = string }

variable "public_key_path" {
  type        = string
  description = "The public key content (paste the full single-line OpenSSH public key, e.g. contents of ~/.ssh/id_rsa.pub)."

  validation {
    condition     = can(regex("^(ssh-(rsa|ed25519|dss)|ecdsa-sha2-nistp(256|384|521))\\s+[A-Za-z0-9+/]+=*(\\s+.*)?$", var.public_key_path))
    error_message = "Invalid public key format: expected a single-line OpenSSH public key (e.g. starts with 'ssh-rsa' or 'ssh-ed25519'). Paste the full key from '~/.ssh/id_rsa.pub'."
  }
}
