#### PROJECT NAME
variable "project" {
  default = "fs000"
}

#### PROVIDER SPECIFICATIONS
variable "region" {
  default = "us-east-2"
}

#### ENVIRONMENTS
variable "dev_environment" {
  default = "dev-env"
}

variable "prod_environment" {
  default = "prod-environment"
}

#### BUCKETS - Bronze / Silver / Gold
variable "bucket_bronze" {
  default = "bucket-bronze"
}

variable "bucket_silver" {
  default = "bucket-silver"
}

variable "bucket_gold" {
  default = "bucket-gold"
}