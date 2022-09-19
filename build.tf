# null resource deploy code
resource "null_resource" "build" {
  provisioner "local-exec" {
    command     = "echo 'building code' && go build -o ./template-terraform-lambda/.temp/main main.go"
    working_dir = "${path.module}/.."
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/.temp/main"
  output_path = local.file_name

  depends_on = [
    null_resource.build
  ]
}

#go build -o ../businesses/obtain_business/template-terraform-lambda/.temp/main ../businesses/obtain_business/template-terraform-lambda/../main.go