locals {
  is_create = length(var.allowed_assume_roles) == 0 ? 0 : 1
}
