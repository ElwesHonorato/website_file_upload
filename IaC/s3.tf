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