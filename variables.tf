// set values
variable "LAMBDA_FUNCTION_NAME" {
  type    = string
}

variable "ROLE_NAME" {
  type    = string
}

variable "HANDLER" {
  type    = string
  default = "main"
}
