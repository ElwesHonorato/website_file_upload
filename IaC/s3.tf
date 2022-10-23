############################################################################################################################
#### Bronze Bucket #########################################################################################################
############################################################################################################################
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

# Create empty Folder SCHEMAS
resource "aws_s3_object" "dev_bucket_bronze_schemas_source" {
  bucket = aws_s3_bucket.dev_bucket_bronze.id
  key = "SCHEMAS_SOURCE/"
  content_type = "application/x-directory"
}

# Create empty Folder WRONG_FORMAT
resource "aws_s3_object" "dev_bucket_bronze_wrong_format" {
  bucket = aws_s3_bucket.dev_bucket_bronze.id
  key = "WRONG_FORMAT/"
  content_type = "application/x-directory"
}

# Create empty Folder SCHEMA_LESS
resource "aws_s3_object" "dev_bucket_bronze_schema_less" {
  bucket = aws_s3_bucket.dev_bucket_bronze.id
  key = "SCHEMA_LESS/"
  content_type = "application/x-directory"
}

# Create empty Folder MOVED
resource "aws_s3_object" "dev_bucket_bronze_moved" {
  bucket = aws_s3_bucket.dev_bucket_bronze.id
  key = "MOVED/"
  content_type = "application/x-directory"
}

############################################################################################################################
#### Silver Bucket #########################################################################################################
############################################################################################################################
resource "aws_s3_bucket" "dev_bucket_silver" {
  bucket = "${var.project}-${var.dev_environment}-${var.bucket_silver}"

  tags = {
    Stage       = "INSOURCE"
    Environment = "DEV"
  }
}

# Create empty Folder INSOURCE
resource "aws_s3_object" "dev_bucket_silver_insource" {
  bucket = aws_s3_bucket.dev_bucket_silver.id
  key = "INSOURCE/"
  content_type = "application/x-directory"
}


############################################################################################################################
#### Golden Bucket #########################################################################################################
############################################################################################################################
resource "aws_s3_bucket" "dev_bucket_gold" {
  bucket = "${var.project}-${var.dev_environment}-${var.bucket_gold}"

  tags = {
    Stage       = "INSOURCE"
    Environment = "DEV"
  }
}

# Create empty Folder INSOURCE
resource "aws_s3_object" "dev_bucket_gold_insource" {
  bucket = aws_s3_bucket.dev_bucket_gold.id
  key = "INSOURCE/"
  content_type = "application/x-directory"
}