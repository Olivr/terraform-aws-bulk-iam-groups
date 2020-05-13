variable "groups" {
  type        = map(map(list(string)))
  description = "Groups to create. See [_var_groups.example.json](_var_groups.example.json)"
}
