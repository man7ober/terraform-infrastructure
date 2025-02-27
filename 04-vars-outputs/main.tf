locals {
  environment = upper("prod") # dev, stage and prod
  base_path   = "${path.module}/configs/${local.environment}"
}

resource "local_file" "server_config_1" {
  filename = "${local.base_path}/${var.server_1}.sh"
  content  = <<EOT
    environment = ${local.environment}
    port = 1234
    EOT
}

resource "local_file" "server_configs_2" {
  filename = "${local.base_path}/${var.server_2}.sh"
  content  = <<EOT
    environment = ${local.environment}
    port = 1234
    EOT
}

resource "local_file" "server_config_3" {
  filename = "${local.base_path}/${var.server_3}.sh"
  content  = <<EOT
    environment = ${local.environment}
    port = 1234
    EOT
}

# Outputs

output "server_id" {
  value = local_file.server_config_1.id
}
