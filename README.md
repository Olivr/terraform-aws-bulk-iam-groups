# terraform-aws-bulk-iam-groups

Create many AWS IAM groups at once.

## Examples

Each property of the `groups` object is the name of the group and its value is a `group` object

The `group` object can take the following properties:

| Name         | Description                                  | Type           | Required |
| ------------ | -------------------------------------------- | -------------- | :------: |
| policies     | List of policies to attach                   | `list(string)` |    no    |
| assume_roles | List of roles users of this group can assume | `list(string)` |    no    |

### Complete example

```hcl
module "iam_groups" {
  source = "github.com/olivr-com/terraform-aws-bulk-iam-groups"

  groups = {
    SuperAdministrators = {
      policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
      assume_roles = [
        "arn:aws:iam::111111111111:role/AdministratorRole",
        "arn:aws:iam::222222222222:role/AdministratorRole"
      ]
    }

    Administrators = {
      policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
    }

    SomeOtherGroup = {}
}

output "iam_groups" {
  value = module.iam_groups.groups
}
```

<!-- auto-terraform-docs -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.24 |
| aws | ~> 2.58 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.58 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| groups | Groups to create. See [\_var\_groups.example.json](\_var\_groups.example.json) | `map(map(list(string)))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| groups | Created groups in the format `{ name = { name, arn }}` |

<!-- auto-terraform-docs -->

## Similar modules

- [terraform-aws-bulk-iam-roles](https://github.com/olivr-com/terraform-aws-bulk-iam-roles)
- [terraform-aws-bulk-iam-users](https://github.com/olivr-com/terraform-aws-bulk-iam-users)

<!-- auto-support -->

## Support

Create a new issue on this GitHub repository.

<!-- auto-support -->
<!-- auto-contribute -->

## Contributing

All contributions are welcome! Please see the [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md)

<!-- auto-contribute -->
<!-- auto-license -->
## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details

<!-- auto-license -->
<!-- auto-about-org -->

## About olivr

[Olivr](https://olivr.com) is an AI co-founder for your startup.

<!-- auto-about-org -->
