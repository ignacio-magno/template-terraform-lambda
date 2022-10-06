# null resource deploy code
resource "null_resource" "build" {
  provisioner "local-exec" {
    command  = local.is_linux ? "docker build -t build-golang-code -f Dockerfile . && docker compose up" : "docker build -t build-golang-code -f Dockerfile . ; docker compose up"
    interpreter = local.is_linux ? ["/bin/bash", "-c"] : ["PowerShell", "-Command"]
    working_dir = path.module
  }
  triggers = {
    always_run = timestamp()
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/temp/main"
  output_path =  "${path.module}/temp/main.zip"

  depends_on = [
    null_resource.build
  ]
}

// obtain current so
locals {
    is_linux = length(regexall("/home/", lower(abspath(path.root)))) > 0
}