variable "groups" {
  type        = map(map(list(string)))
  description = "Groups to create"
}
