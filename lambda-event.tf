resource "aws_cloudwatch_event_rule" "buienradar" {
  name                = "${var.prefix}-cloudwatch-event"
  description         = "Fetching Forecast, by running the lambda function"
  schedule_expression = var.schedule_expression

  tags = {
    Name      = "${var.prefix}-cloudwatch-event"
    yor_trace = "00a14ab0-ffd4-4a5e-aea1-0d27ff47009c"
  }
}

resource "aws_cloudwatch_event_target" "buienradar" {
  rule      = aws_cloudwatch_event_rule.buienradar.name
  arn       = aws_lambda_function.buienradar.arn
  target_id = "execute-lambda"
}
