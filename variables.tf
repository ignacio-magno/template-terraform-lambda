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

variable "NAME_ROLE" {
  type = string
}

variable "NAME_FUNCTION"{
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
  ENVIRONMENT = jsonencode(file(var.PATH_ENVIRONMENT))
}