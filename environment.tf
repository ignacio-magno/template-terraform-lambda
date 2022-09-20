// read file to environment
locals {
    ENVIRONMENTS = jsondecode(file(local.LOCAL_DATA.PATH_ENVIRONMENTS))
}