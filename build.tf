# null resource deploy code
resource "null_resource" "build" {
  provisioner "local-exec" {
    command  = "echo 'building code' ; docker build -t golang_build . ; docker run --name golang_build_container golang_build ; docker cp golang_build_container:/app/main ./.temp; docker rm golang_build_container"
    # command = "sleep 60"
    interpreter = ["PowerShell", "-Command"]
  }
  triggers = {
    always_run = timestamp()
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "./.temp/main"
  output_path =  "./.temp/main.zip"

  depends_on = [
    null_resource.build
  ]
}