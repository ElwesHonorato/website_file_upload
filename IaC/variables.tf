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



#### SECURITY
variable "vpc_fs" {
  default = "vpc-3a019c51"
}



#### EC2
variable "ec2_backend_ami" {
  default = "ami-052efd3df9dad4825"
}
variable "ec2_backend_type" {
  default = "t2.micro"
}
