resource "aws_ecrpublic_repository" "images_repository" {
  repository_name      = "${var.project}-images_repository"


}