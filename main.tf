# provider aws

# resource iam role with policy to invoke lambda
resource "aws_iam_role" "role" {
  name = local.name_role
  // assume role policy lambda
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


# deploye lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name    = local.NAME_FUNCTION
  filename         = data.archive_file.lambda_zip.output_path
  handler          = local.handler
  role             = aws_iam_role.role.arn
  runtime          = "go1.x"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  depends_on       = [data.archive_file.lambda_zip]
  timeouts {
    create = "1m"
  }
}


# api gateway
// create api gateway resource
resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.API_ID
  parent_id   = var.PARENT_ID
  path_part   = local.PATH_PART
}

// create api gateway method
resource "aws_api_gateway_method" "method" {
  rest_api_id      = var.API_ID
  resource_id      = aws_api_gateway_resource.resource.id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = true
}

// create api gateway integration
resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = var.API_ID
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_function.invoke_arn
}

// lambda permisson
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:us-west-2:${var.AWS_ACCOUNT_ID}:${var.API_ID}/${var.API_STAGE}/*/*"
}