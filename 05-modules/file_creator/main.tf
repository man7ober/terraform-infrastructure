resource "local_file" "file1" {
  content  = var.file1_content
  filename = "${path.module}/${var.file1_name}"
}

resource "local_file" "file2" {
  content  = var.file2_content
  filename = "${path.module}/${var.file2_name}"
}
