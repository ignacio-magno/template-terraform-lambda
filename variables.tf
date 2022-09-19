variable "lambda-function-name" {
  type = string
  default = "lambda-function-name"
}

locals {
  name_function = "${lambda-function-name}-${var.workspace}"
  file_name     = "${path.module}/.temp/main.zip"
  handler       = "main"
  name_role     = "${lambda-function-name}-${var.workspace}-role"
}

variable "workspace" {
  type = string
}

variable "PARENT_ID" {
  type = string
}

variable "API_ID" {
  type = string
}

variable "API_STAGE" {
  type = string
}

variable "AWS_ACCOUNT_ID" {
  type = string
}
