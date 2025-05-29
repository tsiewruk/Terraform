variable "hosted_zone_id" {
  description = "ID strefy DNS"
  type        = string
}

variable "kms_arn" {
  description = "ARN klucza KMS"
  type        = string
}

variable "name" {
  description = "Nazwa klucza DNSSEC"
  type        = string
  default     = "dnssec-key"
}
