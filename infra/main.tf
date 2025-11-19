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