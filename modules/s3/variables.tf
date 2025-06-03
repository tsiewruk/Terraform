variable "bucket_configs" {
  description = "Map of bucket configurations"
  type = map(object({
    name                = string
    force_destroy       = bool
    versioning_enabled  = bool
    block_public_access = bool
    tags               = map(string)
  }))
}
