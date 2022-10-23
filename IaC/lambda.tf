# data "archive_file" "lambda-archive" {
#   type        = "zip"
#   source_file = "lambda/src/main.py"
#   output_path = "lambda/packages/lambda_function.zip"
# }

# resource "aws_lambda_layer_version" "python38-pandas-layer" {
#   filename            = "lambda/packages/Python3-pandas.zip"
#   layer_name          = "Python3-pandas"
#   source_code_hash    = "${filebase64sha256("lambda/packages/Python3-pandas.zip")}"
#   compatible_runtimes = ["python3.8"]
# }
# resource "aws_lambda_function" "lambda-function" {
#   filename         = "lambda/packages/lambda_function.zip"
#   function_name    = "layered-test"
#   role             = "${aws_iam_role.lambda_bronze_silver_bucket_access_policy_attachment.arn}"
#   handler          = "main.handle"
#   source_code_hash = "${data.archive_file.lambda-archive.output_base64sha256}"
#   runtime          = "python3.8"
#   timeout          = 15
#   memory_size      = 128
#   layers           = ["${aws_lambda_layer_version.python38-pandas-layer.arn}"]
# }




data "archive_file" "python_lambda_package" {  
  type = "zip"  
  source_file = "/lambda/lambda_function.py" 
  output_path = "python_lambda_package.zip"
}
resource "aws_lambda_function" "lambda_function_bucket_movements" {
        function_name = "lambda_function_bucket_movements"
        filename      = "python_lambda_package.zip"
        source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
        role          = "${aws_iam_role.lambda_bronze_silver_bucket_access_policy_attachment.arn}"
        runtime       = "python3.8"
        handler       = "lambda_function.lambda_handler"
        timeout       = 10
}