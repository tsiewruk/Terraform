resource "aws_route53_key_signing_key" "this" {
  hosted_zone_id                = var.hosted_zone_id
  key_management_service_arn    = var.kms_arn
  name                         = var.name
  status                       = "ACTIVE"
}

resource "aws_route53_hosted_zone_dnssec" "this" {
  hosted_zone_id = var.hosted_zone_id
}
