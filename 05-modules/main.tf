# Modules

module "create_files" {
  source        = "./file_creator"
  file1_name    = "my_first_file.txt"
  file1_content = "This is first file"
  file2_name    = "my_second_file.txt"
  file2_content = "This is second file"
}

# Outputs

output "file_paths" {
  value = [
    module.create_files.file1_path,
    module.create_files.file2_path
  ]
}
