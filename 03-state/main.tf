resource "local_file" "example1" {
  content  = "This is a demo content - 1"
  filename = "${path.module}/example1.txt"
}

resource "local_file" "example2" {
  content  = "This is a demo content - 2"
  filename = "${path.module}/example2.txt"
}

resource "local_sensitive_file" "tf_sensitive" {
  content  = "Confidential file"
  filename = "${path.module}/sensitive.txt"
}
