variable "key_name" { type = string }

variable "public_key_path" {
  type        = string
  description = "The public key content (paste the full single-line OpenSSH public key, e.g. contents of ~/.ssh/id_rsa.pub)."
}
