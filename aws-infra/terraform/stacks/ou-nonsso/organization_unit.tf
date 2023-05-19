resource "aws_organizations_organizational_unit" "nonsso_ou" {
  name      = "Non-SSO"
  parent_id = data.aws_organizations_organization.dl.roots[0].id

  tags = merge(module.this.tags, {
    Name = "dl-aws-nonsso"
  })
}
