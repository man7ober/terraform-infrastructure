terraform {
  backend "local" {
    path = "C:/Users/Mayank-PC/Architect/TerraForm-Infras/03-state/state-file/state-file/terraform.tfstate"
  }

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}
