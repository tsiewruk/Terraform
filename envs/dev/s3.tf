module "s3_devops_buckets" {
  source = "../../modules/s3"
  bucket_configs = {
    "devops-bucket-1" = {
      name                = "devops-bucket-1"
      force_destroy       = false
      versioning_enabled  = true
      block_public_access = true
      tags = {
        Environment = "dev"
        Owner       = "DevOps"
        Purpose     = "Infrastructure"
      }
    }
    "devops-bucket-2" = {
      name                = "devops-bucket-2"
      force_destroy       = false
      versioning_enabled  = true
      block_public_access = true
      tags = {
        Environment = "dev"
        Owner       = "DevOps"
        Purpose     = "Backups"
      }
    }
    "devops-bucket-3" = {
      name                = "devops-bucket-3"
      force_destroy       = false
      versioning_enabled  = true
      block_public_access = true
      tags = {
        Environment = "dev"
        Owner       = "DevOps"
        Purpose     = "Logs"
      }
    }
  }
}

module "s3_developer_buckets" {
  source = "../../modules/s3"
  bucket_configs = {
    "developer-bucket-1" = {
      name                = "developer-bucket-1"
      force_destroy       = false
      versioning_enabled  = true
      block_public_access = true
      tags = {
        Environment = "dev"
        Owner       = "Developer"
        Purpose     = "Code"
      }
    }
    "developer-bucket-2" = {
      name                = "developer-bucket-2"
      force_destroy       = false
      versioning_enabled  = true
      block_public_access = true
      tags = {
        Environment = "dev"
        Owner       = "Developer"
        Purpose     = "Artifacts"
      }
    }
    "developer-bucket-3" = {
      name                = "developer-bucket-3"
      force_destroy       = false
      versioning_enabled  = true
      block_public_access = true
      tags = {
        Environment = "dev"
        Owner       = "Developer"
        Purpose     = "Data"
      }
    }
  }
}