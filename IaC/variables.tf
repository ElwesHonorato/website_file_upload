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
variable "ec2_back_end_ami" {
  default = "ami-02f3416038bdb17fb"
}
variable "ec2_back_end_type" {
  default = "t2.micro"
}
