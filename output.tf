output "lambda_function_name" {
  value = resource.aws_lambda_function.lambda_function.function_name
}

output "lambda_function_arn" {
  value = resource.aws_lambda_function.lambda_function.arn
}