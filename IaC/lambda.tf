resource "aws_lambda_function" "executa_emr": {
    filename = "lambda_function_payload.zip"
    function_name = var.lambda_function_name
    role = aws_iam_role.lambda.arn
    handler = "lambda_function.handler"
    memory_size = 128
    timeout = 30

    runtime = "python3.8"

}