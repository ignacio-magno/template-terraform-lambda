// set values variables

// dont touch
locals {

  LOCAL_DATA = jsondecode(file("${path.module}/terraform.tfvars.json"))

  // values variables obtained of file
  NAME_FUNCTION = "${local.LOCAL_DATA.LAMBDA_FUNCTION_NAME}-${var.workspace}"
  PATH_PART     = local.LOCAL_DATA.PATH_PART
  METHODS       = local.LOCAL_DATA.METHODS

  file_name = "${path.module}/.temp/main.zip"
  handler   = "main"
  name_role = "${local.LOCAL_DATA.LAMBDA_FUNCTION_NAME}-${var.workspace}-role"
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
