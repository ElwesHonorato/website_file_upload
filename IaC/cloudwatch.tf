# resource "aws_cloudwatch_event_rule" "lambda_function_bucket_movements_trigger" {
#   name                  = "run-lambda_function_bucket_movements"
#   description           = "Schedule lambda_function_bucket_movements"
#   schedule_expression   = "rate(60 minutes)"
# }

# resource "aws_cloudwatch_event_target" "lambda_function_bucket_movements_target" {
#   target_id = "lambda_function_bucket_movements_target"
#   rule      = aws_cloudwatch_event_rule.lambda_function_bucket_movements_trigger.name
#   arn       = aws_lambda_function.lambda_function_bucket_movements.arn
# }