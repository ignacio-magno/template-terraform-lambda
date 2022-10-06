// set values
variable "LAMBDA_FUNCTION_NAME" {
  type    = string
}

// if not exist path environment set ""
variable "ENVIRONMENTS" {
  type    = map(string)
  default = {
    "PATH" = ""
  }
}

variable "ROLE_NAME" {
  type    = string
}

variable "HANDLER" {
  type    = string
  default = "main"
}
