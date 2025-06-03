# AWS S3 Bucket Module

This Terraform module creates and configures AWS S3 buckets with common security settings and versioning options.

## Features

- Creates multiple S3 buckets with specified names
- Configures bucket versioning
- Manages public access block settings
- Supports custom tags
- Configurable force destroy option

## Usage

The module can be instantiated multiple times for different purposes. Here's an example of how it's currently used in the development environment:

```hcl
# DevOps buckets
module "s3_devops_buckets" {
  source = "../../modules/s3"
  
  bucket_names = ["devops-bucket-1", "devops-bucket-2", "devops-bucket-3"]
  
  versioning_enabled   = true
  block_public_access  = true
  force_destroy        = false
  
  tags = {
    Environment = "dev"
    Owner       = "DevOps"
  }
}

# Developer buckets
module "s3_developer_buckets" {
  source = "../../modules/s3"
  
  bucket_names = ["developer-bucket-1", "developer-bucket-2", "developer-bucket-3"]
  
  versioning_enabled   = true
  block_public_access  = true
  force_destroy        = false
  
  tags = {
    Environment = "dev"
    Owner       = "Developers"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| aws | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket_names | List of bucket names to create | `list(string)` | n/a | yes |
| tags | Tags to apply to the buckets | `map(string)` | `{}` | no |
| versioning_enabled | Whether to enable versioning | `bool` | `false` | no |
| block_public_access | Whether to block public access | `bool` | `true` | no |
| force_destroy | Whether to delete bucket contents on destroy | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_names | Names of created buckets |

## Security

By default, this module:
- Blocks all public access to the buckets
- Enables versioning (if specified)
- Applies security best practices for S3 bucket configuration

## Notes

- The `force_destroy` parameter should be used with caution as it will delete all objects in the bucket when the bucket is destroyed
- Bucket names must be globally unique across all AWS accounts
- Versioning cannot be disabled once enabled (it can only be suspended)

## Current Configuration

The module is currently used in the development environment with two separate instances:

1. DevOps Buckets:
   - Creates three S3 buckets for DevOps team use
   - Bucket names: devops-bucket-1, devops-bucket-2, devops-bucket-3
   - Tagged with Owner: DevOps

2. Developer Buckets:
   - Creates three S3 buckets for Developer team use
   - Bucket names: developer-bucket-1, developer-bucket-2, developer-bucket-3
   - Tagged with Owner: Developers

Both instances:
- Enable versioning
- Block public access
- Prevent accidental deletion of bucket contents
- Tag buckets with Environment information

## License

MIT
