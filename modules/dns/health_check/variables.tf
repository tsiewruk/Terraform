variable "fqdn" {
  description = "FQDN do sprawdzenia"
  type        = string
}

variable "type" {
  description = "Typ health checka (HTTP, HTTPS, TCP)"
  type        = string
  default     = "HTTP"
}

variable "resource_path" {
  description = "Ścieżka resource"
  type        = string
  default     = "/"
}

variable "port" {
  description = "Port"
  type        = number
  default     = 80
}

variable "failure_threshold" {
  description = "Ilość błędów do uznania za failed"
  type        = number
  default     = 3
}

variable "request_interval" {
  description = "Częstotliwość requestów"
  type        = number
  default     = 30
}
