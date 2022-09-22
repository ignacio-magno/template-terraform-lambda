// set values
variable "LAMBDA_FUNCTION_NAME" {
  type    = string
  default = "test-22"
}

// if not exist path environment set ""
variable "PATH_ENVIRONMENT" {
  type    = string
  default = ""
}

variable "ROLE_NAME" {
  type    = string
  default = "test-22-rol"
}

variable "HANDLER" {
  type    = string
  default = "main"
}

// environments private
locals {
  ENVIRONMENT = var.PATH_ENVIRONMENT != "" ? fileexists(var.PATH_ENVIRONMENT) ? jsondecode(file(var.PATH_ENVIRONMENT)) : {} : {}
}