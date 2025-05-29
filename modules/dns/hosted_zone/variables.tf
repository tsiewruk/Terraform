variable "zone_name" {
  description = "Nazwa strefy DNS, np. example.com"
  type        = string
}

variable "comment" {
  description = "Komentarz do strefy"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tagi dla strefy"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "Opcjonalny VPC ID dla prywatnej strefy"
  type        = string
  default     = null
}
