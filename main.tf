# provider aws
provider "aws" {
  region = "us-west-2"
}

# resource iam role with policy to invoke lambda
# form many methods, use the same role
resource "aws_iam_role" "role" {

  name = "${var.ROLE_NAME}-${terraform.workspace}"
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
  function_name    = "${var.LAMBDA_FUNCTION_NAME}-${terraform.workspace}"
  handler          = var.HANDLER
  filename         = data.archive_file.lambda_zip.output_path
  role             = aws_iam_role.role.arn
  runtime          = "go1.x"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  depends_on       = [data.archive_file.lambda_zip]
  timeouts {
    create = "1m"
  }

  environment {
    variables = var.ENVIRONMENTS
  }
}

// data "aws_caller_identity" "current" {}

// lambda permisson
// resource "aws_lambda_permission" "apigw_lambda" {
//   count = var.API_ID != "" ? 1 : 0
// 
//   statement_id  = "AllowExecutionFromAPIGateway"
//   action        = "lambda:InvokeFunction"
//   function_name = aws_lambda_function.lambda_function.function_name
//   principal     = "apigateway.amazonaws.com"
//   source_arn    = "arn:aws:execute-api:us-west-2:${data.aws_caller_identity.current.account_id}:${var.API_ID}/*/*/*"
// }