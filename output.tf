resource "local_file" "results" {
  filename = "${path.module}/results.json"
  content = jsonencode({
    "name_function" = local.name_function
    "arn_function"  = aws_lambda_function.lambda_function.arn
    "updated_at"    = timestamp()
    "timeout"       = aws_lambda_function.lambda_function.timeout
    "url_api"       = "https://${var.API_ID}.execute-api.us-west-2.amazonaws.com/${var.API_STAGE}/test"
    "method"        = aws_api_gateway_method.method.http_method
  })
}

output "id_method" {
  value = aws_api_gateway_integration.integration.id
}