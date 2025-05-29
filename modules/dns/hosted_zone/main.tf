resource "aws_route53_zone" "this" {
  name    = var.zone_name
  comment = var.comment
  tags    = var.tags

  dynamic "vpc" {
    for_each = var.vpc_id != null ? [var.vpc_id] : []
    content {
      vpc_id = vpc.value
    }
  }
}
