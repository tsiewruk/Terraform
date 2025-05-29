variable "zone_id" {
  description = "ID strefy Route 53"
  type        = string
}

variable "name" {
  description = "Nazwa rekordu DNS"
  type        = string
}

variable "type" {
  description = "Typ rekordu (A, AAAA, CNAME, MX, etc.)"
  type        = string
}

variable "ttl" {
  description = "Time To Live rekordu"
  type        = number
  default     = 300
}

variable "records" {
  description = "Lista wartości rekordu"
  type        = list(string)
  default     = null
}

variable "alias" {
  description = "Alias (dla ELB, CloudFront, S3, etc.)"
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  })
  default = null
}

variable "set_identifier" {
  description = "Unikalny identyfikator (wymagany dla weighted, latency, failover, geolocation)"
  type        = string
  default     = null
}

variable "health_check_id" {
  description = "Opcjonalny health check"
  type        = string
  default     = null
}

variable "failover_type" {
  description = "PRIMARY lub SECONDARY dla failover"
  type        = string
  default     = null
}

variable "geolocation" {
  description = "Mapa: {continent, country, subdivision}"
  type = object({
    continent   = string
    country     = string
    subdivision = string
  })
  default = null
}

variable "latency_region" {
  description = "Region dla latency routing"
  type        = string
  default     = null
}

variable "weight" {
  description = "Waga dla weighted routing"
  type        = number
  default     = null
}

variable "multivalue_answer" {
  description = "Multivalue answer routing policy"
  type        = bool
  default     = null
}

variable "allow_overwrite" {
  description = "Zezwolenie na nadpisanie istniejącego rekordu"
  type        = bool
  default     = false
}
