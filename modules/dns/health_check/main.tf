resource "aws_route53_health_check" "this" {
  fqdn              = var.fqdn
  type              = var.type
  resource_path     = var.resource_path
  port              = var.port
  failure_threshold = var.failure_threshold
  request_interval  = var.request_interval
}
