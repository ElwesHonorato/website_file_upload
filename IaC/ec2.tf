


resource "aws_instance" "ec2_backend" {
    ami = var.ec2_backend_ami
    instance_type = var.ec2_backend_type
    # subnet_id = var.tcb_blog_subnet_public_id
    vpc_security_group_ids = [var.security_group_ec2_backend]
    associate_public_ip_address = false
}