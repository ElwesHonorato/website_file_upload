resource "aws_ecr_repository" "images_repository" {
  name                 = "${var.project}-images_repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}