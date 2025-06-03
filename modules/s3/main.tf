resource "aws_s3_bucket" "this" {
  for_each = var.bucket_configs

  bucket        = each.value.name
  force_destroy = each.value.force_destroy
  tags          = each.value.tags
}

resource "aws_s3_bucket_versioning" "this" {
  for_each = aws_s3_bucket.this

  bucket = each.value.id
  versioning_configuration {
    status = var.bucket_configs[each.key].versioning_enabled ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  for_each = aws_s3_bucket.this

  bucket                  = each.value.id
  block_public_acls       = var.bucket_configs[each.key].block_public_access
  block_public_policy     = var.bucket_configs[each.key].block_public_access
  ignore_public_acls      = var.bucket_configs[each.key].block_public_access
  restrict_public_buckets = var.bucket_configs[each.key].block_public_access
}
