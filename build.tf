# null resource deploy code
resource "null_resource" "build" {
  provisioner "local-exec" {
    command  = local.is_linux ?"echo 'building code' && mkdir -p temp && docker build -t golang_build . && docker run --name golang_build_container golang_build && docker cp golang_build_container:/app/main ./temp && docker rm golang_build_container" : "echo 'building code' ; docker build -t golang_build . ; docker run --name golang_build_container golang_build ; docker cp golang_build_container:/app/main ./temp; docker rm golang_build_container"
    # command = "sleep 60"
  }
  triggers = {
    always_run = timestamp()
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "./temp/main"
  output_path =  "./temp/main.zip"

  depends_on = [
    null_resource.build
  ]
}

// obtain current so
locals {
  is_linux = length(regexall("/home/", lower(abspath(path.root)))) > 0
}
