# CAPS Project Infrastructure
# Step 1: S3 bucket for static site origin

resource "random_id" "suffix" {
    byte_length = 4
}

resource "aws_s3_bucket" "site" {
    bucket = "caps-site-${random_id.suffix.hex}"

    tags = {
        Project = "CAPS"
        Owner   = "jdcarbon"
        Env     = "dev"
    }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.site.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.site.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
