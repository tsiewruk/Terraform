resource "aws_route53_record" "this" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type

  ttl     = var.ttl
  records = var.records

  dynamic "alias" {
    for_each = var.alias != null ? [var.alias] : []
    content {
      name                   = lookup(alias.value, "name", null)
      zone_id                = lookup(alias.value, "zone_id", null)
      evaluate_target_health = lookup(alias.value, "evaluate_target_health", false)
    }
  }

  set_identifier  = var.set_identifier
  health_check_id = var.health_check_id

  dynamic "failover_routing_policy" {
    for_each = var.failover_type != null ? [var.failover_type] : []
    content {
      type = failover_routing_policy.value
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = var.geolocation != null ? [var.geolocation] : []
    content {
      continent   = lookup(geolocation.value, "continent", null)
      country     = lookup(geolocation.value, "country", null)
      subdivision = lookup(geolocation.value, "subdivision", null)
    }
  }

  dynamic "latency_routing_policy" {
    for_each = var.latency_region != null ? [var.latency_region] : []
    content {
      region = latency_routing_policy.value
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = var.weight != null ? [var.weight] : []
    content {
      weight = weighted_routing_policy.value
    }
  }

  multivalue_answer_routing_policy = var.multivalue_answer
  allow_overwrite                  = var.allow_overwrite
}
