// dont touch
variable "WORKSPACE" {
  type = string
}

variable "API_ID" {
  type = string
}

variable "API_STAGE" {
  type = string
}

variable "ROLE_NAME" {
  type = string
}

variable "LAMBDA_FUNCTION_NAME"{
    type = string
}

variable "HANDLER" {
    type = string
}

variable "PATH_ENVIRONMENT" {
    type = string
}

// environments private
locals{
  ENVIRONMENT = var.PATH_ENVIRONMENT != "" ?  fileexists(var.PATH_ENVIRONMENT) ? jsondecode(file(var.PATH_ENVIRONMENT)) : {} : {}
}

// read json environments
