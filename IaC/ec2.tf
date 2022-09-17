


# resource "aws_instance" "ec2_back_end" {
#     ami = var.ec2_back_end_ami
#     instance_type = var.ec2_back_end_type
#     # subnet_id = var.tcb_blog_subnet_public_id
#     vpc_security_group_ids = [var.security_group_ec2_back_end]
#     associate_public_ip_address = false
# }