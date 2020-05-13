variable "groups" {
  type        = map(map(list(string)))
  description = "Groups to create. See [_var_groups.example.tfvars.json](_var_groups.example.tfvars.json)"
}
