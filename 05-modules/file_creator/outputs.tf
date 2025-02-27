output "file1_path" {
  description = "path of file 1"
  value       = local_file.file1.filename
}

output "file2_path" {
  description = "path of file 2"
  value       = local_file.file2.filename
}
