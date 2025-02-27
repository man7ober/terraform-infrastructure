resource "local_file" "example1" {
  filename = "${path.module}/hello.txt"
  content  = "Hey, this is Mayank Nagora!"
}

resource "local_sensitive_file" "example2" {
  content  = "This is a sensitive file!"
  filename = "${path.module}/sensitive.txt"
}
