
resource "aws_s3_bucket" "dev_bucket_bronze" {
  bucket = "${var.project}-${var.dev_environment}-${var.bucket_bronze}"

  tags = {
    Stage       = "INSOURCE"
    Environment = "DEV"
  }
}

# Create empty Folder INSOURCE
resource "aws_s3_object" "dev_bucket_bronze_insource" {
  bucket = aws_s3_bucket.dev_bucket_bronze.id
  key = "INSOURCE/"
  content_type = "application/x-directory"
}


