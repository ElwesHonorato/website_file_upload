data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}



resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}



resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = "${aws_iam_role.ecsTaskExecutionRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}






########################## S3 ##############################################################################
data "aws_iam_policy_document" "bronze_bucket_access_document" {
  statement {
    sid = "allowS3"
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = [
      "*"
    ]
  }
  # statement {
  #   sid = "allowListBucket"
  #   actions = [
  #     "s3:ListBucket",
  #   ]
  #   resources = [
  #     "arn:aws:s3:::test-ndgegy4364gdu-source-bucket",
  #     "arn:aws:s3:::test-ndgegy4364gdu-source-bucket/images/*"
  #   ]
  }


resource "aws_iam_policy" "bronze_bucket_access_policy" {
  name        = "bronze_bucket_access_policy"
  description = "Access to Bronze Bucket - Project File Submission - FS00"
  path        = "/"

  policy = data.aws_iam_policy_document.bronze_bucket_access_document.json
}

resource "aws_iam_role" "bronze_bucket_access_role" {
  name        = "bronze_bucket_access_role"
  description = "Access to Bronze Bucket - Project File Submission - FS00"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "bronze_bucket_access_policy_attachment" {
  role       = aws_iam_role.bronze_bucket_access_role.name
  policy_arn = aws_iam_policy.bronze_bucket_access_policy.arn
}