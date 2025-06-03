output "bucket_names" {
  description = "Names of created buckets"
  value       = [for b in aws_s3_bucket.this : b.id]
}
