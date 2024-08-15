############################
# TERRAGRUNT CONFIGURATION #
############################

locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  
}

inputs = merge(
  local.environment_vars.locals
)

// # ---------------------------------------------------------------------------------------------------------------------
// # GLOBAL PARAMETERS
// # These variables apply to all configurations in this subfolder. These are automatically merged into the child
// # `terragrunt.hcl` config via the include block.
// # ---------------------------------------------------------------------------------------------------------------------

// # Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
// # where terraform_remote_state data sources are placed directly into the modules.
// inputs = merge(
//   local.account_vars.locals,
//   local.region_vars.locals,
//   local.environment_vars.locals,
// )


// # корневой terragrunt.hcl

// locals { # переменные общие для всего проекта
//   env_vars   = read_terragrunt_config(find_in_parent_folders("env.hcl")) # Функция read_terragrunt_config() используется для чтения конфига env.hcl (group.hcl),
//   group_vars = read_terragrunt_config(find_in_parent_folders("group.hcl")) # найденного с помощью функции find_in_parent_folders() в этой директории или вышележащих директориях до корневой директории.
//   project_id = "43542597" # project_id в gitlab
//   env        = "dev" # Переменная, которая описывает директорию dev как dev окружение в этом проекте.
//   username   = "anton_patsev" # ваш login в gitlab
//   string_path_relative_to_include = join(".", [replace("${path_relative_to_include()}", "/", "-"), "tfstate"]) # получение из пути dev/group1/dns получить имя tfstate: dev-group1-dns.tfstate
// }

// inputs = merge({
//   # merge в terragrunt используется для объединения входных параметров из нескольких источников.
//   # Это позволяет использовать общие параметры для нескольких конфигураций Terraform,
//   # а также позволяет переопределять параметры для конкретной конфигурации.
//   cloud_id   = local.env_vars.locals.cloud_id
//   folder_id  = local.env_vars.locals.folder_id
//   network_id = local.group_vars.locals.network_id
// })

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    endpoint = "http://127.0.0.1:9000"
    bucket         = "terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    access_key     = "minioadmin"
    secret_key     = "minioadmin"
    use_path_style = true
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_region_validation = true
  }
}
EOF
}