// set values
variable "LAMBDA_FUNCTION_NAME" {
  type    = string
  default = "test-22"
}

// if not exist path environment set ""
variable "ENVIRONMENTS" {
  type    = map
  default = {}
}

variable "ROLE_NAME" {
  type    = string
  default = "test-22-rol"
}

variable "HANDLER" {
  type    = string
  default = "main"
}
